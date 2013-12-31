#!/bin/bash
if [ "$BRANCH" = "master" ]
then
  $TRAVIS_BUILD_DIR/$BRANCH/src/GoldenCheetah --version
fi
