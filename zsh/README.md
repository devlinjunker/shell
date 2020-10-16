# ZSH Setup and Scripts

## Notes
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
- renamed help file to remind with `r!` script
- set up custom theme
  - copied bira from `~/.oh-my-zsh/themes/`
  - use personal `gitstatus` script in prompt
- Started on doctor.zsh script
  - add symbolic link in scripts directory to doctor.zsh so we have access in the path
- Started on interactive prompt for remind (r!) script
- renamed init to setup.sh for once repo downloaded

## TODO
  - [x] Research other zsh themes
     - started using bira
       - doesn't indicate that local branch is behind
       - created bira+gitstatus theme that uses gitstatus script
     - https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
  - [x] Dirty/behind repo status in prompt
      - https://stackoverflow.com/questions/41474467/zsh-theme-dirty-color-and-suffix
  - [x] zsh cheatsheet: https://blog.praveen.science/oh-my-zsh-cheat-sheet/
  - [..] Interactive help script
  - [..] Macports 
      - get version_num 
        - https://github.com/macports/macports-base/releases/latest/
        - https://api.github.com/repos/macports/macports-base/tags
        - THIS: https://api.github.com/repos/macports/macports-base/releases/latest
          - script here: https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c
          - ```
curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
grep '"tag_name":' | # Get tag line
sed -E 's/.*"([^"]+)".*/\1/'  
``` 
      - download from https://github.com/macports/macports-base/releases/download/v<version_num>/MacPorts-<version_num>.tar.bz2
        - ```
curl <url> -L -o macports.tar.bz2;
extract macports.tar.bz2;
```
      - follow instructions at https://guide.macports.org/#installing.macports.source
        - ```
cd Macports-...;
./configure;
make;
sudo make install;
```
      - Post Install
        - add `/opt/local/bin` to your PATH
        - update with `sudo port -v selfupdate`use `tag_name`
  - [..] Node and NVM (not with macports it seems)
      - after macports installed and updated: `port install nvm;` also need to add `/opt/local/share/nvm/init-nvm.sh` to PATH
      - [ ] need to setup $NVM_HOME variable and update $PATH with it
  - [..] Doctor script - on change directory?
      - check for MacPorts updates
      - check for oh-my-zsh updates
      - git fetch
      - node dependencies?
      - node version (package.json>engines OR .nvm file)
  - [ ] setup.sh script that can be wget from github to do startup in base directory
       - Verify git can be accessed or set message to install xcode
       - separate from init.zsh (which requires git repo)
       - Message to set git configs
       - Message to setup ssh configs
       - Create `~/Code` directory
       - Clone rest of `shell` repo into `~/Code/shell`
