#!/usr/bin/env bash

set -e
set -x

echo "building lilac"

# build lilac
mkdir -p /lilac/build

export CMAKE_PREFIX_PATH=/usr/lib64/mpich/bin

cd /lilac/build && cmake -D CMAKE_BUILD_TYPE=DEBUG ..
make VERBOSE=1 # -j 4

echo "done building lilac, time to run the tests..."

# run test suite
ctest