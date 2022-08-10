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
    IFS=' ' read -r -a proxies <<< "$proxy_url"
    export  http_proxy="${proxies[0]}"
    export https_proxy="${proxies[1]}"
    export   ftp_proxy="${proxies[0]}"
    echo ${proxies[@]}
}

function proxy_app()
{
    proxy_url="$(~/proxy_app.sh)"
    IFS=' ' read -r -a proxies <<< "$proxy_url"
    export  http_proxy="${proxies[0]}"
    export https_proxy="${proxies[1]}"
    export   ftp_proxy="${proxies[0]}"
    echo ${proxies[@]}
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

# copy a stream in the X clipboard, e.g. "cat file | xcopy"
alias xcopy="xclip -i -selection clipboard"

# baskcup shortcuts
alias rcp='rsync -avz --ignore-existing --progress --rsh "ssh -l nojhan" '
alias rcp_443='rsync -avz --ignore-existing --progress --rsh "ssh -p 443 -l nojhan" '
alias rcp_80='rsync -avz --ignore-existing --progress --rsh "ssh -p 80 -l nojhan" '


###################
# File management #
###################

# Find a file with a pattern in name from the current directory
# ff name
function ff()
{ find . -type f -iname "'*'$*'*'" -ls ; }

# move to ~/.Trash instead of rm a file
function del()
{
    for i in $* ; do
        mv $i ~/.local/share/Trash/files/
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
clean()
{
    local globs='*~ .*.swp *.cpp.o'

    while true; do
        read -p "Supprimer récursivement les fichiers '$globs' à partir de $(pwd) ?" yn
        case $yn in
            [YyOo]* ) break;;
            [Nn]* ) exit;;
            * ) echo "Répondez par oui ou par non";;
        esac
    done

    for g in $globs ; do
        echo -n "$g ..."
        find . -name "$g" -delete
        echo " done"
    done
}

# Prevents accidentally clobbering files.
alias mv='mv -i'
alias mkdir='mkdir -p'

# The 'ls' family (this assumes you use the GNU ls))
# Mispelling on azerty keyboards
alias lks='ls'
# alias ks='ls'
alias ms='ls'

# alias ls='ls -hF --color'       # add colors for filetype recognition
# alias l='ls -1'
# alias la='ls -Al'               # show hidden files
# alias lx='ls -lXB'              # sort by extension
# alias lk='ls -lSr'              # sort by size
# alias lc='ls -lcr'              # sort by change time
# alias lu='ls -lur'              # sort by access time
# alias lr='ls -lR'               # recursive ls
# alias lt='ls -ltr'              # sort by date
# alias lm='ls -al --color=none|less'  # pipe through 'less'
# alias ll='ls -l'
# alias tree='tree -Csu'          # nice alternative to 'ls'

export PATH="$PATH:$HOME/.cargo/bin"
exadef="--icons --modified --git"
exal="--long --all --group --modified --header --level 2"
alias ls='exa ${exadef}'       # add colors for filetype recognition
alias  l='exa ${exadef} -1'
alias la='exa ${exadef} --all'               # show hidden files
alias lx='exa ${exadef} ${exal} --sort extension'              # sort by extension
alias lk='exa ${exadef} ${exal} --sort size'              # sort by size
alias lc='exa ${exadef} ${exal} --sort modified'              # sort by change time
alias lu='exa ${exadef} ${exal} --sort accessed'              # sort by access time
alias lt='exa ${exadef} ${exal} --sort created'              # sort by date
alias lr='exa ${exadef} ${exal} --recurse'               # recursive ls
alias lm='exa ${exadef} ${exal} | kak'  # pipe through editor
alias ll='exa ${exadef} ${exal}'
alias tree='exa ${xadef} ${exal} --tree'          # nice alternative to 'ls'

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
alias Ex='nautilus --no-desktop --browser .'

# Make a directory and move to it
function md() {
    mkdir $1
    cd $1
}


# if in an interactive shell
if [[ $- == *i* ]]; then
    # use up/down to search history, matching the current line start
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi

#############
# Processes #
#############

function psg() {
    #        do not show grep itself           color matching string              color the PID
    ps aux | grep -v grep | grep --ignore-case --color=always $1 | colout '^\S+\s+([0-9]+).*$' blue
}

function agc() {
    ag "$1" | colout "$1"
}



# Notify when a command is completed, with a visual warning.
function notify() {
    cmd=$(echo "$1" | sed 's/&/&amp;/g')
    if [[ "$1" != "" ]] ; then
        $@
    fi
    if [[ $? ]] ; then
        msg="Your \"$cmd\" command is completed"
    else
        msg="There was an error in your \"$cmd\" command"
    fi
    zenity --info --text "$msg\nin $((e-s)) s\n$(date)" &
}

# Notify when a command is completed, with an audio and visual warning.
function notice() {
    s=$SECONDS

    cmd=$(echo "$1" | sed 's/&/&amp;/g')
    if [[ "$1" != "" ]] ; then
        $@
    fi
    if [[ $? ]] ; then
        msg="Your \"$cmd\" command is completed"
    else
        msg="There was an error in your \"$cmd\" command"
    fi
    zenity --info --text "$msg\nin $((e-s)) s\n$(date)" &

    # if the command has run more than a minute
    # then say loudly that it ended
    e=$SECONDS
    if [[ $((e-s)) -ge 1 ]] ; then
        espeak -s 110 "$msg" 2>/dev/null >/dev/null
    fi
}

# Notify with a visual warning.
function ended() {
    notify
}

function forever() {
    cmd="$1"
    while [[ 1 ]]; do
        echo "$cmd"
        $cmd
        if [[ $? > 128 ]]; then
            break;
        fi
    done
}


##########
# Coding #
##########

#alias agrep="ag"
#alias ag="~/apps/the_silver_searcher/ag"
#alias kak="/home/nojhan/code/kakoune/src/kak"

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
export EDITOR='kak'

# aliases to manage vim in server mode
alias latexed="gvim --servername LATEX "
# alias ide="gvim --servername IDE "
alias ide="kak -s ide -e 'rename-client main'"

# print a vim fortune at startup
#/usr/games/fortune vimtips

# ipython shell with correct default apps
alias ipy='ipython -pylab -p scipy --editor="gvim"'

# colored cmake/gcc output using the colout command
# usage: cm ./build_script
function cm()
{
    set -o pipefail
    $@ 2>&1  | colout -t cmake | colout -t g++ | colout -t ctest
    #| less
}

function cpy()
{
    set -o pipefail
    $@ 2>&1  | colout -t python
}

function ctex()
{
    set -o pipefail
    $@ 2>&1  | colout -t latex
}

function m()
{
    set -o pipefail
    cm cmake .. && cm make $@ && ./$@
}

function ma()
{
    set -o pipefail
    N=$(($(nproc)-1))
    cm cmake .. && cm make -j $N $@ && cm ctest -j $N
}


# shortcut to display the url config of remote repo in a git root
alias git_remotes="grep -A 2 \"\[remote\" .git/config|grep -v fetch|sed \"s/\[remote \\\"//\"|sed ':a;N;\$!ba;s/\"\]\n\s*url = /\t/g'"

# Pretty git log
alias git_log="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# ignore all files that are not versioned in a git repository
function git_ignore()
{
    if [[ ! -f .gitignore ]] ; then
        echo ".gitignore" > .gitignore
    fi
    git ls-files --other --exclude-standard >> .gitignore
}

# Take a snapshot of the current git repository and zip it.
# The archive file name has the current date in its name.
function git_archive()
{
    last_commit_date=$(git log -1 --format=%ci | awk '{print $1"_"$2;}' | sed "s/:/-/g")
    project=$(basename $(pwd))
    branch=$(git rev-parse --abbrev-ref HEAD)
    name=${project}_${branch}_${last_commit_date}
    git config tar.tar.xz.command "xz -c"
    git archive --prefix=$name/ --format tar.xz ${branch} > $name.tar.xz
    echo $name.tar.xz
}


# Intuitive calculator on the command line
# $ = 3 × 5.1 ÷ 2
# 7,65
calc() {
    calc="$@"
    # We can use the unicode signs × and ÷
    calc="${calc//×/*}"
    calc="${calc//÷//}"
    echo -e "$calc\nquit" | gcalccmd | sed 's/^> //g'
}


#################
# Configuration #
#################

# Note: purge-old-kernels is in the bikeshed package
alias upgrade="sudo apt update && sudo apt dist-upgrade -y && sudo apt --purge autoremove -y && sudo apt autoclean -y && sudo apt clean"

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
echo "clean : remove backup files (*~)"
echo "psg : ps aux | grep "
echo "rcp : copy with rsync/ssh"
}

# do not permits to recall dangerous commands in bash history
# export HISTIGNORE='&:[bf]g:exit:*>|*:*rm*-rf*'
export HISTIGNORE='&:[bf]g:exit:*>|*'
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

# Import the correct alias for thefuck
eval $(thefuck --alias fuck)

# Use liquidprompt only if in an interactive shell
if [[ $- == *i* ]]; then
    # Super nice prompt
    source ~/.liquidprompt --no-activate
    lp_activate #--no-config
    DOTMATRIX_VARIANT="chevron"
    source ~/code/liquidprompt/themes/dotmatrix/dotmatrix.theme && lp_theme dotmatrix
fi

# Use autojump only if in an interactive shell
if [[ $- == *i* ]] ; then
    source /usr/share/autojump/autojump.bash
fi

export TCLLIBPATH="~/.local/share/tkthemes"

# Add pip bin dir to path:
export PATH="$PATH:/home/nojhan/.local/bin/"

# export PYTHONPATH="$PYTHONPATH:/home/nojhan/code/terminator/"
export PYTHONPATH="$PYTHONPATH:/opt/pyAgrum/lib/python3.8/site-packages/"
