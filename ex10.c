#include <stdio.h>

int main(int argc, char *argv[])
{
  int i = 0;
  char *states[] = {
    "Ca", "Or", "Wa", "Tx"
  };
  int num_states;

  for (i = 1; i < argc; i++) {
    printf("arg %d : %s\n", i, argv[i]);
  }

  for (i = 0, num_states = 4; i < num_states; i++) {
    printf("state %d : %s\n", i, states[i]);
  }

  return 0;
}
