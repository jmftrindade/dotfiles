#!/bin/bash

# jfon: import aliases
source ~/.bash_aliases

# jfon: python setup, from:
# https://medium.com/@briantorresgil/definitive-guide-to-python-on-mac-osx-65acd8d969d0
# activate virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# create commands to override pip restriction.
# use `gpip` or `gpip3` to force installation of
# a package in the global python environment
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
gpip3(){
   PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}


# TODO: jfon: auto complete git commands
# from https://git-scm.com/book/en/v1/Git-Basics-Tips-and-Tricks
#source ~/git-completion.bash

# TODO: jfon: Latex style checker from https://github.com/vvcogo/style-check-html
#export PATH="/Users/jfon/src/style-check-html:$PATH"

# Rust env path variable.
source $HOME/.cargo/env

# TODO: jfon: distributary: Export OpenSSL headers for Mac OS X build.
#export DEP_OPENSSL_INCLUDE=/usr/local/opt/openssl/include
#export OPENSSL_INCLUDE_DIR=/usr/local/opt/openssl/include

# TODO: jfon: For Spark binaries.
#export SPARK_HOME="/usr/local/spark-2.0.2"
#export PATH="$PATH:$SPARK_HOME/bin"

# For Flink binaries.  From:
# https://streambench.wordpress.com/2017/10/26/setting-up-apache-flink-on-mac-os-x/
alias start-flink='/usr/local/Cellar/apache-flink/1.3.2/libexec/bin/start-local.sh'
alias stop-flink='/usr/local/Cellar/apache-flink/1.3.2/libexec/bin/stop-local.sh'

# TODO: jfon: Prometheus's install dir.
#export PROMETHEUS_HOME="/usr/local/prometheus-1.6.1.darwin-amd64"

# TODO: jfon: Apache Kafka's install dir.
# export KAFKA_HOME="/usr/local/confluent-3.2.1"



## Prompt colors, from:
# https://github.com/barryclark/bashstrap

### Prompt Colors
# Modified version of @gf3’s Sexy Bash Prompt
# (https://github.com/gf3/dotfiles)
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
	tput sgr0
	if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
		MAGENTA=$(tput setaf 9)
		ORANGE=$(tput setaf 172)
		GREEN=$(tput setaf 190)
		PURPLE=$(tput setaf 141)
	else
		MAGENTA=$(tput setaf 5)
		ORANGE=$(tput setaf 4)
		GREEN=$(tput setaf 2)
		PURPLE=$(tput setaf 1)
	fi
	BOLD=$(tput bold)
	RESET=$(tput sgr0)
else
	MAGENTA="\033[1;31m"
	ORANGE="\033[1;33m"
	GREEN="\033[1;32m"
	PURPLE="\033[1;35m"
	BOLD=""
	RESET="\033[m"
fi

export MAGENTA
export ORANGE
export GREEN
export PURPLE
export BOLD
export RESET

# Git branch details
function parse_git_dirty() {
	[[ $(git status 2> /dev/null | tail -n1) != *"working directory clean"* ]] && echo "*"
}
function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# Change this symbol to something sweet.
# (http://en.wikipedia.org/wiki/Unicode_symbols)
symbol="⚡ "

export PS1="\[${MAGENTA}\]\u \[$RESET\]in \[$GREEN\]\w\[$RESET\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$RESET\]\n$symbol\[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"


### Misc

# Only show the current directory's name in the tab
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

