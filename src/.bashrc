# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

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

if [ -f ~/.git-completion ]; then
  source ~/.git-completion
fi

# see environ manfile
export EDITOR=vim # Default Editor
export VISUAL=$EDITOR # Visual not really used differently from EDITOR anymore
export LESS='-iMR' # Case insensitive search, verbose prompting and raw output
export PAGER=LESS # Used to display text / man files

# Git PS1
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWSTASHSTATE=true

# History
# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=50000 # For a huge history
HISTFILESIZE=2000

shopt -s histappend # Append to the history file, not overwrite
PROMPT_COMMAND='history -a ; history -n' # Keep history sync'd between bash sessions (Can slow bash down)

# Bash behavior
shopt -s cdspell # Corrects minor spelling errors when cd-ing
set -o vi # Set prompt to vi mode
set -o notify # Report status of terminated background jobs immediately

#Aliases
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

#alias grep='grep --color=auto'
#alias fgrep='fgrep --color=auto'
#alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'

alias os='start src/*.sln'
alias bake='bundle exec rake'

function vim(){
  gvim --remote-tab-silent "$@" & :
}
