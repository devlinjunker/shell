#! /bin/zsh

EXPECTED_DIR_NAME=zsh
EXPECTED_GIT_NAME="Devlin Junker"
EXPECTED_GIT_EMAIL=devlin.junker@gmail.com

CUR_DIR=`pwd`

osx() {
  # TODO: Check if xcode tools installed
  # 1. run git status
  # 2. check if exits properly (git status 1>/dev/null; then check $? == 0 for success)
  # 3. if not, display message to install xcode + xcode tools then abort

  # TODO: Install Macports
  
  # TODO: Install Node & NVM
  echo "TODO: install osx stuff"
}

## Install oh-my-zsh for custom terminal & prompt (if not already installed)
which omz 1> /dev/null
if [[ "$?" == "0" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

## TODO: create symbolic link to themes inside ~/.oh-my-zsh/themes


## TODO: create symbolic link 'doctor' to lib/doctor.zsh inside ../scripts

## Check Git Config
GIT_NAME=`git config --global user.name`
if [[ "$GIT_NAME" != "$EXPECTED_GIT_NAME" ]]; then
  echo "
Git config not set with correct name

use 'git config --global --edit'
"
  return -1
fi

GIT_EMAIL=`git config --global user.email`
if [[ "$GIT_EMAIL" != "$EXPECTED_GIT_EMAIL" ]]; then
  echo "
Git config not set with correct email

use 'git config --global --edit'
"
  return -1
fi

## Check that we are in the correct directory before running setup steps
if [[ "$CUR_DIR" =~ .*"$EXPECTED_DIR_NAME"$ ]] && [[ -e ./profile ]]; then

  ## 1. Initialize vim configuration file
  ../scripts/bvimrc

  ## 2. TODO: Create symlinks to zsh files and use $CUR_DIR to define location of profile files
  echo "TODO: Setup zsh env files"
  
  ## 3. Run OS specific steps
  if [[ "$OSTYPE" == "darwin"* ]]; then 
    ## Run method defined above
    osx
  fi

else
  echo "Please run init script from '$EXPECTED_DIR_NAME' directory 
  "

fi
