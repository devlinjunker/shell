#! /bin/bash

# Settings changes

changes=()

## Check if exists before copying template (TODO: and append if it does)
if [[ ! -e ~/.bash_profile ]]; then
  cp template.bash_profile ~/.bash_profile
  changes+=("bash_profile")
fi

if [[ " ${changes[@]} " =~ " bash_profile " ]]; then
  echo "File added: ~/.bash_profile   ---  run `source ~/.bash_profile` to see the changes"
fi

## TODO: ignore gitfetch in global git config
## 1. create file in ~
## 2. git config --global core.excludesfile <new_file>


## Attempt to set basic Vim settings
lib/bvimrc


## TODO: Git Autocompletion
# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion

# Advanced Tools

## OSX
if [[ "$OSTYPE" == "darwin"* ]]; then

  ## TODO: Should we use macports instead?
  ## Install Homebrew
  if [[ -z `which brew` ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  ## Attempt to install stuff with homebrew if installed
  if [[ `which brew` ]]; then
    if [[  -z `which tree` ]]; then
        brew install tree
    fi

    if [[ -z `which nvm` ]]; then
      brew install nvm
      
      ## TODO: place in bash_profile 
      "export NVM_DIR="$HOME/.nvm"
      [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
      [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion" 
    fi
  fi
fi

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

