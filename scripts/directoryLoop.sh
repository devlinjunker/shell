#! /bin/bash

for dir in ./*/
do
  cd ./$dir
  if [[ ! -f '.fix' ]]
  then
    pwd;
    npm install;
    echo "" >> '.fix';
  fi
  cd ..
done
