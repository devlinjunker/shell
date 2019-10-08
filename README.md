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

1. Review the changes in `my_profile` or below to get an understanding of what is
    changed/added to command line
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



## My Profile
Based on https://natelandau.com/my-mac-osx-bash_profile/


### Custom Prompt

If currently in a gitrepo, calls `gitstatus` script to determine how up to date the git repo

```
<working directory>         <gitstatus output> | <user> @ <machine name
```


### Bash Aliases

`cp` updated to auto use `-iv` options. verbose and interactive (asking to replace existing files)

`ls` updated to auto use `-FGlAhp` options. Specialized suffix characters for special file types. Colorized output. Long Format. All Entries excpet `.` and `..`. Use unit suffixes for size output. `/` after each directory

`less` updated to auto use `-FSRXc` options. Quit less if file <= one screen length. Chop Long lines rather than wrap them. Use Raw control characters (-R not sure of use). Disable sending termcap and deinitilization strings to terminal. Clear screen on open.

`mkdir` updated to auto use `-pv` options. Create directories as required and be verbose when creating.

`..` -> `cd ../`  
`...` -> `cd ../..`  
`.{num}` -> cd up {num} directories  
`~` -> cd home directory  


__OSX Specific__

`cls`|`clr`|`c` clear the terminal screen on OSX

`finder` opens the current directory in Finder

`trash` safer version of rm on OSX (moves the specified file to the trash)


### File and Folder Management

`zipf` quickly recursively zip a folder (or single file) to a .zip archive named the same

`numFiles` returns the count of files in a directory

`extract` attempt to unzip the archive passed in (uses the following: tar, bunzip2, unrar, gunzip, unzip, uncompress, 7zip)

`cdf` attempt to cd to most recent finder directory


### Searching

`qfind` quickly find the location of a __specific__ filename in the subdirectory tree

`spotlight` use `mdfind` to find files on the computer with names that match the query


### Process Management

`findPid <term>` lists the process IDs of processes that match the query term given, uses lsof (list of open files)

`memhogstop` lists the most top 20 memory intensive process using top program. Displays the following output:  
```

  PID  COMMAND  %CPU  TIME  #TH  #WQ  #PORTS  MEM  PURG  CMPRS  PGRP  PPID  STATE  BOOSTS  %CPU_ME  %CPU_OTHRS  UID  FAULTS  COW  MSGSENT  MSGRECV  SYSBSD  SYSMACH  CSW  PAGEINS  IDLEW  POWER  USER  #MREGS  RPRVT  VPRVT  VSIZE  KPRVT  KSHRD

```

`memhogsps`|`memhogs` lists the top ten memory intensive processes using ps. Displays the following output:
```

PID  STAT  VSZ  RSS  TIME  COMM

```

`cpuhogs` lists the top ten cpu intensive processes using ps. Displays the following output:
```

PID  STAT  %CPU  TIME  COMM

```

`memtop` running process listing the top memory intensive processes, updates every 10 seconds

`cputop` running process listing the top cpu intensive processes,
updates every 10 seconds

`my_ps` finds the processes started by this user account


### Networking

`myip` returns the external ip of this computer on the internet

`myiip` returns the internal network ip of this computer on the LAN network

`netexp` pings the local network to return all of the ips of responding computers

`findPort <portNum>` show the process running on the given port, if available

`netcons` returns the network connections currently opened by this computer. Returns the process and pId plus newtwork information.

`openport` returns the open listening ports on this computer (restricted to the permissions that the current user has). Returns the process and pId plus the network information

`sudopenports`|`suopenports` returns the open listening ports on this computer (with root permissions to view processes). Same as above

`lsock` returns all network sockets open, without converting port numbers to port names (root permissions).

`lsockU` returns all UDP network sockets oepn, without converting prot numbers to port names or network numbers to host names for network files (root permission).

`lsockT` returns all TCP network sockets oepn, without converting prot numbers to port names or network numbers to host names for network files (root permission).


### OSX / System Management

`cleanupDS` deletes the DS_Store mac files created by Finder App when opening directories

`finderShowHidden` toggles the Finder App to show all hidden files and directories

`finderHideHidden` toggles the Finder App to hide all hidden files and directories

`editHosts` quickly edit the networks hosts file


### Web App Shortcuts

`chrome` open a new google Chrome window

`google <term>` opens a new google Chrome window to the google page with the term given

`inbox` opens the Google Inbox WebApp in a new Chrome window
