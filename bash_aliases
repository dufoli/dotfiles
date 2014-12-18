# Navigation and use of linux
alias 'cd..'='cd ..'
alias '..'='cd ..'
alias lr='ls -R'
alias llr='ll -R'
alias ll='ls -lF'
alias lll='ls -alF'
alias le='ls --sort=extension'
alias lle='ll --sort=extension'
alias lt='ls --sort=time'
alias llt='ll --sort=time'
alias llf='ls -alrShF'
alias rd=rmdir
alias md=mkdir
alias j=jobs
alias :q=exit
alias reloadBash="source ~/.bashrc"
alias reloadSwap="sudo swapoff -a && sudo swapon -a"
alias promptOneLine='export PS1=$PS_ONELINE'
alias promptMultiLine='export PS1=$PS_MUTLILINE'

# Program
alias monitor=gnome-system-monitor
alias vless='vim -u /usr/share/vim/vim73/macros/less.vim'
alias iconvutf8='iconv -f Latin1 -t UTF-8 ' 
alias bd=". bd -s"

#Todo Program
alias todo='~/sh-todo/todo'
alias todone='~/sh-todo/todone'
alias todone-archive='~/sh-todo/todone-archive'
alias todone-view='~/sh-todo/todone-view'

#Dropox Status
alias dst='dropbox status'
#alias dfst='dropbox filestatus'
alias dfst='dropbox filestatus | grep 'syncing''

# Development
alias gccComp='gcc -Wall -Werror -ansi -pedantic'
alias gccThreadComp='gcc -Wall -Werror -ansi -pedantic -lpthread'
alias gccOpenComp='gcc -Wall -Werror -ansi -pedantic -D_XOPEN_SOURCE -D_SVID_SOURCE'

# Git
alias gst='git status'
alias glg='git lg'
alias gdf='git diff'
alias gdiff='git diff'

# Miscellaneous
alias grepJavaR='grep -r --include "*java"'
alias grepC='grep --color=always'
alias emacss='emacs -nw'

alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -r -n -k 6 | head -15'
alias wotgobbleproc='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -r -n -k 5 | head -15'

function cdls { cd "$@" && ls;}
function cdll { cd "$@" && ll;}

