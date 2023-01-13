r_init() {
  r_HELP=""
}


## ---------
## FILES
## ---------

r_files() {
  files_HELP=(
    "FILES"
    "--------"
    "topfiles [dir] - finds the largest files in the directory provided (or current dir if not specified)"
    "topdirs - finds largest directories on the system"
  )
  for (( i=0; i<${#files_HELP[@]}; i++ ));
  do
    r_HELP+="${files_HELP[$i]}\\n";
  done
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
  for (( i=0; i<${#process_HELP[@]}; i++ ));
  do
    r_HELP+="${process_HELP[$i]}\\n";
  done
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

  for (( i=0; i<${#net_HELP[@]}; i++ ));
  do
    r_HELP+="${net_HELP[$i]}\\n";
  done
}


r_install() {
  install_HELP=(
    "INSTALLATION"
    "-----"
  )

  install_HELP+=(
    "yum list installed - view installed packages"
    "sudo yum update -v - update packages and yum"
  )

  for (( i=0; i<${#install_HELP[@]}; i++ ));
  do
    r_HELP+="${install_HELP[$i]}\\n";
  done
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
  )

  for (( i=0; i<${#search_HELP[@]}; i++ ));
  do
    r_HELP+="${search_HELP[$i]}\\n";
  done
}


function remind () {
  INTRO=(
    "which topic?"
    "[A]ll"
    "[f]iles"
    "[p]rocesses"
    "[n]etwork"
    "[i]nstall"
    "[s]earch"
  )

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
      r_network
      r_install
      r_search
    ;;
    f)
      r_files
    ;;
    p)
      r_processes
    ;;
    n)
      r_network
    ;;
    i)
      r_install
    ;;
    s)
      r_search
    ;;
  esac


  case $response in
    A)
      echo -e $r_HELP | less
    ;;
    *)
      echo -e $r_HELP
    ;;
  esac
}
alias r\?=remind
alias \?=remind
