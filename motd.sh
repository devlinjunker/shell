#! /bin/bash


TREEHOUSE=(
"                       ()"
"                              ()"
"                    vvv^^^()vvvv"
"                vvvvvv^^v()vvv^^vvvv"
"      vvvvvvvv^^^^^^^^^^^^^()vvv^^^vvvv"
"  vvvvvvvv^^^v^^^vvvvvv^^vvv()vvvv^^^vvvvvvv"
"    ^vvvvvvvvv^^^^vvvvvv^^^()^vvvvvvvv^^^vvvvv^v"
" vv^^vvv^^^vvvvvv^vvvvv^vvv()v^^^vvvvvvv^^vv^"
" vv^vvvv^^vvv^^vvvvv^^vvvvv^()#vvv^vvv^^vvvv^v"
"^vvvv^^vvvvvv^vv^vvv^^^^^^__[]__#^^^vvvvv^^^^"
"  ^^vvvvv^^vvvvvvvvv^^^^/\@@@@@@\\#vvvv^^^"
"        ^^vvvv^^^^^vvvv/__\@@@@@@\^vvvv^v"
"            ;^^vvvvvvv/____\@@@@@@\\vvvvvvv"
"            ;   \_ ^\|[  -:] ||--| | _/^^"
"            ;     \  |[   :] ||_/| |/"
"            ;      \\\\||___:]______/"
"            ;       \   ;=; /"
"            ;        |  ;=;|"
"            ;        () ;=;|"
"           (()       || ;=;|"
"                    / / \;=;\\"
)

MSG=(
	""
)
OG_LENGTH=${#MSG[*]}

# Fetch Weather
RES=$(curl "https://wttr.in/Portland?0" 2> /dev/null)
OLDIFS=$IFS
IFS=$'\n'
WTTR=($RES)
IFS=$OLDIFS

# Add Weather to top of motd
wttr_length=${#WTTR[@]}
for (( i=0; i<${wttr_length}; i++ ));
do
	MSG[$((${i}+$OG_LENGTH))]+=${WTTR[$i]}
done


HOST=$(hostname)
GROUP_COUNT=$(cat /etc/group | wc -l)
USER_COUNT=$(cat /etc/passwd | wc -l)
USERS=$(w -h | wc -l)

CRONS=$(crontab -l | grep -e '^[^#]' | wc -l)
PATH_SIZE=$(echo $PATH | tr ':' '\n' | wc -l)


#HD_SIZE=$(sudo du -hd1 / 2>/dev/null | grep -P "^\d.?\dG" | sort -n | tail -n1)

OIFS=$IFS;
IFS=$'\n'
HISTORY=($(cat ~/.bash_history | tail -3))
IFS=$OIFS;

HISTORY_DIRS=($(cat ~/.bash_history | grep '^cd' | cut -d' ' -f2 | tail -3))

# TODO: WIP on custom message (server details/stats)
# mounted drives
# size of disk
# unique apps/dirs
# [x] users/groups
# [x] crontabs
# [..] history
# [..] path
# [..] current users/ips/ports/connections


MSG+=(
	""
  "      (defined in /etc/profile.d/motd.sh)"
	"|----------------------------------------------|"
	"| host: ${HOST}"
	"| users: ${USER_COUNT} | groups: ${GROUP_COUNT} | online: ${USERS} | crons: ${CRONS}" 
	"| pathsize: ${PATH_SIZE}     ( 'compgen -c' to view )"
	"| disk size: $( echo ${HD_SIZE%/} | xargs)    ( 'topdirs to view )"
	"|- (history) -- cmd ----------- dirs ----------|"
	"|  ${HISTORY[2]:0:20}"
	"|  ${HISTORY[1]:0:20}"
	"|  ${HISTORY[0]:0:20}"
	"|----------------------------------------------|"
)

length=${#MSG[@]}
start=$((${length}-4))
end=$((${length}-1))
for (( j=$start; j<${end}; j++ ));
do
	i=$((${length}-${j}-3))

	# Find Visible Character Count
	CHAR=$(echo -n -e ${MSG[$j]}| sed "s/$(echo -n -e "\e")[^m]*m//g" | tr -d ' ' | wc -c)

	# Find Visible White Space
	WHITE_SPACE=$(echo -n -e ${MSG[$j]} | tr -d -c ' ')
	
	# Pad end with spaces
	PADDING=$((25-$CHAR-${#WHITE_SPACE}))
	MSG[$j]+=$(printf ' %.0s' $(seq 1 $PADDING))

	MSG[$j]+="| ${HISTORY_DIRS[$i]:0:20}"
done

if [[ $(hostname) == "dev-junk.com" ]]; then
	# if no term then do nothing
	if [ -z $TERM ]; then
		echo "No Terminal"
	# If width of terminal > 100 characters (add treehouse to motd)
	elif [ $(tput cols) -gt 93 ]; then
		# Loop over treehouse and add to printed message
		length=${#TREEHOUSE[@]}
		for (( j=0; j<${length}; j++ ));
		do
			# Find Visible Character Count
			CHAR=$(echo -n -e ${MSG[$j]} | sed "s/$(echo -n -e "\e")[^m]*m//g" | tr -d ' ' | wc -c)

			# Find Visible White Space
			WHITE_SPACE=$(echo -n -e "${MSG[$j]}" | tr -d -c ' ' )

			# Pad end with whitespace
			PADDING=$((50-$CHAR-${#WHITE_SPACE}))
			MSG[$j]+=$(printf ' %.0s' $(seq 1 $PADDING))

			# Add Tree House
			MSG[$j]+=${TREEHOUSE[$j]}

			#MSG[$j]=$(pad 50 ${MSG[$j} ${TREEHOUSE[$j]})
		done
	fi
fi

printf -v PRINT "%s\n" "${MSG[@]}"
echo "$PRINT"



# TODO: Abstract this
pad() {
	# Find Visible Character Count
	CHAR=$(echo -n -e $2 | sed "s/$(echo -n -e "\e")[^m]*m//g" | tr -d ' ' | wc -c)

	# Find Visible White Space
	WHITE_SPACE=$(echo -n -e $2 | tr -d -c ' ')
	
	# Pad end with spaces
	PADDING=$(($1-$CHAR-${#WHITE_SPACE}))
	
	echo "$(printf ' %.0s' $(seq 1 $PADDING))| $3"
}

# pad "20" "test" 'test34'

