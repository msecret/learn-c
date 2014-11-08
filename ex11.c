#include <stdio.h>

int main(int argc, char *argv[])
{
  int i = argc - 1;
  char *states[];

  while(i > 0) {
    printf("arg %d: %s\n", i, argv[i]);
    states[i] = argv[i];
    i--;
  }

  // let's make our own array of strings
  char *states[] = {
    "California", "Oregon",
    "Washington", "Texas"
  };

  int num_states = 4;
  i = num_states - 1;  // watch for this
  while(i >= 0) {
    printf("state %d: %s\n", i, states[i]);
    i--;
  }

  return 0;
}