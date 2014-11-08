#include <stdio.h>

int main(int argc, char *argv[])
{
  int bugs = 100;
  double bug_rate = 1.2;

  printf("bugs %d at rate %f\n", bugs, bug_rate);

  unsigned long defects = 1L * 26111L * 16384L * 262144L *262144L;
  printf("defects %ld\n", defects);

  double expected_bugs = bugs * bug_rate;
  printf("expected bugs %f\n", expected_bugs);

  double part = expected_bugs / defects;
  printf("part %e\n", part);

  char nul_byte = '\0';
  int care_percent = bugs * nul_byte;
  printf("nothing %d\n", nul_byte);
  printf("should care %d%%\n", care_percent);

  return 0;
}
