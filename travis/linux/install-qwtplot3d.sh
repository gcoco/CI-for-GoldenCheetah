#!/bin/bash
set -e
cd ${TRAVIS_BUILD_DIR}
# git clone --depth 1 https://github.com/sintegrial/qwtplot3d.git qwtplot3d
git clone --depth 1 --branch Qt5.6 https://github.com/gcoco/qwtplot3d.git qwtplot3d
cd qwtplot3d
sed -i "s|examples||" qwtplot3d.pro
${QTPATH}/bin/qmake -recursive
make --silent -j3
cp -R {lib,include} ${TRAVIS_BUILD_DIR}/usr
cd ${TRAVIS_BUILD_DIR}
