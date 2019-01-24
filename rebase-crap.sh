#!/usr/bin/env bash

BRANCH=ffprobe_verbosity
NEWBRANCH=ffprobe_verbosity_small

OLDDEST=origin/dev
NEWDEST=upstream/dev

set -e

echo -e "\nFirst and foremost: Your escape sequence:"
echo "  git checkout $BRANCH; git branch -D $NEWBRANCH"

echo -e "\nFetching the newest commits from the interwebs"
git fetch --all -p

echo -e "\nChecking out $BRANCH"
git checkout $BRANCH

echo -e "\nRun a normal rebase first $BRANCH -> $OLDDEST"
git rebase $OLDDEST

echo -e "\nCheck out $NEWBRANCH"
git checkout -b $NEWBRANCH

echo -e "\nGather list of commits to preserve"
git log --pretty=oneline $OLDDEST..$NEWBRANCH | sed 's/^\([^ ]*\) .*$/pick \1/' > /tmp/commit_list

cat /tmp/commit_list

echo -e "\nRebase $NEWBRANCH -> $NEWDEST"
GIT_SEQUENCE_EDITOR="cp -v /tmp/commit_list" git rebase -i $NEWDEST

rm -vf /tmp/commit_list

echo -e "\nThings should be good now, my work is done here."
echo "Read the following output and complete the rebase if one is in progress:"
git status
