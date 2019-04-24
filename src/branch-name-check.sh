#!/usr/bin/env sh

# Requires msee https://www.npmjs.com/package/msee

MARKDOWN_VIEWER=$(npm bin)/msee
BRANCHING_DOC=$(pwd)/documents/branching-strategy.md
BRANCH_NAME=$(git symbolic-ref --short HEAD 2> /dev/null | grep -E "(feature|bug|fix)\/[A-Za-z]{1,4}-[0-9]{1,4}([_-][A-Za-z0-9]+)+$")

if [ "$BRANCH_NAME" ]
then
  exit 0
else
  cat $BRANCHING_DOC | $MARKDOWN_VIEWER
  exit 1
fi
