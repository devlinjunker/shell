#! /bin/bash
# This file is to do setup on new computer after repo is downloaded
#  Should install typical programs and ensure basic configs are similar for zsh terminals

EXPECTED_DIR_NAME=zsh

# Expected Configuration for My User
EXPECTED_GIT_NAME="Devlin Junker"
EXPECTED_GIT_EMAIL=devlin.junker@gmail.com

ERROR_ALERT="\n\033[0;31mERROR:\033[0m"
WARNING_ALERT="\n\033[0;33mWARNING:\033[0m"

# Make sure user is running zsh
PARENT_PID=$(ps -o ppid= "$$")
PARENT=$(ps -o args= -p "$PARENT_PID")

if [[ "$PARENT" != *"zsh" ]]; then
  echo -e "$ERROR_ALERT Not using zsh (this script expects zsh terminal) \n"
  exit 1
fi


## Check Git Config
GIT_NAME=`git config --global user.name`
if [ -z "$GIT_NAME" ]; then
  echo -e "$ERROR_ALERT"
  ERROR=(
    "Git config user.name not set"
    ""
    "Use 'git config --global --edit'"
    ""
    "Expected Name: $EXPECTED_GIT_NAME"
  )
  printf "%s\n" "${ERROR[@]}"
  exit 1
fi


if [[ "$GIT_NAME" != "$EXPECTED_GIT_NAME" ]]; then
  echo -e "$WARNING_ALERT"
  WARN=(
    "Git config not set with expected name"
    "Expected Name: $EXPECTED_GIT_NAME"
  )
  printf "%s\n" "${WARN[@]}"
fi

GIT_EMAIL=`git config --global user.email`
if [ -z "$GIT_EMAIL" ]; then
  echo -e "$ERROR_ALERT"
  ERROR=(
    "Git config user.email not set"
    ""
    "Use 'git config --global --edit'"
    ""
    "Expected Email: $EXPECTED_GIT_EMAIL"
  )
  printf "%s\n" "${ERROR[@]}"
  exit 1
fi

if [[ "$GIT_EMAIL" != "$EXPECTED_GIT_EMAIL" ]]; then
  echo -e "$WARNING_ALERT"
  WARN=(
    "Git config not set with correct email"
    "Expected Email: $EXPECTED_GIT_EMAIL"
  )
  printf "%s\n" "${WARN[@]}"
fi


# Find Current Directory
CUR_DIR=${0:a:h}
PWD=$(pwd)
if [[ "$CUR_DIR" != *"$PWD"* ]] && [[ "$CUR_DIR" != /* ]]; then # prepend PWD if it is not in DIR and DIR not absolute
    CUR_DIR="$PWD/$(echo "$CUR_DIR" | sed s/^\\.\\/?// )" # to make sure this is becomes an absolute path
fi


osx_setup() {
  # Check if xcode tools installed
  (git help 1>/dev/null)
  if [[ "$?" != "0" ]]; then
    echo "Waiting on tools install..."
    echo ""
    read  -n 1
  fi

  # TODO: check rsa key exists
  if [ ! -f ~/.ssh/id_rsa ] && [ ! -f ~/.ssh/id_rsa.pub ]; then
    ERROR=(
      "SSH Key not set"
      "Please create one with 'ssh-keygen -t rsa'"
      ""
    )
    printf "%s\n" "${ERROR[@]}"
    exit 1
  fi

  # TODO: download shell repo if not exists
  if [ ! -d ~/shell ]; then
    git clone git@github.com:devlinjunker/shell.git ~/shell
  fi

}

osx_config() {
  # TODO: Create symlinks to zsh files and use $CUR_DIR to define location of profile files
  echo "TODO: Setup zsh env files"

  # TODO: Install Macports
  
  # TODO: Install Node & NVM

  # TODO: call _install_pip.zsh

  # TODO: install vscode?
    # also install vscode command line exec
    # https://code.visualstudio.com/docs/setup/mac#_alternative-manual-instructions

  echo "TODO: install osx stuff"
}


if [[ "$TERM_PROGRAM" != "iTerm.app" ]]; then
  echo -e "$WARNING_ALERT iTerm is the preferred terminal program, you can download and install from:" 
  echo "https://iterm2.com/downloads/stable/latest"
fi

## Install oh-my-zsh for custom terminal & prompt (if not already installed)
which omz 1> /dev/null
if [[ "$?" == "0" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

## TODO: create symbolic link to themes inside ~/.oh-my-zsh/themes



if [[ "$OSTYPE" == "darwin"* ]]; then 
  ## Run method defined above
  osx_setup
fi

## Check that we are in the correct directory before running setup steps
if [[ "$CUR_DIR" =~ .*"$EXPECTED_DIR_NAME/"$ ]] && [[ -e ../scripts ]]; then

  ## 1. Initialize vim configuration file
  
  "$CUR_DIR"../bash/lib/bvimrc 1>/dev/null

  echo ""

  
  ## 3. Run OS specific steps
  if [[ "$OSTYPE" == "darwin"* ]]; then 
    ## Run method defined above
    osx_config
  fi

else
  echo "Please run init script from '$EXPECTED_DIR_NAME' directory 
  "

fi
