#!/usr/bin/bash
i=0
mkdir repo.git
cd repo.git
git init --bare
cd ..
for dev in main secondary teritiary; do
  git clone repo.git
  mv repo ${dev}-dev
done
cd main-dev
for x in {1..5}; do
  ((i+=1))
  echo "$i" > main
  git add main
  git commit -m "$i" --author="Main dev <maindev@pretend.co>"
done
git push
cd ..
for dev in main secondary teritiary; do
  cd ${dev}-dev
  git pull
  git checkout -b ${dev}-dev
  for x in {1..5}; do
    ((i+=1))
    echo "$i" > $dev
    git add $dev
    git commit -m "$dev: $i" --author="${dev^} dev <${dev}dev@pretend.co>"
  done
  cd ..
done
for dir in repo.git main-dev secondary-dev  teritiary-dev; do
  echo -e "\n"
  cd $dir
  echo $dir:
  git --no-pager log --all --graph --format=format:'%C(bold blue)%h%C(reset) - %C(cyan)%an <%ae>%C(reset) - %s%C(bold green)%d%C(reset)'
  cd ..
done
