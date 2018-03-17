# From djunkers bashscript setup (for window computers and probably others...)

## read universal bash profile
[[ -e ~/bash/my_profile ]] && source ~/bash/my_profile 

## make sure admin commands are on path
export PATH=$PATH:/sbin:/usr/sbin
