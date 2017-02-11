#/bin/bash
set -e
wget http://apps.jcns.fz-juelich.de/src/lmfit/lmfit-6.1.tgz -O lmfit-6.1.tgz
tar xf lmfit-6.1.tgz
cd lmfit-6.1
./configure --disable-shared --enable-static --prefix=`cd ..; pwd`/usr
make --silent -j3 install 
cd ..
