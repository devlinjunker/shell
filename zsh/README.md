# ZSH Setup and Scripts

- Started on init.sh script
  - cleaner
  - uses oh-my-zsh
- Created specific zsh env files
- Split aliases and functions into separate files
  - created one that is dependent on osx (osx.zsh)
- Added _help.zsh script that reminds us of commands to use
- ssh autocomplete
  - need to add config in `~/.ssh/config` to make easy

## TODO
  - [ ] Macports 
  - [ ] Node and NVM
  - [ ] Interactive help script
  - [ ] Dirty/behind repo status in prompt
  - [ ] Doctor script - on change directory?
    - check for MacPorts updates
    - check for oh-my-zsh updates
    - git fetch
    - node dependencies?
  - [ ] setup.zsh script that can be wget from github to do startup
       - Verify git can be accessed or set message to install xcode
       - Message to set git configs
       - Message to setup ssh configs
       - Create `~/Code` directory
       - Clone rest of `shell` repo into `~/Code/shell`
