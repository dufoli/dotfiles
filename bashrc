# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

if [ -f /usr/bin/zsh ]; then
	exec env /usr/bin/zsh
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2500
HISTFILESIZE=5000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

#This is for show details with the current branch name in the promp
#See the /etc/bash_completion.d/git file for more information
if ! type -t __git_ps1 | grep -q function ;
then
	if [ -f /etc/bash_completion.d/git ]; then
	source /etc/bash_completion.d/git
	fi
fi
#Show the diff with the upstream branch (<, >, <> or =)
GIT_PS1_SHOWUPSTREAM="auto"
#Show a * for a non clean repository, a + for a repository with staged file
GIT_PS1_SHOWDIRTYSTATE=1
#Show a $ if we have stashed file
GIT_PS1_SHOWSTASHSTATE=1
#Show a % if we have untracked file
GIT_PS1_SHOWUNTRACKEDFILES=1

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}# \[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[0;32m\]`__git_ps1`\[\033[00m\]\n\$ '
    #Original Prompt
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    #Original Prompt
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS_ONELINE='${debian_chroot:+($debian_chroot)}\u@\h[`cat /proc/loadavg | sed "s/ /\//g" | cut -d "/" -f 1-3`]:\w`__git_ps1`\$ '
    PS_MUTLILINE='${debian_chroot:+($debian_chroot)}# \u@\h [`cat /proc/loadavg | sed "s/ /\//g" | cut -d "/" -f 1-3`]:\w`__git_ps1`\n$ '
    PS_MUTLILINE='${debian_chroot:+($debian_chroot)}# \u@\h[\t]:\w`__git_ps1`\n$ '
    PS_ORIG='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

    PS1=$PS_MUTLILINE
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Export PATH to add my bin folder
export PATH=$PATH:~/Software/bin

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias grepc='grep --color=always'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# colorisation de la console perso
eval `dircolors ~/.ls_colors`


alias symfony-rebuild='./symfony doctrine:build --all-classes && ./symfony doctrine:build-sql'

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin
alias node='nodejs'
