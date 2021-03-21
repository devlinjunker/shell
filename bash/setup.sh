#! /bin/bash

## Find Current Script Directory
CUR_DIR=$(dirname "${BASH_SOURCE[0]}")
PWD=$(pwd)
if [[ "$CUR_DIR" != *"$PWD"* ]] && [[ "$CUR_DIR" != /* ]]; then # prepend PWD if it is not in DIR and DIR not absolute
    CUR_DIR="$PWD/$(echo "$CUR_DIR" | sed s/^\\.\\/?// )" # to make sure this is becomes an absolute path
fi

# Settings changes
changes=()

## Check if exists before linking to template (TODO: append even if it does? or source this?)
if [[ ! -e ~/.bash_profile ]]; then
  ln -s "$CUR_DIR/.bash_profile.sym" ~/.bash_profile
  changes+=("bash_profile")
fi

if [[ ! -e ~/.bashrc ]]; then
  ln -s "$CUR_DIR/.bashrc.sym" ~/.bashrc
  changes+=("bashrc")
fi

if [[ " ${changes[@]} " =~ " bash_profile " ]]; then
  echo "File added: ~/.bash_profile   ---  run 'source ~/.bash_profile' to see the changes"
fi

## TODO: ignore gitfetch in global git config
## 1. create file in ~
## 2. git config --global core.excludesfile <new_file>


## Attempt to set basic Vim settings
lib/bvimrc


## TODO: Git Autocompletion
# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion

# Advanced Tools


# TODO:  Copy server_profile if ssh into machine. 

#TODO: install atom
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

