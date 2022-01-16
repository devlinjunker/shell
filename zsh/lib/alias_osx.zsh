# OSX based shortcuts, aliases and functions

## Terminal
alias clr="clear"
alias cls="clear"
alias c="clear"

## File Management
alias finder="open -a Finder ./"

alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

cdf () {
  currFolderPath=$( /usr/bin/osascript <<EOT
    tell application "Finder"
      try
    set currFolder to (folder of the front window as alias)
      on error
    set currFolder to (path to desktop folder as alias)
      end try
      POSIX path of currFolder
    end tell
EOT
  )
  echo "cd to \"$currFolderPath\""
  cd "$currFolderPath"
}

trash () { command mv "$@" ~/.Trash ; }

alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"


## OSX Applications
spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }


PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


## Internet Applications

### Google
google (){
 QUERY=$@
 eval "/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome https://google.com/search\?q\='$QUERY'"
}

freshgoogle () {
 QUERY=$@
 eval "/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --new-window https://google.com/search\?q\='$QUERY'"
}

alias inbox="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --new-window https://inbox.google.com/u/2"

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --new-window &"


### Github/Gists
#### TODO: Get github username from git config
GITHUB_USER=devlinjunker

alias github="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --new-window https://github.com"
alias gists="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome  https://gist.github.com/$GITHUB_USER"
alias newgist="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome  https://gist.github.com/"

alias devjunk="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome  https://dev-junk.com/"
alias weather="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome  https://dev-junk.com/weather"

alias analytics="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome 'https://dev-junk.com/analytics/index.php?module=MultiSites&action=index&date=$(date "+%Y-%m-%d")&period=month&idSite=1&updated=2'"

