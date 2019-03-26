# bash doesn't read .profile if .bash_profile exists.
# leave all env vars to .profile, and load them from here.
. ~/.profile
case $- in *i*) . ~/.bashrc;; esac
