#!/bin/bash
set -e
wget https://github.com/libical/libical/releases/download/v1.0.1/libical-1.0.1.tar.gz -O libical-1.0.1.tar.gz
tar xf libical-1.0.1.tar.gz
cd libical-1.0.1
mkdir build && cd build
cmake .. -DSTATIC_ONLY=true -DCMAKE_INSTALL_PREFIX=`cd ../..; pwd;`/usr
make install
cd ../..
