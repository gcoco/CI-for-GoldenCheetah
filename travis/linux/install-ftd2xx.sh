#!/bin/bash
set -e
cd ${TRAVIS_BUILD_DIR}
wget http://www.ftdichip.com/Drivers/D2XX/Linux/libftd2xx-x86_64-1.3.6.tgz -O libftd2xx-x86_64-1.3.6.tgz
mkdir libftd2xx-x86_64-1.3.6
tar xf libftd2xx-x86_64-1.3.6.tgz -C libftd2xx-x86_64-1.3.6
cp libftd2xx-x86_64-1.3.6/release/build/libftd2xx.so.1.3.6 ${TRAVIS_BUILD_DIR}/usr/lib/libftd2xx.so
cp libftd2xx-x86_64-1.3.6/release/*.h ${TRAVIS_BUILD_DIR}/usr/include
cd ${TRAVIS_BUILD_DIR}
