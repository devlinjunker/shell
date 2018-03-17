#! /bin/bash

## Copy .bash_profile if ssh into machine. On Windows use su - to change to user account, so need to edit .bashrc that already exists on the windows subsytem
cp .bash_profile ~ ## should check if exists before copying and append if it does
source ~/.bash_profile

./scripts/bvimrc


if [[ -z `which brew` ]]; then
  if [[  -z `which tree` ]]; then
      brew install tree
  fi

  #install atom
  #   nuclide
  #   git log
  #   atom-ternjs
  #   language-babel (or react?) https://orktes.github.io/atom-react/#syntax-highlighting
  #   highlight selected?
  #   linter-eslint (ignore linter dependency)
  #   js-refactor
  #   prettier-atom
  #   mocha-test-runner

  ### MacMini
  #   atom-html-preview 
  #   autocomplete-modules
  #   color-picker
  #   pigments
fi
