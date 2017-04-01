#!/bin/bash
if [ "$QT_VER" = "5.5.1" ]
then
  brew install qt@5.5
fi
if [ "$QT_VER" = "5.6.2" ]
then
  brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/106d0878ee812cb8f5c403f717bdebe836445aee/Formula/qt5.rb
fi
if [ "$QT_VER" = "5.7.1" ]
then
  brew install qt@5.7
fi
if [ "$QT_VER" = "5.8.0" ]
then
  brew install qt5
else
  brew install qt5
fi
