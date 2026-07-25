
function __get_git_branch
    git branch --show-current 2>/dev/null
end

function __get_git_ahead_behind
    set -l ab (git rev-list --left-right --count '@{upstream}...HEAD' 2>/dev/null)
    test -n "$ab"
    and echo $ab
end

function __build_git_status
    set -l git_dir (git rev-parse --git-dir 2>/dev/null)
    test -n "$git_dir"; or return

    set -l out

    # ahead / behind (simplified to arrows only)
    set -l ab (__get_git_ahead_behind)
    if test -n "$ab"
        set -l behind (echo $ab | cut -f1)
        set -l ahead (echo $ab | cut -f2)
        if test "$ahead" -gt 0; and test "$behind" -gt 0
            set out "$out↑$ahead ↓$behind"
        else if test "$ahead" -gt 0
            set out "$out↑$ahead"
        else if test "$behind" -gt 0
            set out "$out↓$behind"
        end
    end

    test -n "$out"
    and echo $out
end

function __build_duration
    set -l ms $CMD_DURATION
    test -n "$ms"; or return
    test "$ms" -ge 1000
    or return

    set -l s (math -s0 "$ms / 1000")
    set -l m (math -s0 "$s / 60")
    set -l s_rem (math -s0 "$s % 60")

    if test "$m" -gt 0
        echo "◄ $m"m" $s_rem"s""
    else
        echo "◄ $s_rem"s""
    end
end

# --- Left prompt ---

function __is_vscode_terminal
    test "$TERM_PROGRAM" = "vscode"
end

function fish_prompt
    set -l last_status $status

    # Optional: show duration of previous long command on separate line
    set -l duration (__build_duration 2>/dev/null)
    if test -n "$duration"
        set -l timestamp (date '+%H:%M:%S')
        echo (set_color cyan --dim)"[⏱ $duration @ $timestamp]"(set_color normal)
    end

    # Character: ◎ success, ○ error (hide in VS Code integrated terminal)
    if not __is_vscode_terminal
        if test $last_status -eq 0
            echo -n -s (set_color --bold yellow) "◎ " (set_color normal)
        else
            echo -n -s (set_color --italics magenta) "○ " (set_color normal)
        end
    else
        echo -n "λ "
    end
end

# --- Right prompt ---

function fish_right_prompt
    # Directory: current folder only
    set -l cwd (basename $PWD)
    set -l git_root (git rev-parse --show-toplevel 2>/dev/null)
    set -l in_repo_root false
    test -n "$git_root"; and test "$PWD" = "$git_root"
    and set in_repo_root true

    # Folder with icon before name
    echo -n -s (set_color --bold brblue) "↳ " (set_color normal)
    echo -n -s (set_color --italics blue) $cwd (set_color normal)

    # Git branch and status
    set -l branch (__get_git_branch)
    if test -n "$branch"
        echo -n -s (set_color --bold yellow) "  ⌘ " (set_color normal)
        echo -n -s (set_color --italics yellow) $branch (set_color normal)
        set -l status_str (__build_git_status)
        test -n "$status_str"
        and echo -n -s (set_color --bold yellow) " " $status_str (set_color normal)
    end

    # Time
    set -l now (date +%R)
    echo -n -s (set_color --bold brblue) "  " (set_color normal)
    echo -n -s (set_color white --dim --italics) $now " " (set_color normal)
end
