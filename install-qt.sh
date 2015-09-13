#!/bin/bash
if [ "$QT" = "qt5" ]
then
  # Select QT 5.4.2
  git reset 00e46351980 $( brew --prefix )/Library/Formula/qt5.rb
fi
brew install $QT
