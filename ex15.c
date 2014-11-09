#include <stdio.h>

int main(int argc, char *argv[])
{

  char **ptr_argv = argv;
  printf("arg 1: %s\n", *(ptr_argv+1));

  for (ptr_argv = argv + 1;
      (ptr_argv - argv + 1) < argc + 1;
      ptr_argv++) {
    printf("arg: %s\n", *ptr_argv);
    printf("ptr: %p\n", ptr_argv);
  }

  printf("---\n");

  int ages[] = {12, 15, 21, 25};
  char *names[] = {
    "Seymore", "Pooer", "Sam", "Man"
  };

  int count = sizeof(ages) / sizeof(int);
  int i = 0;

  /*
  for (i =0; i < count; i++) {
    printf("%s has %d years\n", names[i], ages[i]);
  }
  */

  for (i = count - 1; i >= 0; i--) {
    printf("%s has %d years\n", names[i], ages[i]);
  }

  printf("---\n");

  int *cur_age = ages;
  //int *cur_age = (int*)names;

  char **cur_name = names;
  /*
  for (i = 0; i < count; i++) {
    printf("%s has %d years\n", *(cur_name+i), *(cur_age+i));
  }
  */

  for (i = count - 1; i >= 0; i--) {
    printf("%s has %d years\n", *(cur_name+i), *(cur_age+i));
    printf("ptr: %p, ptr: %p\n", cur_name+i, cur_age+i);
  }

  printf("---\n");

  /*
  for (cur_name = names, cur_age = ages;
      (cur_age - ages) < count;
      cur_name++, cur_age++) {

    printf("%s has %d years\n", *cur_name, *cur_age);
  }
  */

  for (cur_name = names + count - 1, cur_age = ages + count - 1;
      (cur_age - ages) >= 0;
      cur_name--, cur_age--) {
    printf("%s has %d years\n", *cur_name, *cur_age);
  }

  printf("---\n");

  char poop[] = {
    'a', 'm', 'a', 'n'
  };
  char *cur_poop = poop;

  void charit(char *chars, int count) {
    int i = 0;
    for (i = 0; i < count; i++) {
      printf("poop: %c\n", *(chars+i));
      printf("ptr: %p\n", chars+i);
    }
  }
  charit(cur_poop, count);

  return 0;
}
