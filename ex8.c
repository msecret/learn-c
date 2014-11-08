#include <stdio.h>

int main(int argc, char *argv[])
{
  int areas[] = {10, 12, 13, 14, 20};
  char name[10] = "Man";
  char full[] = {
    'M', 'a', 'n', ' ',
    'A', ' ',
    'B', 'o', 't', '\0'
  };

  printf("size of int: %ld\n", sizeof(int));
  printf("size of areas: %ld\n", sizeof(areas));
  printf("size of areas: %ld\n", sizeof(areas));
  printf("num ints in area %ld\n", sizeof(areas) / sizeof(int));
  printf("area 1: %d\n", areas[1]);

  printf("The size of a char: %ld\n", sizeof(char));
  printf("The size of name (char[]): %ld\n",
          sizeof(name));
  printf("The number of chars: %ld\n",
          sizeof(name) / sizeof(char));
  printf("name: %c\n", name[3]);

  printf("The size of full_name (char[]): %ld\n",
            sizeof(full));
  printf("The number of chars: %ld\n",
          sizeof(full) / sizeof(char));

  printf("name=\"%s\" and full_name=\"%s\"\n",
          name, full);

  return 0;
}
