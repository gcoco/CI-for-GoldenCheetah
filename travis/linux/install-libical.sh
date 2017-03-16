#!/bin/bash
set -e
cd ${TRAVIS_BUILD_DIR}
wget https://github.com/libical/libical/releases/download/v2.0.0/libical-2.0.0.tar.gz -O libical-2.0.0.tar.gz
tar xf libical-2.0.0.tar.gz
cd libical-2.0.0
## wget https://github.com/libical/libical/releases/download/v1.3.0/libical-1.3.0.tar.gz -O libical-1.3.0.tar.gz
## tar xf libical-1.3.0.tar.gz
## cd libical-1.3.0
mkdir build && cd build
cmake .. -DSTATIC_ONLY=true -DCMAKE_INSTALL_PREFIX=${TRAVIS_BUILD_DIR}/usr
make --silent install
cd ${TRAVIS_BUILD_DIR}
