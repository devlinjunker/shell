#! /bin/zsh

# TODO: Autocomplete?
# TODO: Change color based on domain? project?

ssh -i "$AWS_KEY" ec2-user@"$1"
