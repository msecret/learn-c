#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <string.h>

struct Person {
  char *name;
  int age;
  int height;
  int weight;
};

struct Person Person_create(char *name, int age, int height, int weight)
{
  // allocate memory amount of size of person struct, returns a pointer.
  struct Person who;
  //struct Person *who = malloc(sizeof(struct Person));
  // ensure the pointer isn't null, maybe due to memory problem.
  //assert(who != NULL);

  // ensure the string is copied, not passed as a pointer to the original
  // string.
  who.name = strdup(name);
  who.age = age;
  who.height = height;
  who.weight = weight;

  return who;
}

void Person_destroy(struct Person *who)
{
  // ensure memory to free is not null.
  assert(who != NULL);

  // name was copied so is separate memory block.
  free(who->name);
  free(who);
}

void Person_print(struct Person who)
{
  printf("name: %s\n", who.name);
  printf("\tage: %d\n", who.age);
  printf("\theight: %d\n", who.height);
  printf("\twidth: %d\n", who.weight);
}

int main(int argc, char *argv[])
{
  // create a new pointer to a new person struct.
  struct Person joe = Person_create(
    "Joe Poop", 32, 64, 140);

  struct Person frank = Person_create(
    "Frank Moop", 20, 72, 180);

  // print out the pointer location of the struct.
  //printf("joe mem: %p\n", joe);
  Person_print(joe);

  //printf("frank mem: %p\n", frank);
  Person_print(frank);

  /*
  // modify the struct fields.
  joe->age += 20;
  joe->height -= 2;
  joe->weight += 40;
  Person_print(joe);

  frank->age +=20;
  Person_print(frank);

  Person_destroy(joe);
  Person_destroy(frank);
  */

  return 0;
}
