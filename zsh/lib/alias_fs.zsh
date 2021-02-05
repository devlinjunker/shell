#! /bin/zsh

alias ls="ls -FGlAhp"
alias less="less -FSRXc"
alias mkdir="mkdir -pv"

function mcd()
{
  mkdir $1; 
  cd $1;
}

function mv ()
{
    dir="$2"
    tmp="$2"; tmp="${tmp: -1}"
    [ "$tmp" != "/" ] && dir="$(dirname "$2")"
    if [ -e "$dir" ]; then
      echo ""
    else
      mkdir -p "$dir" && 
    fi
    /bin/mv -iv "$@"

}

function cd ()
{
  builtin cd $1
  doctor
  ls
}

alias cp="cp -iv"

alias qfind="find . -name "

alias numFiles='echo $(ls -1 | wc -l)'

zipf () { zip -r "$1".zip "$1" ; }

extract () {
  if [ -f $1 ] ; then
     case $1 in
       *.tar.bz2)   tar xjf $1     ;;
       *.tar.gz)    tar xzf $1     ;;
       *.bz2)       bunzip2 $1     ;;
       *.rar)       unrar e $1     ;;
       *.gz)        gunzip $1      ;;
       *.tar)       tar xf $1      ;;
       *.tbz2)      tar xjf $1     ;;
       *.tgz)       tar xzf $1     ;;
       *.zip)       unzip $1       ;;
       *.Z)         uncompress $1  ;;
       *.7z)        7z x $1        ;;
       *)     echo "'$1' cannot be extracted via extract()" ;;
     esac
  else
    echo "'$1' is not a valid file"
  fi
}

alias ivm=vim
