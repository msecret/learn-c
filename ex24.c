#include <stdio.h>
#include <stdlib.h>
#include "dbg.h"

#define MAX_DATA 100

typedef enum EyeColor {
  BLUE_EYES, GREEN_EYES, BROWN_EYES,
  BLACK_EYES, OTHER_EYES
} EyeColor;

const char *EYE_COLOR_NAMES[] = {
  "Blue", "Green", "Brown", "Black", "Other"
};

typedef struct Person {
  int age;
  char first_name[MAX_DATA];
  char last_name[MAX_DATA];
  EyeColor eyes;
  float income;
} Person;

int main(int argc, char *argv[])
{
  Person you = {.age = 0};
  int i = 0;
  char *in = NULL;

  printf("what you f name? ");
  in = fgets(you.first_name, MAX_DATA - 1, stdin);
  check(in != NULL, "failed to ready f name");

  printf("what you l name? ");
  in = fgets(you.last_name, MAX_DATA - 1, stdin);
  check(in != NULL, "failed to ready l name");

  char buffer[32];
  printf("how old you? ");
  in = fgets(buffer, MAX_DATA, stdin);
  check(in != NULL, "failed to ready l name");
  you.age = atoi(buffer);

  printf("what yo eyes?\n");
  for (i = 0; i <= OTHER_EYES; i++) {
    printf("%d) %s\n", i+1, EYE_COLOR_NAMES[i]);
  }
  printf("> ");

  int eyes = -1;
  int rc;
  rc = fscanf(stdin, "%d", &eyes);
  check(rc > 0, "eyes needs number");

  you.eyes = eyes - 1;

  printf("you rich? ");
  rc = fscanf(stdin, "%f", &you.income);
  check(rc > 0, "income needs number");

  printf("----- RESULTS -----\n");

  printf("First Name: %s", you.first_name);
  printf("Last Name: %s", you.last_name);
  printf("Age: %d\n", you.age);
  printf("Eyes: %s\n", EYE_COLOR_NAMES[you.eyes]);
  printf("Income: %f\n", you.income);

  return 0;

error:
  return -1;
}
