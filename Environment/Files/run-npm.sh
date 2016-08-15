#!/usr/bin/env bash

echo "int chown() { return 0; }" > preload.c && gcc -shared -o preload.so preload.c && LD_PRELOAD=$PWD/preload.so npm --unsafe-perm $@ && rm preload.c preload.so
