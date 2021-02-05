alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

myiip () {
  local ip i
  ip=""
  i=0
  while [[ -z $ip && $i < 10 ]]; do
    ip=`ipconfig getifaddr en${i}`
    if [[ ! -z $ip ]]; then
      break
    fi
    i=$((i + 1))
  done
  echo $ip
}

netexp () {
  echo "Pinging Network..."
  ping `myiip | sed 's/\([0-9]*\.[0-9]*\.[0-9]*\.\)[0-9]*/\1255/'` -c5 -q > /dev/null
  eval 'arp -a'
}

findPort () {
  lsof -nP -iTCP:$1 | grep LISTEN ;
}

alias netcons="lsof -i"

alias openports="lsof -i | grep LISTEN"
alias suopenports="sudo lsof -i | grep LISTEN"
alias sudopenports=suopenports

alias users="w -h"

vnc () {
    eval "open vnc://$1"
}
