#include <stdio.h>

int main(int argc, char *argv[])
{
  int distance = -380;
  float power = 234.200000;
  double super = 2341324;
  char initial = 'A';
  char first_name[] = "Man";
  char last_name[] = "";

  printf("distance %x\n", distance);
  printf("power %g\n", power);
  printf("super %#f\n", super);
  printf("initial %c\n", initial);
  printf("first %s\n", first_name);
  printf("last %s\n", last_name);
  printf("%s, %s %c\n", last_name, first_name, initial);

  return 0;
}
