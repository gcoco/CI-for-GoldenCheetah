#!/bin/bash
set -e
wget https://github.com/libical/libical/releases/download/v2.0.0/libical-2.0.0.tar.gz -O libical-2.0.0.tar.gz
tar xf libical-2.0.0.tar.gz
cd libical-2.0.0
mkdir build && cd build
cmake .. -DSTATIC_ONLY=true -DCMAKE_INSTALL_PREFIX=`cd ../..; pwd;`/usr
make --silent install
cd ../..
