# My Bash Repository
Based on https://natelandau.com/my-mac-osx-bash_profile/

Collection of bash settings and scripts I prefer on the command line

Set up the Command Prompt to display useful information and a few aliases I like so far

**ToDo:**  
[] Docsify to explain scripts  
[] GitFetch prevent long timeout  
[] Make Platform Agnostic  
[] fancy ssh (change color (based on project?))  
[] cron  
[] networking  
&nbsp;&nbsp; [] number of users online  
&nbsp;&nbsp; [] open ports  
[] email  
[] headless server profile  
[] barebones profile?  
[] install script  
&nbsp;&nbsp; [] situate custom_profile  
&nbsp;&nbsp; [] vimrc  
&nbsp;&nbsp; [] node/npm  
&nbsp;&nbsp; [] git  
&nbsp;&nbsp; [] homebrew?  
&nbsp;&nbsp; [] atom? + packages?  
[] git fetch on cd  
[] gitls - display statuses of all git repositories shown  
&nbsp;&nbsp; [] include file specific info from `git status`

**To Learn**  
[] grep  
[] awk  
[] sed

### [Scripts](scripts/)


## Custom Prompt

If currently in a gitrepo, calls `gitstatus` script to determine how up to date the git repo

```
<working directory>         <gitstatus output> | <user> @ <machine name
```




## Bash Aliases

`cp` updated to auto use `-iv` options. **v**erbose and **i**nteractive (asking to replace existing files)

`ls` updated to auto use `-FGlAhp` options.

`less` updated to auto use `-FSRXc` options.

`mkdir` updated to auto use `-pv` options

`..` -> `cd ../`  
`...` -> `cd ../..`  
`.{num}` -> cd up {num} directories  
`~` -> cd home directory  


__OSX Specific__

`cls`|`clr`|`c` clear the terminal screen on OSX

`finder` opens the current directory in Finder

`trash` safer version of rm on OSX (moves the specified file to the trash)




## File and Folder Management

`zipf`

`numFiles`

`cdf`

`extract`


## Searching

`qfind`

`spotlight`




## Process Management

`findPid`

`memhogstop`

`memhogsps` | `memhogs`

`cpuhogs`

`memtop`

`cputop`

`my_ps`




## Networking

`myip`

`myiip`

`netexp`

`netcons`

`openport`

`sudopenports`

`lsock`

`lsockU`

`lsockT`




## OSX / System Management

`cleanupDS`

`finderShowHidden`

`finderHideHidden`

`editHosts`




## Web App Shortcuts

`chrome`

`google <term>`

`inbox`
