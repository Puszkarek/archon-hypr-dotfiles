# Catppuccin color palette

# --> special
set -l foreground aee29e
set -l selection 1b4e2a

# --> palette
set -l teal 299a82
set -l flamingo ff9fd6
set -l mauve 9d72ff
set -l pink ff6bcd
set -l red ff6b6b
set -l peach f9c859
set -l green 26be5e
set -l yellow f9c859
set -l blue 5494fc
set -l gray aee29e
set -l completion ffa96b

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
