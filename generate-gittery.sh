#!/usr/bin/bash
i=0
mkdir repo.git
cd repo.git
git init --bare
cd ..
for dev in main second teritiary; do
  git clone repo.git
  mv repo ${dev}-dev
done
cd main-dev
for x in {1..5}; do
  ((i+=1))
  echo "$i" > main
  git add main
  git commit -m "$i"
done
git push
cd ..
for dev in main second teritiary; do
  cd ${dev}-dev
  git pull
  git checkout -b ${dev}-dev
  for x in {1..5}; do
    ((i+=1))
    echo "$i" > $dev
    git add $dev
    git commit -m "$dev: $i"
  done
  cd ..
done
for dir in repo.git main-dev second-dev  teritiary-dev; do
  cd $dir
  echo $dir:
  git log --oneline --graph --all
  cd ..
done
