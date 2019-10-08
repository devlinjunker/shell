### Works on osx and linux machines that you ssh into

# Load custom my_profile with prompt and aliases
[[ -e ~/bash/my_profile ]] && source ~/bash/my_profile

# Load other profile files
[[ -e ~/.profile ]] && source ~/.profile
[[ -e ~/.bashrc ]] && source ~/.bashrc
