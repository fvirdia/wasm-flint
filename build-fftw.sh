#!/usr/bin/env bash
set -ev

cd $BUILD

### Download and build fftw

curl https://www.fftw.org/fftw-$FFTW_VERSION.tar.gz -o fftw-$FFTW_VERSION.tar.gz
tar xvf fftw-$FFTW_VERSION.tar.gz
cd fftw-$FFTW_VERSION

time emconfigure ./configure --prefix=$PREFIX
time emmake make -j8

emmake make install
