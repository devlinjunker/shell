findpid () { lsof -t -c "$@" ; }

pid() { ps -f "$@" ; }

alias memhogstop='top -l 1 -o rsize | head -20'
alias memhogsps='ps wwaxm -o pid,stat,vsize,rss,time,comm | head -10'
alias memhogs=memhogsps

alias cpuhogs='ps wwaxr -o pid,stat,%cpu,time,comm | head -10'

alias memtop='top -R -F -s 10 -o rsize'
alias cputop='top -R -F -s 10 -o cpu'

my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,comm ; }
