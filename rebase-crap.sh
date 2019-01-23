#!/usr/bin/env bash

BRANCH=compile_warnings
NEWBRANCH=compile_warnings_small

OLDDEST=origin/dev
NEWDEST=dev_small

set -e

git fetch --all -p

git checkout $BRANCH

echo "Run a normal rebase first $BRANCH -> $OLDDEST"
git rebase -i $OLDDEST

echo "Check out $NEWBRANCH"
git checkout -b $NEWBRANCH

echo "Gather list of commits to preserve"
git log --pretty=oneline $OLDDEST..$NEWBRANCH | sed 's/^\([^ ]*\) .*$/pick \1/' > /tmp/commit_list

cat /tmp/commit_list

echo "Rebase $NEWBRANCH -> $NEWDEST"
GIT_SEQUENCE_EDITOR="cp -v /tmp/commit_list" git rebase -i $NEWDEST

rm -vf /tmp/commit_list

echo "Things should be good now, my work is done here."
echo "Read the following output and complete the rebase if one is in progress:"
git status
