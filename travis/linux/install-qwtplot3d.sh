#!/bin/bash
set -e
# git clone --depth 1 https://github.com/sintegrial/qwtplot3d.git qwtplot3d
git clone --depth 1 --branch Qt5.6 https://github.com/gcoco/qwtplot3d.git qwtplot3d
cd qwtplot3d
sed -i "s|examples||" qwtplot3d.pro
../Qt5.5.1/5.5/gcc_64/bin/qmake -recursive
make V=0 -j3
cd ..
