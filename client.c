#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include "libuv/include/uv.h"

#define INFO(fmt, params...) fprintf(stderr, "INFO: " fmt "\n", params);
#define ERROR(fmt, params...) fprintf(stderr, "ERROR: "fmt "\n", params);

int main() {
    INFO("Starting %s", "Client");
    return 0;
}
