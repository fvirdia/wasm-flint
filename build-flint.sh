#!/usr/bin/env bash
set -ev
cd $BUILD

### Now build FLINT

curl https://flintlib.org/download/flint-$FLINT_VERSION.tar.gz -o flint-$FLINT_VERSION.tar.gz
tar xvf flint-$FLINT_VERSION.tar.gz
cd flint-$FLINT_VERSION

# compile using gmp
# time emconfigure ./configure --with-gmp=$PREFIX --with-mpfr=$PREFIX --prefix=$PREFIX # fine up to 3.1
time emconfigure ./configure --with-gmp=$PREFIX --with-mpfr=$PREFIX --prefix=$PREFIX --enable-cxx --host $FLINT_HOST # works on 3.2+

# compile using mpir
# time emconfigure ./configure --with-mpir=$PREFIX --with-mpfr=$PREFIX --prefix=$PREFIX

time emmake make -j8

# time emmake make check # on macos fails due to some permissions issue
time emmake make install || true # on macos install fails even if things are fine

# # try to build an example and run in node
# cd examples

# works using gmp
# emcc primegen.c -o primegen.js -L$PREFIX/lib -I$PREFIX/include/flint -I$PREFIX/include -lflint -lmpir -lmpfr
# node primegen.js 20

# fails using gmp
# em++ partitions.cpp -o partitions.js -L$PREFIX/lib -I$PREFIX/include/flint -I$PREFIX/include -lflint -lmpir -lmpfr
# time node partitions.js 100093982083408923
