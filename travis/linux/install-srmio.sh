#!/bin/bash
set -e
wget http://www.zuto.de/project/files/srmio/srmio-0.1.1~git1.tar.gz -O srmio-0.1.1~git1.tar.gz
tar xf srmio-0.1.1~git1.tar.gz
cd srmio-0.1.1~git1
./configure --disable-shared --enable-static --prefix=`cd ..; pwd`/usr
make -j3 install
cd ..
