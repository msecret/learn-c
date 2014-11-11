#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

#define MAX_DATA 512
#define MAX_ROWS 100

struct Address {
  int id;
  int set;
  char name[MAX_DATA];
  char email[MAX_DATA];
  char sex;
};

struct Database {
  struct Address rows[MAX_ROWS];
};

struct Connection {
  FILE *file;
  struct Database *db;
};

void die(const char *message)
{
  if (errno) {
    perror(message);
  } else {
    printf("ERROR: %s\n", message);
  }

  exit(1);
}

void Address_print(struct Address *addr)
{
  printf("%d %s %s %c\n", addr->id, addr->name, addr->email, addr->sex);
}

void Database_load(struct Connection *conn)
{
  int rc = fread(conn->db, sizeof(struct Database), 1, conn->file);
  if (rc != 1) die("load fail");
}

struct Connection *Database_open(const char *filename, char mode)
{
  struct Connection *conn = malloc(sizeof(struct Connection));
  if (!conn) die("mem error");

  conn->db = malloc(sizeof(struct Database));
  if (!conn->db) die("mem error");

  if (mode == 'c') {
    conn->file = fopen(filename, "w");
  } else {
    conn->file = fopen(filename, "r+");

    if (conn->file) {
      Database_load(conn);
    }
  }
  if (!conn->file) die("failed to open file");

  return conn;
}

void Database_close(struct Connection *conn)
{
  if (conn) {
    if (conn->file) fclose(conn->file);
    if (conn->db) free(conn->db);
    free(conn);
  }
}

void Database_write(struct Connection *conn)
{
  rewind(conn->file);

  int rc = fwrite(conn->db, sizeof(struct Database), 1, conn->file);
  if (rc != 1) die("failed to write");

  rc = fflush(conn->file);
  if (rc == -1) die("failed to flush");
}

void Database_create(struct Connection *conn)
{
  int i;

  for (i = 0; i < MAX_ROWS; i++) {
    // make a prototype.
    struct Address addr = {.id = i, .set = 0};
    // assign it.
    conn->db->rows[i] = addr;
  }
}

void Database_set(struct Connection *conn,
    int id, const char *name, const char *email, const char sex)
{
  struct Address *addr = &conn->db->rows[id];
  if (addr->set) die("row already set");

  addr->set = 1;

  addr->sex = sex;

  char *res = strncpy(addr->name, name, MAX_DATA);
  if (!res) die("name copy failed");

  res = strncpy(addr->email, email, MAX_DATA);
  if (!res) die("email copy failed");
}

void Database_get(struct Connection *conn, int id)
{
  struct Address *addr = &conn->db->rows[id];

  if (addr->set) {
    Address_print(addr);
  } else {
    die("id not set");
  }
}

void Database_delete(struct Connection *conn, int id)
{
  struct Address addr = {.id = id, .set = 0};
  conn->db->rows[id] = addr;
}

void Database_list(struct Connection *conn)
{
  int i;
  struct Database *db = conn->db;

  for (i = 0; i < MAX_ROWS; i++) {
    struct Address *cur = &db->rows[i];

    if (cur->set) {
      Address_print(cur);
    }
  }
}

void Database_find_name(struct Connection *conn, char *name)
{
  int i;
  struct Database *db = conn->db;

  for (i = 0; i < MAX_ROWS; i++) {
    struct Address *cur = &db->rows[i];

    if (cur->set) {
      if (strcmp(cur->name, name) == 0) {
        printf("found: ");
        Address_print(cur);
        return;
      }
    }
  }
  printf("not found %s\n", name);
}

void Database_find_sex(struct Connection *conn, char sex)
{
  int i;
  int found = 0;
  struct Database *db = conn->db;

  for (i = 0; i < MAX_ROWS; i++) {
    struct Address *cur = &db->rows[i];

    if (cur->set) {
      if (cur->sex == sex) {
        found++;
        printf("found: ");
        Address_print(cur);
      }
    }
  }
  if (found > 0) {
    printf("records found: %d\n", found);
  } else {
    printf("records not found");
  }
}

int main(int argc, char *argv[])
{
  if (argc < 3) die("USAGE: ex17 <dbfile> <action> [action params]");

  char *filename = argv[1];
  char action = argv[2][0];
  struct Connection *conn = Database_open(filename, action);
  int id = 0;

  if (argc > 3) id = atoi(argv[3]);
  if (id >= MAX_ROWS) die("access to high of row");
  switch (action) {
    case 'c':
      Database_create(conn);
      Database_write(conn);
      break;

    case 'g':
      if(argc != 4) die("Need an id to get");

      Database_get(conn, id);
      break;

    case 's':
      if (argc != 7) die("Need id, name, email, sex to set");

      Database_set(conn, id, argv[4], argv[5], argv[6][0]);
      Database_write(conn);
      break;

    case 'd':
      if(argc != 4) die("Need id to delete");

      Database_delete(conn, id);
      Database_write(conn);
      break;

    case 'l':
      Database_list(conn);
      break;

    case 'f':
      if(argc < 4) die("Need an name or sex to search");
      char search = argv[3][0];
      if (search == 'n') {
        Database_find_name(conn, argv[4]);
      } else if (search == 's') {
        Database_find_sex(conn, argv[4][0]);
      }
      break;

    default:
      die("Invalid action, only: c=create, g=get, s=set, d=del, l=list");

  }
  Database_close(conn);

  return 0;
}








