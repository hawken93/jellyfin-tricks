#!/usr/bin/env bash

BRANCH=compile_warnings
NEWBRANCH=compile_warnings_small

OLDDEST=dev
NEWDEST=dev_small

set -e

git checkout $BRANCH
git checkout -b $NEWBRANCH

git log --pretty=oneline $OLDDEST..$NEWBRANCH | sed 's/^\([^ ]*\) .*$/pick \1/' > /tmp/commit_list

cat /tmp/commit_list

GIT_SEQUENCE_EDITOR="cp -v /tmp/commit_list" git rebase -i $NEWDEST

rm -vf /tmp/commit_list
