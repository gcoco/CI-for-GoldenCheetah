#/bin/bash
set -e
cd ${TRAVIS_BUILD_DIR}
sudo apt-get install -qq libusb-1.0-0-dev libudev-dev
wget https://sourceforge.net/projects/libusb/files/libusb-compat-0.1/libusb-compat-0.1.5/libusb-compat-0.1.5.tar.bz2/download -O libusb-compat-0.1.5.tar.bz2
tar xf libusb-compat-0.1.5.tar.bz2
cd libusb-compat-0.1.5
./configure --disable-shared --enable-static --prefix=${TRAVIS_BUILD_DIR}/usr
make --silent -j3 install 
cd ${TRAVIS_BUILD_DIR}