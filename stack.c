#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

#define MAX 512

struct Stack {
  int data[MAX];
  int top;
};

void die(const char *message)
{
  if (errno) {
    perror(message);
  } else {
    printf("ERROR: %s\n", message);
  }
  exit(1);
}

void Stack_push(struct Stack *stack, int data)
{
  printf("%d\n", stack->top);
  stack->top++;
  stack->data[stack->top] = data;
}

int Stack_pop(struct Stack *stack)
{
  printf("%d\n", stack->top);

  int data = stack->data[stack->top];

  stack->data[stack->top] = 0;
  stack->top -= 1;

  return data;
}

struct Stack *Stack_create()
{
  struct Stack *stack = malloc(sizeof(struct Stack));
  if (!stack) die("mem error");

  stack->top = 0;

  return stack;
}

int main(int argc, char *argv[])
{
  if (argc < 2) die("USAGE: ./stack <action> <data:optional>");
  int data = 0;

  struct Stack *stack = Stack_create();

  Stack_push(stack, 6);
  Stack_push(stack, 3);
  Stack_push(stack, 9);

  data = Stack_pop(stack);
  printf("data: %d\n", data);

  Stack_push(stack, 5);
  Stack_push(stack, 4);

  data = Stack_pop(stack);
  printf("data: %d\n", data);

  return 0;
}

