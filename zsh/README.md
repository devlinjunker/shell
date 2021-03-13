# ZSH Setup and Scripts
Notes from using ZSH instead of Bash

## FAQ
Why use MacPorts over Homebrew?
 - Community seems to be moving away from Homebrew and towards MacPorts
 - https://saagarjha.com/blog/2019/04/26/thoughts-on-macos-package-managers/

Why use ZSH over Bash?
 - ZSH provides autocomplete for git out of the box with `autoload -Uz compinit && compinit` in `zshrc.sym`
 - SSH Autocomplete improved with commands in `zshrc.sym` also

## Notes
- Sort of based on https://github.com/whatyouhide/dotfiles
- Started on init.sh script
  - cleaner
  - uses oh-my-zsh: https://github.com/ohmyzsh/ohmyzsh
- Created specific zsh env files
- Split aliases and functions into separate files
  - created one that is dependent on osx (osx.zsh)
- Started on interactive prompt for remind (r!) script
  - script that reminds us of commands to use
  - renamed help file to remind with `r!` script
- ssh autocomplete
  - need to add config in `~/.ssh/config`
  - [ ] Need to investigate more
    - Can we autocomplete anything in `~/.ssh/known_hosts`?
    - How does config work? user is automatically used? but how do I reference? 
- Started on doctor.zsh script
  - add symbolic link in scripts directory to doctor.zsh so we have access in the path
- renamed init to setup.sh for once repo downloaded
- installed vscode command line exec, open with: `code <file_path>`
- `.zshenv` is executed on every new shell instance
  - linked to my `zshenv.sym` file in this directory

### Oh My ZSH
- Themes, Plugins, Framework for Configuring ZSH Shell
  - [Configuration](https://github.com/ohmyzsh/ohmyzsh/wiki/Settings)
  - [Cheatsheet](https://github.com/ohmyzsh/ohmyzsh/wiki/Cheatsheet)
  - [Plugins](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)
- Comes with Default `.zshrc` file
  - Sets theme + other configurations
  - Plus other customer lines to import my things
    - Currently:
      - Points at custom `zshrc.sym` file in this directory
  - Defines which plugins should be loaded 
    - Currently:
      - git
- set up custom theme `bira+gitstatus`
  - copied bira from `~/.oh-my-zsh/themes/`
    - This is a ruby based theme.. may want to move away from this
  - use personal `gitstatus` script in prompt
  - shows user, host and current directory + git status if in directory

### iTerm
- Advanced Terminal (improved over osx terminal)
- Features: https://iterm2.com/features.html
  - [ ] TODO: Review these more