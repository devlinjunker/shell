#! /bin/bash

HELP="

TODO: Help file with things to remember todo, should be a prompt with sub-menus ideally
"

files() {

  HELP+="
FILES
-------
numFiles - count number of files in current directory"

  if [[ "$OSTYPE" == "darwin"* ]]; then
    HELP+="
qfind <file_name> - recursively search for file matching <file_name>
"

  fi

  HELP+="
zipf <folder_name> - recursively zip folder provided into <folder_name>.zip
extract <archive> - quickly extract most archive types"

  if [[ "$OSTYPE" == "darwin"* ]]; then
    HELP+="
trash <file> - move file to ~/.Trash rather than forcefully delete
cleanupDS - cleans up leftover .DS_Store files in current directory
"

  fi
}

processes() {
  HELP+="
PROCESSES
--------
findpid <name> - finds the process id the process containig <name>
pid <process_id> - returns process info about <process_id> specified

memhogs - see processes ranked by memory usage
cpuhogs - see processes ranked by cpu usage

my_ps - see list of ALL processes under my user
"

}

network() {
  HELP+="
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
    HELP+="

vnc <ip_address> - connect to other osx machine at <ip_address> with vnc
"
  fi

}

apps() {
  HELP+="
APPS
--------
finder - open finder
cdf - change to most recent Finder directory
"

}

web() {
  HELP+="
WEB
--------
google <term/phrase> - opens new Chrome tab with google search
github - opens github home page with Chrome
gists - opens my gists with Chrome
newgist - opens new gist page with Chrome
"

}

function help () {
  files
  processes
  network
  apps
  web 

  echo $HELP

  # TODO: request user input on what they want to do
    # files
    # processes
    # network

}
alias h=help
