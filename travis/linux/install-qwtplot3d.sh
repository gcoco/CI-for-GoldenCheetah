#!/bin/bash
set -e
git clone --depth 1 https://github.com/sintegrial/qwtplot3d.git qwtplot3d
cd qwtplot3d
sed -i "s|examples||" qwtplot3d.pro
qmake -recursive
make -j3
cd ..
