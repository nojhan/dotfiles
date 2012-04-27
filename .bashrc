if [ -f /etc/bashrc ]; then
        . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi

function proxy()
{
    export http_proxy="http://localhost:8888"
    export ftp_proxy="ftp://localhost:8888"
    echo "localhost:8888"
}

function noproxy()
{
	export http_proxy=""
	export ftp_proxy=""
}

# Set up prompts. Color code them for logins. Red for root, 
# white for user logins, green for ssh sessions, cyan for telnet,
# magenta with red "(ssh)" for ssh + su, magenta for telnet.
THIS_TTY=tty`ps aux | grep $$ | grep bash | awk '{ print $7 }'`
SESS_SRC=`who | grep $THIS_TTY | awk '{ print $6 }'`

SSH_FLAG=0
SSH_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
if [ $SSH_IP ] ; then
  SSH_FLAG=1
fi
SSH2_IP=`echo $SSH2_CLIENT | awk '{ print $1 }'`
if [ $SSH2_IP ] ; then
  SSH_FLAG=1
fi
if [ $SSH_FLAG -eq 1 ] ; then
  CONN=ssh
elif [ -z $SESS_SRC ] ; then
  CONN=lcl
elif [ $SESS_SRC = "(:0.0)" -o $SESS_SRC = "" ] ; then
  CONN=lcl
else
  CONN=tel
fi

# Okay...Now who we be?
if [ `/usr/bin/whoami` = "root" ] ; then
  USR=u_root
else
  USR=nou_root
fi

BLUE="\[\033[0;34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
LIGHT_GREEN="\[\033[1;32m\]"
LIGHT_BLUE="\[\033[1;34m\]"
LIGHT_CYAN="\[\033[1;36m\]"
YELLOW="\[\033[1;33m\]"
WHITE="\[\033[1;37m\]"
RED="\[\033[0;31m\]"
NO_COL="\[\033[00m\]"

jobcount()
{
    rep=""
    running=`jobs -r | wc -l | tr -d " "`
    stopped=`jobs -s | wc -l | tr -d " "`

    if [ $running != "0" -a $stopped != "0" ] ; then
        rep=" ${running}r/${stopped}s "

    elif [ $running != "0" -a $stopped == "0" ] ; then
        rep=" ${running}r "

    elif [ $running == "0" -a $stopped != "0" ] ; then
        rep=" ${stopped}s "
    fi

    echo -ne "$rep"
}

git_branch()
{
    if git rev-parse --git-dir >/dev/null 2>&1 ; then
        gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
    else
        return 0
    fi
    echo -e " $gitver"
}

git_branch_color()
{
    if git rev-parse --git-dir >/dev/null 2>&1 ; then
        red=`tput setaf 1`
        green=`tput setaf 2`
        yellow=`tput setaf 3`
     
        color=""
        if git diff --quiet 2>/dev/null >&2 ; then
            has_commit=`git rev-list origin/master..master`
            if [ "$has_commit" == "" ] ; then
                color="${green}" # nothing to commit or push
            else
                color="${yellow}" # some commits to push
            fi
        else
            color="${red}" # changes to commit
        fi
    else
        return 0
    fi
    echo -ne $color
}

# different colors depending on connexion type and user
if [ $CONN = lcl -a $USR = nou_root ] ; then
    PS1="${WHITE}[\u \w]${NO_COL}"
elif [ $CONN = lcl -a $USR = u_root ] ; then
  PS1="${YELLOW}[\w]${NO_COL}"
elif [ $CONN = tel -a $USR = nou_root ] ; then
  PS1="[\u${LIGHT_GREEN}@\h${NO_COL} \w]${NO_COL}"
elif [ $CONN = tel -a $USR = u_root ] ; then
  PS1="${RED}[\u @${YELLOW}\h${RED} \w]${NO_COL}"
elif [ $CONN = ssh -a $USR = nou_root ] ; then
  PS1="[\u @${LIGHT_BLUE}\h${NO_COL} \w]${NO_COL}"
elif [ $CONN = ssh -a $USR = u_root ] ; then
  PS1="${RED}[\u @${LIGHT_BLUE}\h${RED} \w]${NO_COL}"
fi

# add job count
PS1="$PS1${LIGHT_BLUE}\$(jobcount)${NO_COL}"

if [ $USR = nou_root ] ; then
    # add git branch and status
    PS1="$PS1\$(git_branch_color)\$(git_branch)${NO_COL}"
fi

# add prompt mark
if [ $USR = nou_root ] ; then
    PS1="$PS1${WHITE}\\$ ${NO_COL}"
elif [ $USR = u_root ] ; then
    PS1="$PS1${RED}\\$ ${NO_COL}"
fi

battery()
{
    red=`tput setaf 1`
    green=`tput setaf 2`
    yellow=`tput setaf 3`
    sgr0=`tput sgr0`
    b=`acpi --battery | sed "s/^Battery .*, \([0-9]*\)%/\1/"`
    if [ $? == 0 ] ; then
        if [ $b -ge 50 ] ; then # more than 50% of battery, green
            echo -ne "/${green}$b%${sgr0}"
        elif [ $b -ge 10 ] ; then # more than 10%, yellow
            echo -ne "/${yellow}$b%${sgr0}"
        else # less than 10%, red
            echo -ne "/${red}$b%${sgr0}"
        fi
    else
        echo -n ""
    fi
}
# add battery status
PS1="\$(battery)]$PS1"

load_out()
{
  echo -n "$(uptime | sed -e "s/.*load average: \(.*\...\), \(.*\...\), \(.*\...\).*/\1/" -e "s/ //g")"
}

load_color()
{
  gray=0
  red=1
  green=2
  yellow=3
  blue=4
  magenta=5
  cyan=6
  white=7

  # Colour progression is important ...
  #   bold gray -> bold green -> bold yellow -> bold red -> 
  #   black on red -> bold white on red
  #
  # Then we have to choose the values at which the colours switch, with
  # anything past yellow being pretty important.

  tmp=$(echo $(load_out)*100 | bc)
  let load100=${tmp%.*}

  if [ ${load100} -lt 70 ]
  then
    tput bold ; tput setaf ${gray}
  elif [ ${load100} -ge 70 ] && [ ${load100} -lt 120 ]
  then
    tput bold ; tput setaf ${green}
  elif [ ${load100} -ge 120 ] && [ ${load100} -lt 200 ]
  then
    tput bold ; tput setaf ${yellow}
  elif [ ${load100} -ge 200 ] && [ ${load100} -lt 300 ]
  then
    tput bold ; tput setaf ${red}
  elif [ ${load100} -ge 300 ] && [ ${load100} -lt 500 ]
  then
    tput setaf ${gray} ; tput setab ${red}
  else
    tput bold ; tput setaf ${white} ; tput setab ${red}
  fi
}

# add colored load average
PS1="[\[\$(load_color)\]\$(load_out)${NO_COL}$PS1"

# Glue the bash prompt always go to the first column .
# Avoid glitches after interrupting a command with Ctrl-C
PS1="\[\033[G\]$PS1"


# Prevents accidentally clobbering files.
alias mv='mv -i'
alias mkdir='mkdir -p'

# The 'ls' family (this assumes you use the GNU ls))
# Mispelling on azerty keyboards
alias lks='ls'
alias ks='ls'
alias ms='ls'

alias ls='ls -hF --color'       # add colors for filetype recognition
alias l='ls'
alias la='ls -Al'               # show hidden files
alias lx='ls -lXB'              # sort by extension
alias lk='ls -lSr'              # sort by size
alias lc='ls -lcr'          	# sort by change time  
alias lu='ls -lur'	        	# sort by access time   
alias lr='ls -lR'               # recursive ls
alias lt='ls -ltr'              # sort by date
alias lm='ls -al --color=none|less'  # pipe through 'less'
alias ll='ls -l'
alias tree='tree -Csu'		# nice alternative to 'ls'

alias psg='ps aux|grep ' # grep a process
alias agrep="ack-grep"

# Find a file with a pattern in name from the current directory
# ff name
function ff()
{ find . -type f -iname '*'$*'*' -ls ; }

# get the current IP adresses on eth0
function myip() 
{
    MY_IP=$(/sbin/ifconfig eth0 | awk '/inet/ { print $2 } ' | sed -e s/adr:// | sed -e s/inet6://)
    echo $MY_IP
}

# repeat n times command
# repeat 10 echo "ok"
function repeat()
{
    local i max
    max=$1; shift;
    for ((i=1; i <= max ; i++)); do  # --> C-like syntax
        eval "$@";
    done
}

# move to ~/.Trash instead of rm a file
function del()
{
	for i in $* ; do
		mv $i ~/.Trash
	done
}

# alias I want to learn
function h()
{
echo "la : show hidden files"
echo "lx : sort by extension"
echo "lk : sort by size"
echo "lc : sort by change time"
echo "lu : sort by access time"
echo "lr : recursive ls"
echo "lt : sort by date"
echo "lm : pipe through 'less'"
echo "tree : nice alternative to 'ls'"
echo "ff [pattern] : find a file with a pattern in name"
echo "myip : show the IP address of eth0"
echo "repeat [n] [command] : repeat n times command"
echo "clean : remove backip files (*~)"
echo "psg : ps aux | grep "
echo "rcp : copy with rsync/ssh"
}

# default editor
export EDITOR='gvim'

# move backup files to trash
alias clean='mv *~ ~/.Trash/'

# do not permits to recall dangerous commands in bash history
export HISTIGNORE='&:[bf]g:exit:*>|*:history*::*rm*-rf*:*rm*-f*'
# append history rather than overwrite
shopt -s histappend
unset HISTFILESIZE
HISTSIZE=1000000
# ignore commands that start with a space AND duplicate commands
HISTCONTROL=ignoreboth
# add the full date and time to lines
HISTTIMEFORMAT='%F %T'
# one command per line
shopt -s cmdhist
# append history rather than overwritting it
PROMPT_COMMAND='history -a' 
# store history immediately
#; history -n'

# baskcup shortcuts
alias rcp='rsync -avz --ignore-existing --progress --rsh "ssh -l nojhan" '
alias rcp_443='rsync -avz --ignore-existing --progress --rsh "ssh -p 443 -l nojhan" '

# ipython shell with correct default apps
alias ipy='ipython -pylab -p scipy --editor="gvim"'

# nautilus file manager in browser mode without ddestkop management
alias nautile='nautilus --no-desktop --browser'

alias cgcc="colout :[0-9]+: yellow standard | colout error | colout warning magenta | colout pragma green standard"


# Added by autojump install.sh
source /etc/profile.d/autojump.bash
/usr/games/fortune vimtips
