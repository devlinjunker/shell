# My Bash Repository

This Repo is a Collection of bash configurations, shortcuts and scripts that I prefer
to use on the command line. Sets up Prompt to display useful information and adds a
few useful aliases.

I have found these changes useful as a developer to help speed up my recognition of
where I am and how to quickly start/stop programs or read files while I am sitting on
the command line. If you are unfamiliar with navigating and running programs via the
command line, I recommend [this]() review of basic functionality

## Dependencies

- Homebrew on OSX?

## How to Use these files:

1. Review the changes in `my_profile` or [here](my_profile.md)
    to get and understanding  of what is changed/added to command line
1. Clone this repo to your home directory
2. Run `setup.sh` to:
  - Copy `.bash_profile` out of the repo into your home directory
  - Reload the Bash Settings with `source ~/.bash_profile`
  - Setup vimrc file using `scripts/bvimrc`
  - Check if homebrew available and install useful packages


## TODO:
- [x] Docsify to explain scripts  
- [ ] Why do we have .bashrc too? Seems unused
- [ ] More Setup
    - Why Brew install tree?
    - [ ] NVM (not supported with brew? or maybe just need to setup $NVM_HOME and path)
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
- [ ] http://www.andrewboni.com/2017/01/01/essential-programs-to-install-on-a-new-macbook-for-engineers/  
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



## [Scripts](scripts/README.md)
Collection of small [shell scripts](scripts/README.md) I've created and used in the past.



## [My Profile](my_profile.md)
Explanation of the [changes](my_profile.md) to bash configuration and aliases
