#!/bin/sh
git status
git log -1 --pretty=format:"   Commit Date - %cd %n   Commit hash - %H %n        Author - %an %nCommit Message - %s"
