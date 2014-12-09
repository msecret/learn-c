#include <unistd.h>
#include <apr_errno.h>
#include <apr_file_io.h>

#include "db.h"
#include "bstrlib.h"
#include "dbg.h"

static FILE *DB_open(const char *path, const char *mode)
{
  return fopen(path, mode);
}

static void DB_close(FILE *db)
{
  fclose(db);
}

static bstring DB_load()
{
  FILE *db = NULL;
  bstring data = NULL;

  db = DB_open(DB_FILE, "r");
  check(db, "Failed to open db: %s", DB_FILE);

  data = bread((bNread)fread, db);
  check(data, "Failed to read db from file: %s", DB_FILE);

  rc = DB_close(db);
  check(rc, "Failed to close db from file: %s", DB_FILE);

  return data;

error:
  if (db) DB_close(db);
  if (data) bdestroy(data);
  return NULL;
}

int DB_update(const char *url)
{
  if (DB_read(url)) {
    log_info("Already inserted record skipping: %s", url);
  }

  FILE *db = DB_open(DB_FILE, "a+");
  check(db, "Failed to open db: %s", DB_FILE);

  bstring line = bfromcstr(url);
  //check(data, "Url invalid string %s", url);
  bconchar(line, '\n');
  int rc = fwrite(line->data, blength(line), 1, db);
  check(rc == 1, "Failed to append to the db.");

  return 0;

error:
  if(db) DB_close(db);
  return -1;
}
