#! /bin/zsh
# TODO: This script should be run whenever entering project directory, in order to set up local 
# env for that project automatically. 

echo "running doctor..."

# TODO: Run `nvm use` if nvm exists and .nvmrc

# Only perform steps if in git repo
gitstatus 1> /dev/null
if [[ $? == 0 ]]; then
  echo "TODO: fetching remote git..."
fi
