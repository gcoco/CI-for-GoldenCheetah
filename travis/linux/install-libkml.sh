#!/bin/bash
set -e
wget https://github.com/libkml/libkml/archive/1.3.0.tar.gz -O libkml-1.3.0.tar.gz
tar xf libkml-1.3.0.tar.gz
cd libkml-1.3.0
mkdir build && cd build
cmake .. -DBUILD_SHARED_LIBS=off -DCMAKE_INSTALL_PREFIX=`cd ../..; pwd;`/usr
make --silent install
cd ../..
