# If not running interactively, don't do anything
[ -z "$P#S1" ] && return

export PS1="\[\e[0;91m\]\u\[\e[0;36m\]@\[\e[0;91m\]\h\[\e[0m\] \[\e[0;36m\]\W\[\e[0m\] \[\e[1;91m\]:\[\e[0m\]"
#export PS1="\u@\h:\W\\$ "
#export PS1="\[$(tput sgr0)\]\[$(tput setaf 1)\]\u\[$(tput setaf 6)\]@\[$(tput setaf 1)\]\h \[$(tput setaf 6)\]\W\[$(tput setaf 1)\]\\$ \[$(tput sgr0)\]"

### ALIASES ###
  alias c='clear'
  alias g='git'
  alias vi='vim'

  #Make things look nice on OSX and Linux
  platform=$(uname)

if [[ $platform == 'Linux' ]]; then
    # Linux things
    alias ls='ls --color=auto'
    alias l='ls -lahF --color=always'

elif [[ $platform == 'Darwin' ]]; then
    # OS X things
    alias pb="pbpaste | pbcopy"
    alias ls='ls -G'
    alias o="open"
    alias du1='du -h -d 1'
fi

  #Make Things Look Nice
  alias df='df -h'
  alias du='du -ch'
  alias diff="$HOME/.colordiff"
  alias grep='grep --color=always'
  alias mkdir='mkdir -pv'
 
  # Enable aliases to be sudo’ed
  alias sudo='sudo '

  #Ease of Use
  alias mdstat='cat /proc/mdstat'
  alias ports='netstat -tulanp'
  alias wget='wget -c'

  #Simple Git 
  alias gadd="git add"
  alias gs="git status"
  alias gpull="git pull"
  alias gpush="git push"
  alias gnotrack="git update-index --assume-unchanged"
  alias gtrack="git update-index --no-assume-unchanged"

  #Sorry Steam Locomotive and GTI
  alias sl='ls'
  alias gti='git'

  #Programs and Script's I can't live without
  alias ack="$HOME/.pt"
  alias htop="$HOME/.htop"
  alias pt="$HOME/.pt"
  alias smem="$HOME/.smem"

  #Easier Back Navigation
  alias .='cd ../'
  alias ..='cd ../../'
  alias ...='cd ../../../'
  alias ....='cd ../../../../'

  #Only use X11 Forwarding Explicitly

  alias ssh='ssh -x'
  alias ssy='ssh -CX -c arcfour,blowfish-cbc'


### GIT ###
gcom () {
    git commit -am $1
}

gita () {
  git add *; git commit -m $1; sleep 1; git push;
}

### COMPLETION ###	
  complete -cf sudo
  set completion-ignore-case on
  if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
      . /etc/bash_completion
  fi

  if [ -d /usr/local/etc/bash_completion.d ] && ! shopt -oq posix; then
    for completion in /usr/local/etc/bash_completion.d/*;do
      . /usr/local/etc/bash_completion.d/completion
    done
  fi

### FUNCTIONS ###

# extract a file
function extract {
  if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
    if [ -f $1 ] ; then
      # NAME=${1%.*}
      # mkdir $NAME && cd $NAME
      case $1 in
        *.tar.bz2) tar xvjf ../$1 ;;
        *.tar.gz) tar xvzf ../$1 ;;
        *.tar.xz) tar xvJf ../$1 ;;
        *.lzma) unlzma ../$1 ;;
        *.bz2) bunzip2 ../$1 ;;
        *.rar) unrar x -ad ../$1 ;;
        *.gz) gunzip ../$1 ;;
        *.tar) tar xvf ../$1 ;;
        *.tbz2) tar xvjf ../$1 ;;
        *.tgz) tar xvzf ../$1 ;;
        *.zip) unzip ../$1 ;;
        *.Z) uncompress ../$1 ;;
        *.7z) 7z x ../$1 ;;
        *.xz) unxz ../$1 ;;
        *.exe) cabextract ../$1 ;;
        *) echo "extract: '$1' - unknown archive method" ;;
      esac
    else
      echo "$1 - file does not exist"
    fi
  fi
}

alias x="extract"

### VARIABLES ###

  export BLOCKSIZE=M

  ## EDITOR ##
  export EDITOR='vim'
  export SVN_EDITOR='vim'
  export VISUAL='vim'

  ## LESS ##
  export LESSOPEN='|$HOME/.lesspipe/lesspipe.sh %s'
  export LESS='-R'

  ## HISTORY ##
  export HISTCONTROL='ignoredups:ignoreboth'
  export HISTSIZE=16384
  export HISTFILESIZE=$HISTSIZE
  export HISTTIMEFORMAT="%a %F %r " 
  export HISTIGNORE='&:[ ]*:clear:exit'
  export PROMPT_COMMAND='history -a; history -r'
  shopt -s cmdhist
  shopt -s histappend

  ## MAIL ##
  shopt -u mailwarn
  unset MAILCHECK

  ## TERMINAL ##
  export TERM=xterm-256color
  
  force_color_prompt=yes
  shopt -s cdspell
  shopt -s checkwinsize
  shopt -s nocaseglob

## Brew Management
alias update='brew update; brew upgrade; brew cleanup'

## Ignore case when using tab complete
bind "set completion-ignore-case on"


cd $HOME
