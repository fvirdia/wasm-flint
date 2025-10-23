#!/usr/bin/env bash

# See https://flintlib.org/downloads.html
# export FLINT_VERSION=2.8.5 # latest ok with mpir
export FLINT_VERSION=3.3.1
export FLINT_HOST=wasm32

# See https://github.com/wbhart/mpir/commits/master for updates...
export MPIR_VERSION=b3367eb13eca95b3a204beaca5281a2c3b4c66a6

# See https://gmplib.org/#DOWNLOAD
export GMP_VERSION=6.3.0

# See https://www.mpfr.org/mpfr-current/#download
export MPFR_VERSION=4.2.2

export FFTW_VERSION=3.3.10

export BUILD=`pwd`/build
export PREFIX=$BUILD/local
