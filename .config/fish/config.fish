set fish_greeting

if functions -q bash_aliases
  bash_aliases
end

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
