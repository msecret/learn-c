#include <stdio.h>
#include <string.h>
#include "dbg.h"

#define DUFFS_DEVICE(x,size) \
  { \
  if(size  0) \
  { \
    int __DUFFS_DEVICE_count, __DUFFS_DEVICE_n; \
    __DUFFS_DEVICE_count = size; \
    __DUFFS_DEVICE_n = (__DUFFS_DEVICE_count+7)  3; \
    switch (__DUFFS_DEVICE_count & 7) \
    { \
    case 0: do { x; \
    case 7: x; \
    case 6: x; \
    case 5: x; \
    case 4: x; \
    case 3: x; \
    case 2: x; \
    case 1: x; \
      } while (--__DUFFS_DEVICE_n  0); \
    } \
  } \
}

#define LEN 1000000

int normal_copy(char *from, char *to, int count)
{
  int i = 0;

  for(i = 0; i < count; i++) {
    to[i] = from[i];
  }

  return i;
}

int duffs_device(char *from, char *to, int count)
{
  {
    int n = (count + 7) / 8;

    switch(count % 8) {
      case 0: do { *to++ = *from++;
                  case 7: *to++ = *from++;
                  case 6: *to++ = *from++;
                  case 5: *to++ = *from++;
                  case 4: *to++ = *from++;
                  case 3: *to++ = *from++;
                  case 2: *to++ = *from++;
                  case 1: *to++ = *from++;
              } while(--n > 0);
    }
  }
  return count;
}

int zeds_device(char *from, char *to, int count)
{
  {
    int n = (count + 12) / 13;

    switch(count % 13) {
      case 0:
      again: *to++ = *from++;

      case 12: *to++ = *from++;
      case 11: *to++ = *from++;
      case 10: *to++ = *from++;
      case 9: *to++ = *from++;
      case 8: *to++ = *from++;
      case 7: *to++ = *from++;
      case 6: *to++ = *from++;
      case 5: *to++ = *from++;
      case 4: *to++ = *from++;
      case 3: *to++ = *from++;
      case 2: *to++ = *from++;
      case 1: *to++ = *from++;
            if(--n > 0) goto again;
    }
  }

  return count;
}

int valid_copy(char *data, int count, char expects)
{
  int i = 0;
  for(i = 0; i < count; i++) {
    if(data[i] != expects) {
      log_err("[%d] %c != %c", i, data[i], expects);
      return 0;
    }
  }

  return 1;
}


int main(int argc, char *argv[])
{
  char from[LEN] = {'a'};
  char to[LEN] = {'c'};
  int rc = 0;

  // setup the from to have some stuff
  memset(from, 'x', LEN);
  // set it to a failure mode
  memset(to, 'y', LEN);
  check(valid_copy(to, LEN, 'y'), "Not initialized right.");

  // use normal copy to
  rc = normal_copy(from, to, LEN);
  check(rc == LEN, "Normal copy failed: %d", rc);
  check(valid_copy(to, LEN, 'x'), "Normal copy failed.");

  // reset
  memset(to, 'y', LEN);

  // duffs version
  rc = duffs_device(from, to, LEN);
  check(rc == LEN, "Duff's device failed: %d", rc);
  check(valid_copy(to, LEN, 'x'), "Duff's device failed copy.");

  // reset
  memset(to, 'y', LEN);

  // my version
  rc = zeds_device(from, to, LEN);
  check(rc == LEN, "Zed's device failed: %d", rc);
  check(valid_copy(to, LEN, 'x'), "Zed's device failed copy.");

  return 0;
error:
  return 1;
}
