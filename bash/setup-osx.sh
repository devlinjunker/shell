#! /bin/bash


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