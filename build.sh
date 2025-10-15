#!/usr/bin/env bash
set -ev

. ./build-env.sh

rm -rf $BUILD dist
mkdir $BUILD dist

./build-gmp.sh # no pthread support. Supports FLINT 3.3.1
# ./build-mpir.sh # pthread support, but abandoned. compiles up to FLINT 2.8.5
./build-mpfr.sh
./build-flint.sh