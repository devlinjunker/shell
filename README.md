# My Bash Repository

This Repo is a Collection of bash configurations, shortcuts and scripts that I prefer
to use on the command line. Sets up Prompt to display useful information and adds a
few useful aliases.

I have found these changes useful as a developer to help speed up my recognition of
where I am and how to quickly start/stop programs or read files while I am sitting on
the command line.

If you are unfamiliar with navigating and running programs via the
command line, I recommend:
- [this](http://linuxcommand.org/lc3_learning_the_shell.php) review of basic command
line operations and commands
- [this](https://bitbucket.org/BitPusher16/dotfiles/raw/49a01d929dcaebcca68bbb1859b4ac1aea93b073/refs/git/git_examples.sh)
example/explanation of how to use git, and
- [this](https://vim.rtorr.com/)
review of commands for vim

## Dependencies

- Homebrew on OSX?
- Git
- Node Version Manager & Node+NPM
- Vim

## How to Use these files:

1. Review the changes in `my_profile` or [here](my_profile.md?id=my-custom-bash-profile-and-configuration)
    to get and understanding  of what is changed/added to command line
1. Clone this repo to your home directory
2. Run `setup.sh` to:
  - Copy `.bash_profile` out of the repo into your home directory
  - Reload the Bash Settings with `source ~/.bash_profile`
  - Setup vimrc file using `scripts/bvimrc`
  - Check if homebrew available and install useful packages


## TODO:
- [x] Docsify to explain scripts
- [x] Why do we have .bashrc too?
    - Seems like it the difference is for when you ssh (.bashrc) and vs local (.bash_profile)
- [ ] More Setup
    - [x] Why Brew install tree?
        - shell application to view directory in tree format
    - [ ] git branch autocomplete: https://apple.stackexchange.com/questions/55875/git-auto-complete-for-branches-at-the-command-line
    - [ ] NVM
        - [ ] need to setup $NVM_HOME variable and update $PATH with it
    - [ ] Node/NPM on path
    - [ ] git (with homebrew? or it comes with osx now?)
    - [ ] homebrew?
        - apache? nginx?
        - python
        - elasticsearch
        - mongodb
        - maven
        - tomcat
    - [ ] situate custom_profile
    - [ ] more vimrc
    - [ ] atom? + packages?
    - [ ] zsh
    - [ ] iterm?
        - [ ] powerlevel9k https://github.com/Powerlevel9k/powerlevel9k
- [ ] Review [Learning the Shell](http://linuxcommand.org/lc3_learning_the_shell.php)
- [ ] GitFetch prevent long timeout
- [ ] Make Platform Agnostic
- [ ] fancy ssh (change color (based on project?))
- [ ] cron
- [ ] networking
    - [ ] number of users online
    - [x] open ports
- [ ] email
- [ ] headless server profile
- [ ] barebones profile?
- [ ] git fetch on cd
- [ ] gitls - display statuses of all git repositories shown
    - [ ] include file specific info from `git status`

**To Learn**  
[ ] grep  
[ ] awk  
[ ] sed



## [Scripts](scripts/README.md?id=collection-of-bash-scripts)
Collection of small [shell scripts](scripts/README.md?id=collection-of-bash-scripts) I've created and used in the past.



## [My Profile](my_profile.md?id=my-custom-bash-profile-and-configuration)
Explanation of the [changes](my_profile.md?id=my-custom-bash-profile-and-configuration) to bash configuration and aliases
