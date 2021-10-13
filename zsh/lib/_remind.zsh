#! /bin/bash

r_init() {
  r_HELP=""
}

## ---------
## FILE SYSTEM
## ---------

r_files() {
  file_HELP=(
    " FILES "
    "------- "
    "numFiles - count number of files in current directory"
  )

  if [[ "$OSTYPE" == "darwin"* ]]; then
    file_HELP+=(
      ""
      "qfind <file_name> - recursively search for file matching <file_name>"
    )
  fi

  file_HELP+=(
    "grep -r <term> <path> - recursive find lines in files starting at <path>"
    "grep -v <term> - find lines that do not match <term>"
    ""
    "zipf <folder_name> - recursively zip folder provided into <folder_name>.zip"
    "extract <archive> - quickly extract most archive types"
  )

  if [[ "$OSTYPE" == "darwin"* ]]; then
    file_HELP+=(
      ""
      "trash <file> - move file to ~/.Trash rather than forcefully delete"
      "cleanupDS - cleans up leftover .DS_Store files in current directory"
    )
  fi

  printf -v help_str "%s\n" "${file_HELP[@]}"
  r_HELP+="${help_str}\n\n";
}


## ---------
## PROCESSES
## ---------

r_processes() {
  process_HELP=(
    "PROCESSES"
    "--------"
    "findpid <name> - finds the process id the process containig <name>"
    "pid <process_id> - returns process info about <process_id> specified"
    ""
    "memhogs - see processes ranked by memory usage"
    "cpuhogs - see processes ranked by cpu usage"
    ""
    "my_ps - see list of ALL processes under my user"
  )
  printf -v help_str "%s\n" "${process_HELP[@]}";
  r_HELP+="${help_str}\n\n";
}

## ---------
## GIT
## ---------
r_git() {
  git_HELP=(
    "GIT"
    "-------"
    "gp - git push"
    "gpsup - 'git push --set-upstream origin/<current_branch>'"
    "gcount - see number of commits by each user"
  )
  printf -v help_str "%s\n" "${git_HELP[@]}";
  r_HELP+="${help_str}\n\n";
}

## ---------
## NETWORK
## ---------

r_network() {
  net_HELP=(
    "NETWORK"
    "--------"
    "myip - returns the external ip address our LAN is using"
    "myiip - returns the internal network ip address this computer is using"
    "netexp - ping the modem to see ip addresses of other computers on the network"
    ""
    "findport - find process id using port"
    "openports - list all open ports"
    "suopenports - list all open ports (visible to super user)"
    ""
    "users - list currently connected users to this computer"
  )

  if [[ "$OSTYPE" == "darwin"* ]]; then
    net_HELP+=(
      ""
      "vnc <ip_address> - connect to other osx machine at <ip_address> with vnc"
      ""
      "awssh <host> - connect to amazon host with key locaiton defined in AWS_KEY"
    )
  fi

  printf -v help_str "%s\n" "${net_HELP[@]}";
  r_HELP+="${help_str}\n\n";
}


## ---------
## APPLICATIONS
## ---------
r_apps() {
  app_HELP=(
    "APPS"
    "--------"
    "finder - open finder"
    "cdf - change to most recent Finder directory"
  )

  if [[ $(which code) ]]; then
    app_HELP+=(
      ""
      "code <file_path> - open file in vscode"
    )
  fi
  printf -v help_str "%s\n" "${app_HELP[@]}";
  r_HELP+="${help_str}\n\n";
}


## -------
## WEB
## -------
r_web() {
  web_HELP=(
    "WEB"
    "--------"
  )

  if [[ "$OSTYPE" == "darwin"* ]]; then
    web_HELP+=(
      "freshgoogle - new google without term"
      "google <term/phrase> - opens new Chrome tab with google search"
      ""
      "inbox - opens Gmail with Chrome"
      "devjunk - opens my website with Chrome"
      "weather - opens my weather page with Chrome"
      "analytics - opens my Matoma dashboard with Chrome"
      ""
      "github - opens github home page with Chrome"
      "gists - opens my gists with Chrome"
      "newgist - opens new gist page with Chrome"
    )
  else 
    web_HELP+=(
      "Web Shortcuts only on OSX"
    )
  fi

  printf -v help_str "%s\n" "${web_HELP[@]}";
  r_HELP+="${help_str}\n\n";
}

r_install() {
  install_HELP=(
    "INSTALLATION"
    "-----"
  )

  if [[ "$OSTYPE" == "darwin"* && $(which port) ]]; then
    install_HELP+=(
      "port list installed - view installed macports"
      "sudo port selfupdate -v - update ports and macports"
    )
  else
    install_HELP+=(
      "Install Help only on OSX with Mac Ports installed"
    )
  fi
  
  printf -v help_str "%s\n" "${install_HELP[@]}";
  r_HELP+="${help_str}\n\n";
}

r_search() {
  search_HELP=(
    "SEARCH"
    "------"
    "grep <term> <file> - print lines matching <term> in <file>"
    "grep -v <term> - print lines without <term>"
    "grep -r <term> <dir> - print lines in files inside <dir> (recursively)"
    ""
    "sed -n '/abc/p' - print lines that contain abc"
    "sed 's/old-text/new-text/g' - replace all instances of 'old-text' with 'new-text'"
    "sed -e '/FOO/s/love/sick/' - replace 'love' with 'sick' if line contains 'FOO'"
    ""
    "awk '{print \$1,\$4}' - Print the 1st and 4th word"
    "awk '{print NR,\$0}' - Print the line number, followed by the whole row"
    "awk '{ if (NF > max) max = NF; line=\$0 } END { print line }' - Print line with most words"
    "awk 'length(\$0) > 10' - Print lines that are larger than 10 characters "
    ""
    "find <path> -name '<pattern>' - find file matching pattern recursively below path"
    "qfind <file_name> - search directories below recursively for file with name = file_name"
    ""
    "google <term> - open new google web search with <term>"
    "ghfind - TBD"
  )

  printf -v help_str "%s\n" "${search_HELP[@]}";
  r_HELP+="${help_str}\n\n";
}


function remind () {
  INTRO=(
    "which topic?"
    "[A]ll"
    "[f]iles"
    "[p]rocesses"
    "[n]etwork"
    "[i]nstall"
    "[a]pps"
    "[w]eb"
    "[s]earch"
  )

  if [[ $(which omz) ]]; then
    INTRO+=("[g]it")
  fi

  clear
  if [[ $1 == "" ]]; then
    echo "${INTRO[*]}"
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
      r_install
      r_apps
      r_web
      r_search
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
    s)
      r_search
    ;;
  esac


  echo $r_HELP

}
alias r\?=remind
alias \?=remind
