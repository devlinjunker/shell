#! /bin/zsh
# This file is to do setup on new computer after repo is downloaded
#  Should install typical programs and ensure basic configs are similar for zsh terminals


## Config

EXPECTED_DIR_NAME=zsh

# Expected Configuration for My User
EXPECTED_GIT_NAME="Devlin Junker"
EXPECTED_GIT_EMAIL=devlin.junker@gmail.com


## Find Current Directory
find_dir() {
  CUR_DIR=${0:a:h}
  PWD=$(pwd)
  if [[ "$CUR_DIR" != *"$PWD"* ]] && [[ "$CUR_DIR" != /* ]]; then # prepend PWD if it is not in DIR and DIR not absolute
      CUR_DIR="$PWD/$(echo "$CUR_DIR" | sed s/^\\.\\/?// )" # to make sure this is becomes an absolute path
  fi
}

find_dir
OG_DIR="$CUR_DIR"


## Printing Errors

ERROR_ALERT="\n\033[0;31mERROR:\033[0m"
WARNING_ALERT="\n\033[0;33mWARNING:\033[0m"

error() {
  echo -e "$ERROR_ALERT"
  printf "%s\n" "${ERROR[@]}"
  echo ""
  exit 1
}

warn() {
  echo -e "$WARNING_ALERT"
  printf "%s\n" "${WARN[@]}"
  echo ""
}




## Verify ZSH

# Make sure user is running zsh
PARENT_PID=$(ps -o ppid= "$$")
PARENT=$(ps -o args= -p "$PARENT_PID")
if [[ "$PARENT" != *"zsh" ]]; then
  echo -e "$ERROR_ALERT Not using zsh (this script expects zsh terminal) \n"
  exit 1
fi


## Install Oh-my-ZSH (custom terminal & prompt)

# check if already installed
if [[ ! -d ~/.oh-my-zsh ]]; then
  # added `"" --unattended` to prevent from gettinng stuck in new zsh terminal
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi


## Setup Git + Config

if [[ "$OSTYPE" == "darwin"* ]]; then 
  # Check if xcode tools installed
  # TODO: check if this works ...
  (git help 1>/dev/null)
  if [[ "$?" != "0" ]]; then
    echo "Waiting on tools install..."
    echo ""
    read  -n 1
  fi
fi

GIT_NAME=`git config --global user.name`
if [ -z "$GIT_NAME" ]; then
  ERROR=(
    "Git config user.name not set"
    ""
    "Use 'git config --global --edit'"
    ""
    "Expected Name: $EXPECTED_GIT_NAME"
  )
  error
fi


if [[ "$GIT_NAME" != "$EXPECTED_GIT_NAME" ]]; then
  WARN=(
    "Git config not set with expected name"
    "Expected Name: $EXPECTED_GIT_NAME"
  )
  warn
fi

GIT_EMAIL=`git config --global user.email`
if [ -z "$GIT_EMAIL" ]; then
  ERROR=(
    "Git config user.email not set"
    ""
    "Use 'git config --global --edit'"
    ""
    "Expected Email: $EXPECTED_GIT_EMAIL"
  )
  error
fi

if [[ "$GIT_EMAIL" != "$EXPECTED_GIT_EMAIL" ]]; then
  WARN=(
    "Git config not set with correct email"
    "Expected Email: $EXPECTED_GIT_EMAIL"
  )
  warn
fi

# check rsa key exists
if [ ! -f ~/.ssh/id_rsa ] && [ ! -f ~/.ssh/id_rsa.pub ]; then
  ERROR=(
    "SSH Key not set"

    # NOTE: RSA type (-t rsa) with empty comment (-C "")
    "Please create one with 'ssh-keygen -t rsa -C \"\" '"

    ""
  )
  error
fi

# download shell repo if not exists
if [ ! -d ~/shell ]; then
  git clone git@github.com:devlinjunker/shell.git ~/shell
  if [[ "$?" != "0" ]]; then
    ERROR=(
      "SSH key not added to github, add new key at:"
      "https://github.com/settings/ssh/new"
    )
    error
  fi
fi

# change to repo and set CUR_DIR
cd ~/shell/zsh
find_dir




###### <OS Setup Functions>

osx() {
  # TODO: Ask to install Iterm?
  if [[ "$TERM_PROGRAM" != "iTerm.app" ]]; then
    WARN=(
      "iTerm is the preferred terminal program, you can download and install from:" 
      "https://iterm2.com/downloads/stable/latest"
    )
    warn
  fi


  # TODO: Check if macports installed and warn user if not
  

  echo "TODO:
 - [ ] Install Macports
 - [ ] Install Node & NVM
 - [ ] Install davfs2 and link nextcloud
    # https://docs.nextcloud.com/server/19/user_manual/files/access_webdav.html#creating-webdav-mounts-on-the-linux-command-line
    # point aws key at mounted nextcloud drive
 - [ ] install vscode?
    # also install vscode command line exec
    # https://code.visualstudio.com/docs/setup/mac#_alternative-manual-instructions
 - [ ] call _install_pip.zsh ?
    # is this for python / python version manager
  "
}

###### </OS Setup Functions>




## Make sure user is in the right place before running

if [[ "$CUR_DIR" =~ .*"$EXPECTED_DIR_NAME"$ ]] || [[ "$CUR_DIR" =~ .*"$EXPECTED_DIR_NAME/"$ ]]; then
  HAS_DIR_NAME="0"
fi
if [[ $HAS_DIR_NAME == "0" ]]  && [[ -e ../scripts ]]; then
  if [[ "$CUR_DIR" =~ .*"$EXPECTED_DIR_NAME"$ ]]; then
    CUR_DIR="$CUR_DIR/"
  fi


  # create symbolic link from personal theme file inside ~/.oh-my-zsh/themes
  if [ ! -f ~/.oh-my-zsh/themes/bira+gitstatus.zsh-theme ]; then
    ln -s "$CUR_DIR"themes/bira+gitstatus.zsh-theme ~/.oh-my-zsh/themes/
  fi
  
  # set oh-my-zsh theme with custom theme
  sed -i -e 's/ZSH_THEME=".*"/ZSH_THEME="bira+gitstatus"/' ~/.zshrc


  # set PATH and link custom alias files in ~/.zshrc
  NEW_LINE="PATH=\$PATH:~/shell/zsh/lib"
  grep -qxF "$NEW_LINE" ~/.zshrc || echo "$NEW_LINE" >> ~/.zshrc

  NEW_LINE="PATH=\$PATH:~/shell/bash/lib"
  grep -qxF "$NEW_LINE" ~/.zshrc || echo "$NEW_LINE" >> ~/.zshrc

  NEW_LINE="source \"${CUR_DIR}zshrc.sym\""
  grep -qxF "$NEW_LINE" ~/.zshrc || echo "$NEW_LINE" >> ~/.zshrc


  # Initialize vim configuration file
  # NOTE: send to /dev/null because bvimrc needs improvement
  "$CUR_DIR"../bash/lib/bvimrc 1>/dev/null


  # Run OS specific steps
  if [[ "$OSTYPE" == "darwin"* ]]; then 
    ## Run method defined above
    osx
  fi

else
  ERROR="Please run init script from '$EXPECTED_DIR_NAME' directory"
  error
fi

cd $OG_DIR
if [[ -z $ZSH ]]; then
  # TODO: if osx open new iterm tab or install and start
  zsh
fi


