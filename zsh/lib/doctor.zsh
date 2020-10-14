#! /bin/zsh

echo "running doctor..."

gitstatus 1> /dev/null
if [[ $? == 0 ]]; then
  echo "fetching remote git..."
fi
