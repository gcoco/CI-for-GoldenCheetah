#!/bin/bash
set -e
cd ${TRAVIS_BUILD_DIR}
wget https://github.com/libkml/libkml/archive/1.3.0.tar.gz -O libkml-1.3.0.tar.gz
tar xf libkml-1.3.0.tar.gz
cd libkml-1.3.0
mkdir build && cd build
cmake .. -DBUILD_SHARED_LIBS=off -DCMAKE_INSTALL_PREFIX=${TRAVIS_BUILD_DIR}/usr
make --silent install
cd ${TRAVIS_BUILD_DIR}
