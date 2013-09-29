#!/bin/sh

num=4
for i in precise quantal raring; do
  cd ocaml
  git checkout experimental/master
  dch --distribution $i -v 4.00.1-1ppa${num}~${i} Bump
  git commit -m version debian/
  cd ..
  ./debuild-ocaml-snap.sh
done
