#! /bin/bash

changes=()

## Copy .bash_profile if ssh into machine. 
## On Windows use su - to change to user account, so need to edit .bashrc that already exists on the windows subsytem

## Check if exists before copying (TODO: and append if it does)
if [[ ! -e ~/.bash_profile ]]; then
  cp .bash_profile ~ 
  changes+=("bash_profile")
fi

if [[ " ${changes[@]} " =~ " bash_profile " ]]; then
  echo "File added: ~/.bash_profile   ---  run `source ~/.bash_profile` to see the changes"
fi


## Attempt to set basic Vim settings
./scripts/bvimrc


## Attempt to install stuff with homebrew if installed
if [[ `which brew` ]]; then
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


