#! /bin/zsh
# This file is to do setup on new computer after repo is downloaded
#  Should install typical programs and ensure basic configs are similar for zsh terminals


## Config

EXPECTED_DIR_NAME=zsh

# Expected Configuration for My User
EXPECTED_GIT_NAME="Devlin Junker"
EXPECTED_GIT_EMAIL=devlin.junker@gmail.com


INSTALLED=()


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




WARNINGS=()
summary() {
  echo "Summary"
  echo "--------"

  echo "${WARNINGS}"
  echo ""
  echo "Tools:"
  printf "[x] %s\n" "${INSTALLED[@]}"
  echo ""
}

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
  # add to warning array
  WARNINGS+=( "$WARNING_ALERT\n" $(printf "%s\n" "${WARN[@]}") )
  # print to console right now
  echo -e "$WARNING_ALERT"
  printf "%s\n" "${WARN[@]}"
  echo ""
}

error_continue() {
  echo -e "$ERROR_ALERT"
  printf "%s\n" "${ERROR[@]} (y/n)"

  read -sk1 INPUT
  echo "$INPUT\n"
  if [[ "$INPUT" == "y"* ]]; then
    return 0
  else
    summary
    exit 1
  fi
}




## Verify ZSH

# Make sure user is running zsh
PARENT_PID=$(ps -o ppid= "$$")
PARENT=$(ps -o args= -p "$PARENT_PID")
if [[ "$PARENT" != *"zsh" ]]; then
  summary
  ERROR="Not using zsh (this script expects zsh terminal)"
  error
else
  INSTALLED+=("zsh")
fi


## Setup Git + Config

if [[ "$OSTYPE" == "darwin"* ]]; then 
  # Check if xcode tools installed
  # TODO: check if this works ...
  (git help 1>/dev/null)
  if [[ "$?" != "0" ]]; then
    xcode-select --install
    echo "Waiting on tools install..."
    echo ""
    read  -n 1
  fi
fi

GIT_NAME=`git config --global user.name`
if [ -z "$GIT_NAME" ]; then
  summary
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
    "Git config not set with expected name."
    "Expected Name: $EXPECTED_GIT_NAME"
  )
  warn
fi

GIT_EMAIL=`git config --global user.email`
if [ -z "$GIT_EMAIL" ]; then
  summary
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
    "Git config not set with correct email."
    "Expected Email: $EXPECTED_GIT_EMAIL"
  )
  warn
fi

# check rsa key exists
if [ ! -f ~/.ssh/id_rsa ] && [ ! -f ~/.ssh/id_rsa.pub ] && [ ! -f ~/.ssh/id_ed_25519 ] && [ ! -f ~/.ssh/id_ed25519.pub ]; then
  ERROR=(
    "SSH Key not set"

    # NOTE: RSA type (-t rsa) with empty comment (-C "")
    "Please create one with 'ssh-keygen -t [rsa|ed25519] -C \"\" '"

    ""
  )
  error
fi

INSTALLED+=("git")


## Install Oh-my-ZSH (custom terminal & prompt)

# check if already installed
if [[ ! -d ~/.oh-my-zsh ]]; then
  # added `"" --unattended` to prevent from gettinng stuck in new zsh terminal
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  INSTALLED+=("oh-my-zsh")
fi

# download shell repo if not exists
if [[ "$CUR_DIR" != *"shell/zsh" ]] && [ ! -d ~/shell ]; then
  git clone git@github.com:devlinjunker/shell.git ~/shell
  if [[ "$?" != "0" ]]; then
    summary
    ERROR=(
      "SSH key not added to github, add new key at:"
      "https://github.com/settings/ssh/new"
    )
    error
  fi
  INSTALLED+=("shell repo") 
else
  INSTALLED+=("shell repo") 
fi

if [[ "$CUR_DIR" != *"shell/zsh" ]]; then
  # change to repo and set CUR_DIR
  cd ~/shell/zsh
  find_dir
fi



###### <OS Setup Functions>

osx() {
  # TODO: Ask to install Iterm?
  if [[ "$TERM_PROGRAM" != "iTerm.app" ]]; then
    WARN=(
      "iTerm is the preferred terminal program, download and install from:" 
      "https://iterm2.com/downloads/stable/latest"
    )
    warn
  else
    INSTALLED+=("iTerm") 
  fi


  # TODO: Check if macports installed and warn user if not
  which port 1> /dev/null
  if [ "$?" -ne 0 ]; then
    ERROR=(
      "Unable to find Macports, download and install from:"
      "https://www.macports.org"
      ""
      "Would you like us to attempt to install?"
    )
    error_continue

    PREINSTALL_DIR="$CUR_DIR"
    if [ "$?" -eq 0 ]; then
      MACPORT_VERSION=$(curl --silent "https://api.github.com/repos/macports/macports-base/releases/latest" | grep '"tag_name"' | sed -E 's/.*"v([^"]+)".*/\1/')  
      echo $MACPORT_VERSION
      curl "https://github.com/macports/macports-base/releases/download/v${MACPORT_VERSION}/MacPorts-${MACPORT_VERSION}.tar.bz2" -L -o ~/Downloads/MacPorts-"$MACPORT_VERSION".tar.bz2
      cd ~/Downloads
      tar xjf Macports-"$MACPORT_VERSION".tar.bz2
      cd Macports-"$MACPORT_VERSION"
      ./configure
      make
      sudo make install
    else
      summary
      error
    fi
    INSTALLED+=("MacPorts")
  else
    INSTALLED+=("MacPorts")
  fi

  which nvm > /dev/null
  if [ "$?" -ne "0" ]; then
    sudo port -v selfupdate
    sudo port install nvm 

    # make available
    source /opt/local/share/nvm/init-nvm.sh 

    # add to .zshenv file for future scripts
    NEW_LINE="source /opt/local/share/nvm/init-nvm.sh"
    grep -qxF "$NEW_LINE" ~/.zshenv || echo "$NEW_LINE" >> ~/.zshenv
    INSTALLED+=("NVM")
    
    # warn user about install and need to source to make available
    WARN=(
      "Installed nvm."
      "Run 'source /opt/local/share/nvm/init-nvm.sh' to make available"
    )
    warn
  else
    INSTALLED+=("NVM")
  fi

  which node > /dev/null
  if [ "$?" -ne "0" ]; then
    NODE_VERSION=nvm install --lts | awk 'END{print}' | cut -d " " -f4
    WARN=(
      "Installed node $NODE_VERSION."
      "Open new shell to make available"
    )
    warn
    INSTALLED+=("Node")
  else
    INSTALLED+=("Node")
  fi

  which jenv > /dev/null
  if [ "$?" -ne "0" ]; then
    ERROR=(
      "jEnv not installed. Would you like to install?"
    )
    error_continue
    if [ "$?" -eq 0 ]; then
    
      sudo port install jenv
      eval "$(jenv init -)"
      WARN=(
        "Installed jEnv."
        "Install jdk with macports and add to jenv:"
        "'"
        "sudo port install openjdk8;"
        "for d in /Library/Java/JavaVirtualMachines/*/Contents/Home; do jenv add \$d; done;"
        "jenv gloabl 1.8"
        "'"
      )
      warn
      INSTALLED+=("jEnv")
    fi

  else
    INSTALLED+=("jEnv")
  fi

  which mvn > /dev/null
  if [ "$?" -ne "0" ]; then
    WARN=(
      "Cannot find maven."
      "Download and Install manually if desired:"
      "(https://archive.apache.org/dist/maven/)"
      "export M2_HOME=...; export PATH=\$PATH:\$M2_HOME/bin"
    )
    warn
  else
    INSTALLED+=("mvn")
  fi

  echo "TODO:
 - [ ] Install davfs2 and link nextcloud
    # https://docs.nextcloud.com/server/19/user_manual/files/access_webdav.html#creating-webdav-mounts-on-the-linux-command-line
    # point aws key at mounted nextcloud drive
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


  which code > /dev/null
  if [ "$?" -ne "0" ]; then
    if [[ "$PATH" != *"/Visual Studio Code.app/"* ]]; then
      PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    fi
    which code > /dev/null
    if [ "$?" -ne "0" ]; then
      WARN=(
        "Unable to find vscode"
        "Download from https://code.visualstudio.com/docs/setup/setup-overview"
      )    
      warn
    else
      INSTALLED+=("VScode")
    fi
  else
    INSTALLED+=("VSCode")
  fi

else
  summary
  ERROR="Please run init script from '$EXPECTED_DIR_NAME' directory"
  error
fi


## Print summary
summary

## Set up user

cd $OG_DIR
if [[ -z $ZSH ]]; then
  # TODO: if osx open new iterm tab or install and start
  zsh
fi


