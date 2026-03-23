# Catppuccin color palette

# --> special
set -l foreground 23262d
set -l selection 0f630c

# --> palette
set -l teal 24bd5c
set -l flamingo 24bd5c
set -l mauve 24bd5c
set -l pink ff00ff
set -l red ff2e6e
set -l peach d0f9f4
set -l green 24bd5c
set -l yellow d0f9f4
set -l blue 5494fc
set -l gray b5ccba
set -l completion d0f9f4

# Syntax Highlighting
set -g fish_color_normal $foreground
set -g fish_color_command $blue
set -g fish_color_param $green
set -g fish_color_keyword $red
set -g fish_color_quote $peach
set -g fish_color_redirection $green
set -g fish_color_end $green
set -g fish_color_error $red
set -g fish_color_gray $gray
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $pink
set -g fish_color_escape $flamingo
set -g fish_color_autosuggestion $gray
set -g fish_color_cancel $red

# Prompt
set -g fish_color_cwd $yellow
set -g fish_color_user $teal
set -g fish_color_host $blue

# Completion Pager
set -g fish_pager_color_progress $completion
set -g fish_pager_color_prefix $completion
set -g fish_pager_color_completion $completion
set -g fish_pager_color_description $completion
