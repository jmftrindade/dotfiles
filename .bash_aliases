#!/bin/bash

# open specified files in Sublime, e.g., "s ."
alias s='open -a "Sublime Text"'

# listing
alias ls='ls -G'
alias l='ls -lF -G'
alias ll='ls -laF -G'
alias lsd='ls -laF -G | grep "^d"'

# git
alias gb='git branch -a'
alias gd='git diff'
alias gl='git log --oneline'
alias gs='git status --porcelain'
alias ga='git add .'
alias gc='git commit -am'  # add commit msg
alias gp='git push'
alias gr='git remote -v'
alias grm='git rm $(git ls-files --deleted)'

# tmux
alias t='tmux'

# sudo for alias'ed cmds
alias sudo='sudo '

# make vim point to MacVim's version packaged with maximum-awesome.
alias vim='mvim -v'

# Colored up cat!
# You must install Pygments first - "sudo easy_install Pygments"
# install solarized CSS: "pip install pygments-style-solarized"
alias c='pygmentize -O style=solarizeddark -f console256 -g'
#alias c='pygmentize -O style=monokai -f console256 -g'
