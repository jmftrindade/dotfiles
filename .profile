. $HOME/.environ

if [ -f "$HOME/.profile.$HOSTNAME" ]; then
  . $HOME/.profile.$HOSTNAME
fi

if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
  . $HOME/.bashrc
fi

true
