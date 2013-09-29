#!/bin/sh -ex

cd opam
git checkout master
#make distclean
git reset --hard
debuild -S -sa
