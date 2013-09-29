#!/bin/sh -ex

cd ocaml
git checkout experimental/master
git reset --hard
rm -f .depend
debuild -S -sa
