#!/bin/sh -e

num=2
v=1.0.0
for i in precise quantal raring; do
  cd opam
  git checkout master
  dch --distribution $i -v ${v}-1ppa${num}~${i} Bump
  git commit -m version debian/
  cd ..
  ./debuild-opam-snap.sh
done
