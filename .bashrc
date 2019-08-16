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
alias l="ls -F"
alias xcsvn="$(xcode-select -p)/usr/bin/svn"

# Use latest version of Java
JAVA_TEST=$(/usr/libexec/java_home -verbose 2>&1 | head -n 2 | tail -n 1 | cut -f 3)
if [ -x "$JAVA_TEST/bin/java" ]; then
    export JAVA_HOME=$JAVA_TEST
    export PATH="$JAVA_TEST/bin:$PATH"
fi

# Add homebrew paths, if installed
[ -d "$HOME/.brew/bin" ] && export PATH="$HOME/.brew/bin:$PATH"
[ -d "$HOME/.local/brew/bin" ] && export PATH="$HOME/.local/brew/bin:$PATH"
[ -d "$HOME/.brew/sbin" ] && export PATH="$HOME/.brew/sbin:$PATH"
[ -d "$HOME/.local/brew/sbin" ] && export PATH="$HOME/.local/brew/sbin:$PATH"
[ -d "$HOME/.brew/opt/python/libexec/bin" ] && export PATH="$HOME/.brew/opt/python/libexec/bin:$PATH"
[ -d "$HOME/.local/brew/opt/python/libexec/bin" ] && export PATH="$HOME/.local/brew/opt/python/libexec/bin:$PATH"

# Add homebrew bash completion
[ -r "$HOME/.brew/etc/profile.d/bash_completion.sh" ] && . "$HOME/.brew/etc/profile.d/bash_completion.sh"
[ -r "$HOME/.local/brew/etc/profile.d/bash_completion.sh" ] && . "$HOME/.local/brew/etc/profile.d/bash_completion.sh"

# Add user local bin path
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"
