#include "shell.h"
#include "dbg.h"
#include <stdarg.h>

int Shell_exec(Shell template, ...)
{
  apr_pool_t *p = NULL;
  int rc = -1;
  apr_status_t rv = APR_SUCCESS;
  va_list argp;
  const char *key = NULL;
  const char *arg = NULL;
  int i = 0;

  rv = apr_pool_create(&pool, NULL);
  // Why equals success?
  check(rv == APR_SUCCESS, "Failed to create pool.");

  va_start(argp, template);

  for (key = va_arg(argp, const char *);
       key != NULL;
       key = va_arg(argp, const char *)
  {
    arg = va_arg(argp, const char *);

    for (i = 0; template.args[i] != NULL; i++) {
      if (strcmp(template.args[i], key) {
        template.args[i] = arg;
        break;
      }
    }
  }

  rc = Shell_run(p, &template);
  apr_pool_destroy(p);
  va_end(argp);
  return rc;

error:
  if (p) {
    apr_pool_destroy(p);
  }
  return rc;
}

Shell CLEANUP_SH = {
  .exe = "rm",
  .dir = "/tmp",
  .args = {"rm", "-rf", "/tmp/pkg-build", "/tmp/pkg-src.tar.gz",
      "/tmp/pkg-src.tar.bz2", "/tmp/DEPENDS", NULL}
};

Shell GIT_SH = {
  .dir = "/tmp",
  .exe = "git",
  .args = {"git", "clone", "URL", "pkg-build", NULL}
};

Shell TAR_SH = {
  .dir = "/tmp/pkg-build",
  .exe = "tar",
  .args = {"tar", "-xzf", "FILE", "--strip-components", "1", NULL}
};

Shell CURL_SH = {
  .dir = "/tmp",
  .exe = "curl",
  .args = {"curl", "-L", "-o", "TARGET", "URL", NULL}
};

Shell CONFIGURE_SH = {
  .exe = "./configure",
  .dir = "/tmp/pkg-build",
  .args = {"configure", "OPTS", NULL},
};

Shell MAKE_SH = {
  .exe = "make",
  .dir = "/tmp/pkg-build",
  .args = {"make", "OPTS", NULL}
};

Shell INSTALL_SH = {
  .exe = "sudo",
  .dir = "/tmp/pkg-build",
  .args = {"sudo", "make", "TARGET", NULL}
};
