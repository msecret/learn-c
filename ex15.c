#include <stdio.h>

int main(int argc, char *argv[])
{
  int ages[] = {12, 15, 21, 25};
  char *names[] = {
    "Seymore", "Pooer", "Sam", "Man"
  };

  int count = sizeof(ages) / sizeof(int);
  int i = 0;

  for (i =0; i < count; i++) {
    printf("%s has %d years\n", names[i], ages[i]);
  }

  printf("---\n");

  int *cur_age = ages;
  char **cur_name = names;
  for (i = 0; i < count; i++) {
    printf("%s has %d years\n", *(cur_name+i), *(cur_age+i));
  }

  printf("---\n");

  for (cur_name = names, cur_age = ages;
      (cur_age - ages) < count;
      cur_name++, cur_age++) {

    printf("%s has %d years\n", *cur_name, *cur_age);
  }

  printf("---\n");

  char poop[] = {
    'a', 'm', 'a', 'n'
  };
  char *cur_poop = poop;

  for (i = 0; i < count; i++) {
    printf("poop: %c\n", *(cur_poop+i));
  }

  return 0;
}
