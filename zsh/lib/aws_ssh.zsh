#! /bin/zsh
# quick script for ssh to AWS servers with personal key
# 
# TODO: tab completion - https://saveriomiroddi.github.io/Using-scripts-in-any-language-for-bash-zsh-tab-completion/

if [ ! $AWS_KEY ]; then
  echo "AWS_KEY env variable not set - please set in .zshenv"
  exit -1
fi

if [ ! $1 ]; then
  echo "host not set"
  exit -1
fi

ssh -i $AWS_KEY ec2-user@"$1" -v

# TODO: rather than -v, wait 5 seconds and display message if having trouble connecting
