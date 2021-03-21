BASH_REPO_DIR=${dir}

# Load custom my_profile with prompt and aliases
[[ -e ~/bash/my_profile ]] && source ~/bash/my_profile

# Load other profile files
[[ -e ~/.profile ]] && source ~/.profile
[[ -e ~/.bashrc ]] && source ~/.bashrc
