#/bin/bash
set -e
wget https://sourceforge.net/projects/libusb/files/libusb-compat-0.1/libusb-compat-0.1.5/libusb-compat-0.1.5.tar.bz2/download -O libusb-compat-0.1.5.tar.bz2
tar xf libusb-compat-0.1.5.tar.bz2
cd libusb-compat-0.1.5
./configure --disable-shared --enable-static --prefix=`cd ..; pwd`/usr
make -j3 install 
cd ..
