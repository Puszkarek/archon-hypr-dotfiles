if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Load the jetpack-style fish prompt from a separate file for easy editing
source (path dirname (status -f))/fish_prompt.fish

# If running from tty1 start sway
set TTY1 (tty)
[ "$TTY1" = "/dev/tty1" ] && exec dbus-run-session sway --unsupported-gpu

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

set -x COWPATH $HOME/.config/cows $COWPATH

fastfetch
fortune | cowsay -f r2d2-c3po | awk -v width=(tput cols) '{
    lines[NR] = $0
    if (length($0) > max) max = length($0)
}
END {
    pad = int((width - max) / 2)
    for (i=1; i<=NR; i++) {
        for (k=0; k<pad; k++) printf " "
        print lines[i]
    }
}'


# Git command aliases
alias gsw 'git switch'
alias gck 'git checkout -b'
alias gwa 'git switch alpha'
alias gps 'git push origin'
alias gpl 'git pull origin'
alias gpla 'git pull origin alpha'
alias gcb 'git checkout -b'
alias gbd 'git branch -D'