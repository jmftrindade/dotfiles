# https://unix.stackexchange.com/questions/427234/how-to-access-bash-aliases-in-fish
function bash_aliases \
    --description 'import bash aliases to .fish function files.'
    for a in (cat ~/.bash_aliases  | grep "^alias")
        set aname (echo $a | sed 's/alias \(.*\)=\(\'\|\"\).*/\1/')
        set command (echo $a | sed 's/alias \(.*\)=\(\'\|\"\)\(.*\)\2/\3/')

        # This overwrites existing aliases.
        alias $aname $command
        funcsave $aname
    end
end
