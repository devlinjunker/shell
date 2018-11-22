# My Bash Repository
Based on https://natelandau.com/my-mac-osx-bash_profile/

Collection of bash settings and scripts I prefer on the command line

Set up the Command Prompt to display useful information and a few aliases I like so far

**ToDo:**  
[x] Docsify to explain scripts  
[ ] GitFetch prevent long timeout  
[ ] Make Platform Agnostic  
[ ] fancy ssh (change color (based on project?))  
[ ] cron  
[ ] networking  
&nbsp;&nbsp; [ ] number of users online  
&nbsp;&nbsp; [x] open ports  
[ ] email  
[ ] headless server profile  
[ ] barebones profile?  
[ ] install script  
&nbsp;&nbsp; [ ] situate custom_profile  
&nbsp;&nbsp; [ ] vimrc  
&nbsp;&nbsp; [ ] node/npm  
&nbsp;&nbsp; [ ] git  
&nbsp;&nbsp; [ ] homebrew?  
&nbsp;&nbsp; [ ] atom? + packages?  
[ ] git fetch on cd  
[ ] gitls - display statuses of all git repositories shown  
&nbsp;&nbsp; [ ] include file specific info from `git status`

**To Learn**  
[ ] grep  
[ ] awk  
[ ] sed

### [Scripts](scripts/)


## Custom Prompt

If currently in a gitrepo, calls `gitstatus` script to determine how up to date the git repo

```
<working directory>         <gitstatus output> | <user> @ <machine name
```




## Bash Aliases

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




## File and Folder Management

`zipf` quickly recursively zip a folder (or single file) to a .zip archive named the same

`numFiles` returns the count of files in a directory

`extract` attempt to unzip the archive passed in (uses the following: tar, bunzip2, unrar, gunzip, unzip, uncompress, 7zip)

`cdf` attempt to cd to most recent finder directory


## Searching

`qfind` quickly find the location of a __specific__ filename in the subdirectory tree

`spotlight` use `mdfind` to find files on the computer with names that match the query




## Process Management

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




## Networking

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




## OSX / System Management

`cleanupDS` deletes the DS_Store mac files created by Finder App when opening directories

`finderShowHidden` toggles the Finder App to show all hidden files and directories

`finderHideHidden` toggles the Finder App to hide all hidden files and directories

`editHosts` quickly edit the networks hosts file




## Web App Shortcuts

`chrome` open a new google Chrome window

`google <term>` opens a new google Chrome window to the google page with the term given

`inbox` opens the Google Inbox WebApp in a new Chrome window
