if [ -f /etc/bashrc ]; then
        . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi
# if [ -f /etc/bash_completion ]; then
#     . /etc/bash_completion
# fi

##############
# Networking #
##############

function proxy()
{
    proxy_url="$(~/proxy.sh)"
    export  http_proxy="$proxy_url"
    export https_proxy="$proxy_url"
    export   ftp_proxy="$proxy_url"
    echo ${proxy_url##*@}
}

function noproxy()
{
    export http_proxy=""
    export https_proxy=""
    export ftp_proxy=""
}

# get the current IP adresses on eth0
function myip() 
{
    MY_IP=$(/sbin/ifconfig eth0 | awk '/inet/ { print $2 } ' | sed -e s/adr:// | sed -e s/inet6://)
    echo $MY_IP
}

# baskcup shortcuts
alias rcp='rsync -avz --ignore-existing --progress --rsh "ssh -l nojhan" '
alias rcp_443='rsync -avz --ignore-existing --progress --rsh "ssh -p 443 -l nojhan" '


###################
# File management #
###################

# Find a file with a pattern in name from the current directory
# ff name
function ff()
{ find . -type f -iname '*'$*'*' -ls ; }

# move to ~/.Trash instead of rm a file
function del()
{
    for i in $* ; do
        mv $i ~/.Trash
    done
}

# go up n directories
up()
{
    local str=""
    local count=0
    while [[ "$count" -lt "$1" ]] ;
    do
        str=$str"../"
        let count=count+1
    done
    cd $str
}

alias ..='cd ..'
alias ...='cd ../../'

# move backup files to trash
alias clean='mv *~ ~/.Trash/'

# Prevents accidentally clobbering files.
alias mv='mv -i'
alias mkdir='mkdir -p'

# The 'ls' family (this assumes you use the GNU ls))
# Mispelling on azerty keyboards
alias lks='ls'
alias ks='ls'
alias ms='ls'

alias ls='ls -hF --color'       # add colors for filetype recognition
alias l='ls -1'
alias la='ls -Al'               # show hidden files
alias lx='ls -lXB'              # sort by extension
alias lk='ls -lSr'              # sort by size
alias lc='ls -lcr'              # sort by change time
alias lu='ls -lur'              # sort by access time
alias lr='ls -lR'               # recursive ls
alias lt='ls -ltr'              # sort by date
alias lm='ls -al --color=none|less'  # pipe through 'less'
alias ll='ls -l'
alias tree='tree -Csu'          # nice alternative to 'ls'

# changes the default head/tail behaviour to output x lines,
# where x is the number of lines currently displayed on your terminal
alias head='head -n $((${LINES:-`tput lines 2>/dev/null||echo -n 12`} - 2))'
alias tail='tail -n $((${LINES:-`tput lines 2>/dev/null||echo -n 12`} - 2))'

# If the output is smaller than the screen height is smaller,
# less will just cat it
# + support ANSI colors
export LESS="-FX -R"

# Syntax coloring with pygments in less, when opening source files
export LESSOPEN='|~/code/dotfiles/lessfilter.sh %s'

# nautilus file manager in browser mode without destkop management
alias nautile='nautilus --no-desktop --browser'

# Make a directory and move to it
function md() {
    mkdir $1
    cd $1
}


# use up/down to search history, matching the current line start
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

#############
# Processes #
#############

alias psg='ps aux|grep -v grep | grep -i --color=auto ' # grep a process


##########
# Coding #
##########

alias agrep="ag"
alias ag="~/apps/the_silver_searcher-master/ag"

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

# default editor
export EDITOR='gvim --nofork'

# print a vim fortune at startup
#/usr/games/fortune vimtips

# ipython shell with correct default apps
alias ipy='ipython -pylab -p scipy --editor="gvim"'

# colored cmake/gcc output using the colout command
# usage: cm ./build_script
function cm()
{
    set -o pipefail
    $@ 2>&1 | colout -t cmake | colout -t g++
}


# shortcut to display the url config of remote repo in a git root
alias git_remotes="grep -A 2 \"\[remote\" .git/config|grep -v fetch|sed \"s/\[remote \\\"//\"|sed ':a;N;\$!ba;s/\"\]\n\s*url = /\t/g'"

# Pretty git log
alias git_log="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

function git_ignore()
{
    if [[ ! -f .gitignore ]] ; then
        echo ".gitignore" > .gitignore
    fi
    git ls-files --other --exclude-standard >> .gitignore
}

#################
# Configuration #
#################

alias upgrade="sudo apt-get update && sudo apt-get dist-upgrade -y && sudo apt-get autoclean -y && sudo apt-get clean"

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
echo "md : mkdir, cd"
echo "tree : nice alternative to 'ls'"
echo "ff [pattern] : find a file with a pattern in name"
echo "myip : show the IP address of eth0"
echo "repeat [n] [command] : repeat n times command"
echo "clean : remove backip files (*~)"
echo "psg : ps aux | grep "
echo "rcp : copy with rsync/ssh"
}

# do not permits to recall dangerous commands in bash history
export HISTIGNORE='&:[bf]g:exit:*>|*::*rm*-rf*:*rm*-f*'
# append history rather than overwrite
shopt -s histappend
# one command per line
shopt -s cmdhist
unset HISTFILESIZE
HISTSIZE=1000000
# ignore commands that start with a space AND duplicate commands
HISTCONTROL=ignoreboth
# add the full date and time to lines
HISTTIMEFORMAT='%F %T '
# store history immediately
#; history -n'

# Manually switch to the bépo keyboard layout
alias bepo="setxkbmap -layout fr -variant bepo -option"

# Super nice prompt
source ~/.liquidpromptrc
source ~/.liquidprompt

# Added by autojump install.sh
#source /etc/profile.d/autojump.bash

