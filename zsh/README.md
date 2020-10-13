# ZSH Setup and Scripts

- Sort of based on https://github.com/whatyouhide/dotfiles
- Started on init.sh script
  - cleaner
  - uses oh-my-zsh: https://github.com/ohmyzsh/ohmyzsh
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
    - https://stackoverflow.com/questions/41474467/zsh-theme-dirty-color-and-suffix
  - [ ] Doctor script - on change directory?
    - check for MacPorts updates
    - check for oh-my-zsh updates
    - git fetch
    - node dependencies?
    - node version (package.json>engines OR .nvm file)
  - [ ] setup.zsh script that can be wget from github to do startup
       - Verify git can be accessed or set message to install xcode
       - Message to set git configs
       - Message to setup ssh configs
       - Create `~/Code` directory
       - Clone rest of `shell` repo into `~/Code/shell`
  - [ ] Research other zsh themes
