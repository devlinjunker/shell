#! /bin/bash

r_init() {
  r_HELP=""
}

## ---------
## FILE SYSTEM
## ---------

r_files() {

  r_HELP+=(
    " FILES \n"
    "------- \n"
    "numFiles - count number of files in current directory \n"
  )

  if [[ "$OSTYPE" == "darwin"* ]]; then
    r_HELP+=(
      "\n"
      "qfind <file_name> - recursively search for file matching <file_name> \n"
    )
  fi

  r_HELP+=(
    "grep -r <term> <path> - recursive find lines in files starting at <path> \n"
    "grep -v <term> - find lines that do not match <term> \n"
    "\n"
    "zipf <folder_name> - recursively zip folder provided into <folder_name>.zip \n"
    "extract <archive> - quickly extract most archive types \n"
  )

  if [[ "$OSTYPE" == "darwin"* ]]; then
    r_HELP+=(
      "\n"
      "trash <file> - move file to ~/.Trash rather than forcefully delete \n"
      "cleanupDS - cleans up leftover .DS_Store files in current directory \n"
    )
  fi

}


## ---------
## PROCESSES
## ---------

r_processes() {
  r_HELP+="
PROCESSES
--------
findpid <name> - finds the process id the process containig <name>
pid <process_id> - returns process info about <process_id> specified

memhogs - see processes ranked by memory usage
cpuhogs - see processes ranked by cpu usage

my_ps - see list of ALL processes under my user
"

}

## ---------
## GIT
## ---------
r_git() {
  r_HELP+="
GIT
-------
gpsup - 'git push --set-upstream origin/<current_branch>'
"

}

## ---------
## NETWORK
## ---------

r_network() {
  r_HELP+="
NETWORK
--------
myip - returns the external ip address our LAN is using
myiip - returns the internal network ip address this computer is using
netexp - ping the modem to see ip addresses of other computers on the network

findport - find process id using port
openports - list all open ports
suopenports - list all open ports (visible to super user)

users - list currently connected users to this computer"

  if [[ "$OSTYPE" == "darwin"* ]]; then
    r_HELP+="

vnc <ip_address> - connect to other osx machine at <ip_address> with vnc

awssh <host> - connect to amazon host with key locaiton defined in AWS_KEY
"
  fi

}


## ---------
## APPLICATIONS
## ---------
r_apps() {
  r_HELP+="
APPS
--------
finder - open finder
cdf - change to most recent Finder directory

code <file_path> - open file in vscode
"

}


## -------
## WEB
## -------
r_web() {
  r_HELP+="
WEB
--------"

  if [[ "$OSTYPE" == "darwin"* ]]; then
    r_HELP+="
google <term/phrase> - opens new Chrome tab with google search

inbox - opens Gmail with Chrome
devjunk - opens my website with Chrome
weather - opens my weather page with Chrome
analytics - opens my Matoma dashboard with Chrome

github - opens github home page with Chrome
gists - opens my gists with Chrome
newgist - opens new gist page with Chrome
"
  else 
    r_HELP+="
Web Shortcuts are on OSX only
"
  fi

}

r_install() {
  r_HELP+="
INSTALLATION
-----"

  if [[ $(which port) ]]; then
    r_HELP+="
port list installed - view installed macports
sudo port selfupdate -v - update ports and macports
"
  else
    r_HELP+="
Mac Ports not installed!!
"
  fi
}


function remind () {
  if [[ $1 == "" ]]; then
    echo "which topic?
[A]ll
[f]iles
[g]it
[p]rocesses
[n]etwork
[i]nstall
[a]pps
[w]eb
"
    read response
  else
    response=$1;
  fi

  r_init
  case $response in
    A)
      r_files
      r_processes
      r_git
      r_network
      r_apps
      r_web
    ;;
    f)
      r_files
    ;;
    p)
      r_processes
    ;;
    g)
      r_git
    ;;
    n)
      r_network
    ;;
    a)
      r_apps
    ;;
    w)
      r_web
    ;;
    i)
      r_install
    ;;
  esac


  echo $r_HELP

}
alias r\?=remind
alias \?=remind
