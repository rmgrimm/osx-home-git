# Include system-wide profile first
[ -r "/etc/profile" ] && . "/etc/profile"

# When running bash, also include bashrc
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists and is readable
    [ -r "$HOME/.bashrc" ] && . "$HOME/.bashrc"
fi
