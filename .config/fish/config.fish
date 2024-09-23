set fish_greeting

source ~/.bash_aliases
set -gx HOSTNAME (hostname)
[ -e ~/.bash_aliases.$HOSTNAME ]; and source ~/.bash_aliases.$HOSTNAME

# Fish-specific aliases (see ~/.bashrc for bash equivalent).
# e.g., ff "*.java"
function ff
  if set -q argv[1]
    find . -name "$argv[1]" -type f 2>/dev/null;
  end
end

# e.g., ffg "*.java" "ERROR"
function ffg
  if set -q argv[2]
    find . -name "$argv[1]" -type f 2>/dev/null | xargs grep "$argv[2]";
  end
end

# brew install fzf  # OSX
# https://github.com/junegunn/fzf/releases tarball  # Linux
fzf --fish | source
