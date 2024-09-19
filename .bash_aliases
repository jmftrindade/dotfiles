#!/bin/bash

# interactive mode by default
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# apps
alias d='docker'
alias f='fish'
alias o='open'
alias v='vim'

# net
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias localip='ipconfig getifaddr en0'
alias netinfo='nslookup `ip`'

# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# eza >> ls
alias ls='eza -F --group-directories-first --color=auto'
alias l='ls'
alias la='ls -a'
alias ll='ls -lag --time-style=long-iso'
alias lg='ll --git'
alias lt='ls -T'

# git
alias g='git'
#alias grm='git rm $(git ls-files --deleted)'

# tmux
alias t='tmux'

# sudo for alias'ed cmds
alias sudo='sudo '

# Colored up cat!
# You must install Pygments first:
#   debian: "sudo easy_install Pygments"
#   OSX: "brew install pygments"
# install solarized CSS: "pip install pygments-style-solarized"
alias c='pygmentize -O style=solarizeddark -f console256 -g'
