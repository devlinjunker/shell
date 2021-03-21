# Bash Specific Notes
Notes from my configurations for Bash

## How to use (OLD)

1. Review the changes in `my_profile` or [here](my_profile.md?id=my-custom-bash-profile-and-configuration)
    to get and understanding  of what is changed/added to command line
1. Clone this repo to your home directory
2. Run `setup.sh` to:
  - Create symbolic link `~/.bash_profile` to `.bash_profile.sym` in this directory
  - Create symbolic link `~/.bashrc` to `.bashrc.sym` in this directory
  - Setup vimrc file using `scripts/bvimrc`
3. if on OSX, run `setup-osx.sh` to:
  - Check if homebrew available and install useful packages
    - nvm
    - tree directory viewer
