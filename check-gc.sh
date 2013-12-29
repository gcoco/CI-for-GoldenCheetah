#!/bin/bash
echo $BRANCH
if [ "$BRANCH" == "master" ]
then
  $TRAVIS_BUILD_DIR/$BRANCH/$BRANCH/src/GoldenCheetah --version
fi
