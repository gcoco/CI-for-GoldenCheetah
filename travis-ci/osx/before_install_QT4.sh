#!/bin/bash
brew update
brew install qt$QT
brew install libical
brew install libusb libusb-compat
brew install srmio
#  - brew install --HEAD https://raw.github.com/gcoco/CI-for-GoldenCheetah/master/libkml.rb
sudo chmod -R +w /usr/local
git clone --depth 1 https://github.com/sintegrial/qwtplot3d.git qwtplot3d
cd qwtplot3d
CC=clang CXX=clang++ /usr/local/opt/qt$QT/bin/qmake -makefile -recursive QMAKE_CXXFLAGS_WARN_ON+=-Wno-unused-private-field
CC=clang CXX=clang++ make -j2 
cd ..
git clone --branch 0.98 https://github.com/kypeli/kQOAuth.git kQOAuth-0.98
cd kQOAuth-0.98
CC=clang CXX=clang++ /usr/local/opt/qt$QT/bin/qmake -makefile -recursive QMAKE_CXXFLAGS_WARN_ON+=-Wno-unused-private-field
CC=clang CXX=clang++ make -j2 qmake_all 
CC=clang CXX=clang++ sudo make install
cd ..
curl -O http://www.ftdichip.com/Drivers/D2XX/MacOSX/D2XX1.2.2.dmg
hdiutil mount D2XX1.2.2.dmg
exit
