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




## Check Git Config

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
  if [[ "$TERM_PROGRAM" != "iTerm.app" ]]; then
    WARN=(
      "iTerm is the preferred terminal program, you can download and install from:" 
      "https://iterm2.com/downloads/stable/latest"
    )
    warn
  fi


  # TODO: check if this works ...

  # Check if xcode tools installed
  (git help 1>/dev/null)
  if [[ "$?" != "0" ]]; then
    echo "Waiting on tools install..."
    echo ""
    read  -n 1
  fi

  echo "TODO:
 - [ ] Create symlinks to zsh files and use CUR_DIR to define location of profile files
 - [ ] Setup zsh env files
 - [ ] Install Macports
 - [ ] Install Node & NVM
 - [ ] call _install_pip.zsh ?
    # is this for python / python version manager
 - [ ] install vscode?
    # also install vscode command line exec
    # https://code.visualstudio.com/docs/setup/mac#_alternative-manual-instructions
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

  ## Setup Oh-my-ZSH (colorful prompt)

  ## Install oh-my-zsh for custom terminal & prompt (if not already installed)
  which omz 1> /dev/null
  if [[ "$?" == "0" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi

  # create symbolic link to theme file inside ~/.oh-my-zsh/themes
  if [ ! -f ~/.oh-my-zsh/themes/bira+gitstatus.zsh-theme ]; then
    ln -s "$CUR_DIR"themes/bira+gitstatus.zsh-theme ~/.oh-my-zsh/themes/
    WARN="Restart Terminal (or new tab) to see theme change"
    warn
  fi

  # TODO: Set ZSH_THEME in ~/.zshrc 



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
