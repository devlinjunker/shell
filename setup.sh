#! /bin/bash

# Settings changes

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


# Advanced Tools

## OSX
if [[ "$OSTYPE" == "darwin"* ]]; then

  ## TODO: Should we use macports instead?
  ## Install Homebrew
  if [[ -z `which brew` ]]; then
    echo "TODO: install homebrew"
   ## /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  ## Attempt to install stuff with homebrew if installed
  if [[ `which brew` ]]; then
    if [[  -z `which tree` ]]; then
        brew install tree
    fi

    if [[ -z `which nvm` ]]; then
      brew install nvm
    fi
  fi
fi

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

