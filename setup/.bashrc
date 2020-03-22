# Use vim-mode in bash
set -o vi

#Show stuff in the directory you move into
function cd() {
    new_directory="$*";
    if [ $# -eq 0 ]; then
        new_directory=${HOME};
    fi;
    builtin cd "${new_directory}" && ls
}

#Touchpad setupt 
#Find your touchpad with xinput-list. Get the id and use xinput list-props id to see the  settings you would like to fix

# Use natural scroll

#Touch to click
xinput set-prop 14 337 1

#Natural scroll
xinput set-prop 14 345 1

#Load bash aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


