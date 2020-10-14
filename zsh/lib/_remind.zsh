#! /bin/bash

r_init() {
  r_HELP=""
}

## ---------
## FILE SYSTEM
## ---------

r_files() {

  r_HELP+="
FILES
-------
numFiles - count number of files in current directory"

  if [[ "$OSTYPE" == "darwin"* ]]; then
    r_HELP+="
qfind <file_name> - recursively search for file matching <file_name>
"

  fi

  r_HELP+="
zipf <folder_name> - recursively zip folder provided into <folder_name>.zip
extract <archive> - quickly extract most archive types
"

  if [[ "$OSTYPE" == "darwin"* ]]; then
    r_HELP+="
trash <file> - move file to ~/.Trash rather than forcefully delete
cleanupDS - cleans up leftover .DS_Store files in current directory
"

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
"

}


## -------
## WEB
## -------
r_web() {
  r_HELP+="
WEB
--------
google <term/phrase> - opens new Chrome tab with google search
github - opens github home page with Chrome
gists - opens my gists with Chrome
newgist - opens new gist page with Chrome
"

}


function remind () {
  if [[ $1 == "" ]]; then
    echo "which topic?
[f]iles
[g]it
[p]rocesses
[n]etwork
[a]pps
[w]eb  
"
    read response
  else
    response=$1;
  fi

  r_init
  case $response in
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
  esac


  echo $r_HELP

}
alias r!=remind
