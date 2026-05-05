complete -c summon -f

# Complete project names
complete -c summon -a "(find $HOME/grimoire -mindepth 2 -maxdepth 2 -type d -printf '%f\n' 2>/dev/null)"

# Complete editor flag
complete -c summon -s e -l editor -x -a "windsurf antigravity cursor code" -d "Specify editor to use"
