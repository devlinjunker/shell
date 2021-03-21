

## Basic TODOs:
- [x] Docsify to explain scripts
- [x] Why do we have .bashrc too?
    - Seems like it the difference is for when you ssh (.bashrc) and vs local (.bash_profile)
- [x] More Setup
    - [x] Why Brew install tree?
        - shell application to view directory in tree format
    - [x] autocomplete: 
        - git branch: https://apple.stackexchange.com/questions/55875/git-auto-complete-for-branches-at-the-command-line
        - host file for ssh
        - zsh?
    - [x] git (with homebrew? or it comes with osx now?)
    - ~[ ] homebrew?~ 
        - ~apache? nginx?~ 
        - ~python~
        - ~elasticsearch~
        - ~mongodb~
        - ~maven~
        - ~tomcat~
    - ~[ ] Situate custom_profile~
    - [x] zsh
- [x] GitFetch prevent long timeout
- [x] Review [Learning the Shell](http://linuxcommand.org/lc3_learning_the_shell.php)
- [x] cron
- [..] networking
    - [ ] number of users online
    - [x] open ports
- [..] NVM
    - [ ] need to setup $NVM_HOME variable and update $PATH with it
      - ... why?
    - [ ] Node/NPM on path
    - after macports installed and updated: `port install nvm;` also need to add `/opt/local/share/nvm/init-nvm.sh` to PATH
- [ ] email
- [ ] Make Platform Agnostic
- [ ] better/more vimrc?
- [ ] headless server profile 
- [ ] barebones profile? (is this what the bash profile will be?)
- [ ] move github pages to `gh-pages/` dir
- [ ] ignore in global .gitfetch
      - add `.gitfetch` to ~/.gitignore
      - `git config --global core.excludesfile ~/.gitignore`


**Script Ideas**
- [..] Doctor script - on change directory?
      - check for MacPorts updates
      - check for oh-my-zsh updates
      - git fetch
      - node dependencies?
      - npm audit
      - node version (package.json>engines OR .nvm file)
- [ ] git fetch on cd (doctor script?) 
- [ ] fancy ssh? (change color (based on project?))
  - [ ] Different Terminal settings for different servers
  - [ ] Default upload bash server settings once created
  - [ ] config file somewhere?
- [ ] gitls - display statuses of all git repositories shown
    - [ ] include file specific info from `git status`
- [ ] `ghfind` - search in chrome on github at `github.com/\<owner\>/\<repo\>/find/\<branch\>`
- [ ] init.sh script that can be wget from github to do startup in base directory
       - Verify git can be accessed or set message to install xcode
       - separate from init.zsh (which requires git repo)
       - Message to set git configs
       - Message to setup ssh configs
         - ssh private key pair
         - AWS key 
       - Create `~/Code` directory
       - Clone rest of `shell` repo into `~/Code/shell`

**To Learn**  
Notes for all of these are in `remind` script
- [x] grep  
- [..] awk  
- [x] sed


**OSX Specific Ideas** 
  - [ ] install osx programs
  - disk inventory x:http://www.derlien.com/download.php?file=DiskInventoryX
  - macports from source
  - get version_num from https://github.com/macports/macports-base/releases/latest/
    - download from https://github.com/macports/macports-base/releases/latest/download/MacPorts-<version_num>.tar.bz2
    - follow instructions at https://guide.macports.org/#installing.macports.source
  - [ ] atom + packages?
  - [ ] vscode?
  - [ ] iterm review
    - [ ] powerlevel9k https://github.com/Powerlevel9k/powerlevel9k
    - [ ] Capture output for errors: https://iterm2.com/documentation-captured-output.html


## ZSH
  - [x] Research other zsh themes
     - started using bira
       - doesn't indicate that local branch is behind
       - created bira+gitstatus theme that uses gitstatus script
     - https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
  - [x] Dirty/behind repo status in prompt
      - https://stackoverflow.com/questions/41474467/zsh-theme-dirty-color-and-suffix
  - [x] zsh cheatsheet: https://blog.praveen.science/oh-my-zsh-cheat-sheet/
  - [x] Interactive help script
  - [ ] SSH Autocomplete
  - [x] Macports 
     - Post Install
        - add `/opt/local/bin` to your PATH
        - update with `sudo port -v selfupdate`use `tag_name`
      - get version_num and install
        - https://github.com/macports/macports-base/releases/latest/
        - https://api.github.com/repos/macports/macports-base/tags
        - THIS: https://api.github.com/repos/macports/macports-base/releases/latest
          - script here: https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c
```
# Find latest release from github

curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
grep '"tag_name":' | # Get tag line
sed -E 's/.*"([^"]+)".*/\1/'  


# Download from built path: https://github.com/macports/macports-base/releases/download/v<version_num>/MacPorts-<version_num>.tar.bz2

curl <url> -L -o macports.tar.bz2;
extract macports.tar.bz2;

# Follow instructions at https://guide.macports.org/#installing.macports.source

cd Macports-...;
./configure;
make;
sudo make install;
```
