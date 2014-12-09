/** WARNING: This code is fresh and potentially isn't correct yet. */

#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include "dbg.h"

#define MAX_DATA 100

int read_string(char **out_string, int max_buffer)
{
  *out_string = calloc(1, max_buffer + 1);
  check_mem(*out_string);

  char *result = fgets(*out_string, max_buffer, stdin);
  check(result != NULL, "Input error.");

  return 0;

error:
  if(*out_string) free(*out_string);
  *out_string = NULL;
  return -1;
}

int read_int(int *out_int)
{
  char *input = NULL;
  int rc = read_string(&input, MAX_DATA);
  check(rc == 0, "Failed to read number.");

  *out_int = atoi(input);

  free(input);
  return 0;

error:
  if(input) free(input);
  return -1;
}

int read_scan(const char *fmt, ...)
{
    int i = 0;
    int rc = 0;
    int *out_int = NULL;
    char *out_char = NULL;
    char **out_string = NULL;
    int max_buffer = 0;

    va_list argp;
    va_start(argp, fmt);

    for(i = 0; fmt[i] != '\0'; i++) {
        if(fmt[i] == '%') {
            i++;
            switch(fmt[i]) {
                case '\0':
                    sentinel("Invalid format, you ended with %%.");
                    break;

                case 'd':
                    out_int = va_arg(argp, int *);
                    rc = read_int(out_int);
                    check(rc == 0, "Failed to read int.");
                    break;

                case 'c':
                    out_char = va_arg(argp, char *);
                    *out_char = fgetc(stdin);
                    break;

                case 's':
                    max_buffer = va_arg(argp, int);
                    out_string = va_arg(argp, char **);
                    rc = read_string(out_string, max_buffer);
                    check(rc == 0, "Failed to read string.");
                    break;

                default:
                    sentinel("Invalid format.");
            }
        } else {
            fgetc(stdin);
        }

        check(!feof(stdin) && !ferror(stdin), "Input error.");
    }

    va_end(argp);
    return 0;

error:
    va_end(argp);
    return -1;
}



int main(int argc, char *argv[])
{
    char *first_name = NULL;
    char initial = ' ';
    char *last_name = NULL;
    int age = 0;

    printf("What's your first name? ");
    int rc = read_scan("%s", MAX_DATA, &first_name);
    check(rc == 0, "Failed first name.");

    printf("What's your initial? ");
    rc = read_scan("%c\n", &initial);
    check(rc == 0, "Failed initial.");

    printf("What's your last name? ");
    rc = read_scan("%s", MAX_DATA, &last_name);
    check(rc == 0, "Failed last name.");

    printf("How old are you? ");
    rc = read_scan("%d", &age);

    printf("---- RESULTS ----\n");
    printf("First Name: %s", first_name);
    printf("Initial: '%c'\n", initial);
    printf("Last Name: %s", last_name);
    printf("Age: %d\n", age);

    free(first_name);
    free(last_name);
    return 0;
error:
    return -1;
}
/*
 * sudo make install
[sudo] password for msecret: 
make[1]: Entering directory `/home/msecret/tmp/apr-1.4.6'
make[1]: Nothing to be done for `local-all'.
make[1]: Leaving directory `/home/msecret/tmp/apr-1.4.6'
/home/msecret/tmp/apr-1.4.6/build/mkdir.sh /usr/local/apr/lib /usr/local/apr/bin /usr/local/apr/build-1 \
		     /usr/local/apr/lib/pkgconfig /usr/local/apr/include/apr-1
mkdir /usr/local/apr
mkdir /usr/local/apr/lib
mkdir /usr/local/apr/bin
mkdir /usr/local/apr/build-1
mkdir /usr/local/apr/lib/pkgconfig
mkdir /usr/local/apr/include
mkdir /usr/local/apr/include/apr-1
/usr/bin/install -c -m 644 /home/msecret/tmp/apr-1.4.6/include/apr.h /usr/local/apr/include/apr-1
for f in /home/msecret/tmp/apr-1.4.6/include/apr_*.h; do \
	    /usr/bin/install -c -m 644 ${f} /usr/local/apr/include/apr-1; \
	done
/bin/bash /home/msecret/tmp/apr-1.4.6/libtool --mode=install /usr/bin/install -c -m 755 libapr-1.la /usr/local/apr/lib
libtool: install: /usr/bin/install -c -m 755 .libs/libapr-1.so.0.4.6 /usr/local/apr/lib/libapr-1.so.0.4.6
libtool: install: (cd /usr/local/apr/lib && { ln -s -f libapr-1.so.0.4.6 libapr-1.so.0 || { rm -f libapr-1.so.0 && ln -s libapr-1.so.0.4.6 libapr-1.so.0; }; })
libtool: install: (cd /usr/local/apr/lib && { ln -s -f libapr-1.so.0.4.6 libapr-1.so || { rm -f libapr-1.so && ln -s libapr-1.so.0.4.6 libapr-1.so; }; })
libtool: install: /usr/bin/install -c -m 755 .libs/libapr-1.lai /usr/local/apr/lib/libapr-1.la
libtool: install: /usr/bin/install -c -m 755 .libs/libapr-1.a /usr/local/apr/lib/libapr-1.a
libtool: install: chmod 644 /usr/local/apr/lib/libapr-1.a
libtool: install: ranlib /usr/local/apr/lib/libapr-1.a
libtool: finish: PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/sbin" ldconfig -n /usr/local/apr/lib
----------------------------------------------------------------------
Libraries have been installed in:
   /usr/local/apr/lib

If you ever happen to want to link against installed libraries
in a given directory, LIBDIR, you must either use libtool, and
specify the full pathname of the library, or use the `-LLIBDIR'
flag during linking and do at least one of the following:
   - add LIBDIR to the `LD_LIBRARY_PATH' environment variable
     during execution
   - add LIBDIR to the `LD_RUN_PATH' environment variable
     during linking
   - use the `-Wl,-rpath -Wl,LIBDIR' linker flag
   - have your system administrator add LIBDIR to `/etc/ld.so.conf'

See any operating system documentation about shared libraries for
more information, such as the ld(1) and ld.so(8) manual pages.
----------------------------------------------------------------------
/usr/bin/install -c -m 644 apr.exp /usr/local/apr/lib/apr.exp
/usr/bin/install -c -m 644 apr.pc /usr/local/apr/lib/pkgconfig/apr-1.pc
for f in libtool shlibtool; do \
	    if test -f ${f}; then /usr/bin/install -c -m 755 ${f} /usr/local/apr/build-1; fi; \
	done
/usr/bin/install -c -m 755 /home/msecret/tmp/apr-1.4.6/build/mkdir.sh /usr/local/apr/build-1
for f in make_exports.awk make_var_export.awk; do \
	    /usr/bin/install -c -m 644 /home/msecret/tmp/apr-1.4.6/build/${f} /usr/local/apr/build-1; \
	done
/usr/bin/install -c -m 644 build/apr_rules.out /usr/local/apr/build-1/apr_rules.mk
/usr/bin/install -c -m 755 apr-config.out /usr/local/apr/bin/apr-1-config
