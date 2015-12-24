# Include system-wide bashrc if it exists
[ -r "/etc/bashrc" ] && . "/etc/bashrc"

# PS1 prompt elements
PS1Time="\t"
PS1PathShort="\w"
PS1User="\u@\h"
PS1NewLine="\n"

PS1Color_Off="\[\033[0m\]"
PS1IBlack="\[\033[0;90m\]"
PS1Cyan="\[\033[0;36m\]"
PS1Yellow="\[\033[0;33m\]"

# Determine whether color is available
case "$TERM" in
    xterm|xterm-color|xterm-256color) color_prompt=yes;;
    screen) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    alias ls="ls -G"

    PS1=$PS1IBlack$PS1Time$PS1Color_Off' '
    PS1=$PS1$PS1Cyan$PS1User$PS1Color_Off$PS1NewLine
    PS1=$PS1$PS1Yellow$PS1PathShort$PS1Color_Off
    PS1=$PS1'\$ '
else
    PS1=$PS1NewLine$PS1Time' '$PS1User$PS1NewLine
    PS1=$PS1$PS1PathShort'\$ '
fi

# Clean up prompt elements
unset PS1Time PS1PathShort PS1User PS1NewLine
unset PS1Color_Off PS1IBlack PS1Cyan PS1Yellow

# Add a few helpful aliases
alias ll="ls -alF"

# Add path
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"
