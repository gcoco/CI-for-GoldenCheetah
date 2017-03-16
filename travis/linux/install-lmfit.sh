#/bin/bash
set -e
cd ${TRAVIS_BUILD_DIR}
wget http://apps.jcns.fz-juelich.de/src/lmfit/lmfit-6.1.tgz -O lmfit-6.1.tgz
tar xf lmfit-6.1.tgz
cd lmfit-6.1
./configure --disable-shared --enable-static --prefix=`${TRAVIS_BUILD_DIR}/usr
make --silent -j3 install 
cd ${TRAVIS_BUILD_DIR}
