Here is a breakdown of the essential Vim and VS Code shortcuts, organized by exactly what you need.

Because you are using the VS Code Vim extension, you get the best of both worlds: native Vim keybindings for editing and VS Code's native shortcuts for UI and file management.

## Navigation

These shortcuts keep your hands on the home row while moving around the file. They must be used in Normal mode.

| Action                        | Shortcut              | Notes                                                    |
| ----------------------------- | --------------------- | -------------------------------------------------------- |
| Move Left / Down / Up / Right | `h` / `j` / `k` / `l` | The core Vim movement keys.                              |
| Next / Previous Word          | `w` / `b`             | Jumps to the start of words. Use `e` to jump to the end. |
| Top / Bottom of File          | `gg` / `G`            | `gg` goes to line 1; `G` goes to the very last line.     |
| Half-Page Down / Up           | `Ctrl+d` / `Ctrl+u`   | Great for scanning through a long document quickly.      |

## Mode Switching (Enter/Leave Vim)

This covers getting into text-editing mode, escaping back to navigation, and turning the extension off entirely.

| Action                            | Shortcut                      | Notes                                                              |
| --------------------------------- | ----------------------------- | ------------------------------------------------------------------ |
| Enter Insert Mode (Before Cursor) | `i`                           | Standard way to start typing.                                      |
| Enter Insert Mode (After Cursor)  | `a`                           | Moves right one character, then enters Insert mode.                |
| New Line Below / Above            | `o` / `O`                     | Creates a new line and instantly puts you in Insert mode.          |
| Leave Insert Mode                 | `Esc`                         | Returns you to Normal mode.                                        |
| Toggle Vim Off/On                 | Command Palette → Vim: Toggle | Disables/enables the Vim extension completely if you need a break. |

## Cut, Delete, and Paste

These commands handle cutting (deleting to register), deleting, and pasting text. All work in Normal mode.

| Action               | Shortcut     | Notes                                                  |
| -------------------- | ------------ | ------------------------------------------------------ |
| Cut (Delete) Line    | `dd`         | Cuts the entire current line to the register.          |
| Cut Multiple Lines   | `[number]dd` | Cuts multiple lines (e.g., `3dd` cuts three lines).    |
| Cut to Next Word     | `dw`         | Cuts from cursor to the start of the next word.        |
| Cut to End of Line   | `D` or `d$`  | Cuts from cursor to the end of the line.               |
| Cut Single Character | `x`          | Cuts the character under the cursor.                   |
| Paste After Cursor   | `p`          | Pastes the contents of the register after the cursor.  |
| Paste Before Cursor  | `P`          | Pastes the contents of the register before the cursor. |

## VS Code UI: Explorer, Source Control, and Search

These are native VS Code shortcuts. They work regardless of whether you are in Normal or Insert mode.

| Action                       | Shortcut (Windows/Linux) | Notes                |
| ---------------------------- | ------------------------ | -------------------- |
| Open Explorer (Sidebar)      | `Ctrl+Shift+E`           | Opens file explorer  |
| Open Source Control (Git)    | `Ctrl+Shift+G`           | Opens git changes    |
| Open Global Search (Sidebar) | `Ctrl+Shift+F`           | Opens search sidebar |
| Toggle Sidebar Visibility    | `Ctrl+B`                 | Shows/hides sidebar  |

## Command Palette & File Hopping

These shortcuts are your primary tools for finding files and executing VS Code commands without touching the mouse.

| Action                    | Shortcut (Windows/Linux) | Notes                    |
| ------------------------- | ------------------------ | ------------------------ |
| Search Files (Go to File) | `Ctrl+P`                 | Quick file search        |
| Open Command Palette      | `Ctrl+Shift+P`           | Execute VS Code commands |

## Search in File

You can use either native Vim searching or VS Code's built-in search UI, depending on your preference.

| Action                | Shortcut              | Notes                                                                        |
| --------------------- | --------------------- | ---------------------------------------------------------------------------- |
| Vim Search Forward    | `/` + text + Enter    | Type `/`, your search term, then hit Enter.                                  |
| Vim Search Backward   | `?` + text + Enter    | Same as above, but searches up the document.                                 |
| Next / Previous Match | `n` / `N`             | Jumps to the next (`n`) or previous (`N`) match from your `/` or `?` search. |
| VS Code Native Search | `Ctrl+F` (or `Cmd+F`) | Opens the standard visual find-and-replace widget.                           |

## Find and Replace

When finding and replacing text in VS Code with the Vim extension, you have two powerful toolsets at your disposal: Vim's surgical, text-object commands and VS Code's visual interfaces.

Here are the best ways to handle find and replace, depending on the scale of the change.

### Vim's Substitution Command (The :s Command)

This is the classic Vim way to find and replace. You type these commands in Normal mode.

| Action                        | Command             | Notes                                                                                                                                |
| ----------------------------- | ------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| Replace all in file           | `:%s/old/new/g`     | Finds every instance of "old" and replaces it with "new" throughout the entire document.                                             |
| Replace all with confirmation | `:%s/old/new/gc`    | The `c` at the end asks you to confirm each replacement (`y` for yes, `n` for no).                                                   |
| Replace in current line       | `:s/old/new/g`      | Only replaces matches on the exact line your cursor is currently on.                                                                 |
| Replace in visual selection   | `:'<,'>s/old/new/g` | Highlight text in Visual mode (`v`), then press `:`. This prefix will auto-populate, allowing you to replace only within that block. |

### Quick Vim Replacements (Motion-Based)

If you only need to change a single word, character, or phrase nearby, using "Change" (c) or "Replace" (r) commands is much faster than typing out a full search command.

| Action                   | Shortcut      | Notes                                                                                                       |
| ------------------------ | ------------- | ----------------------------------------------------------------------------------------------------------- |
| Replace single character | `r` + char    | Hover over a letter, press `r`, then type the new letter. You stay in Normal mode.                          |
| Change word              | `cw`          | Deletes from the cursor to the end of the word and drops you into Insert mode.                              |
| Change inner word        | `ciw`         | Deletes the entire word you are hovering over (no matter where the cursor is on it) and enters Insert mode. |
| Change to end of line    | `C` (or `c$`) | Deletes everything from your cursor to the end of the line and enters Insert mode.                          |

### VS Code Multi-Cursor (Vim Style)

The VS Code Vim extension adds a special shortcut that bridges Vim's modal editing with VS Code's multi-cursor support. It is often faster than writing a :%s command for renaming variables.

| Action                   | Shortcut | Notes                                                                                                                                                                                             |
| ------------------------ | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Add cursor to next match | `gb`     | Put your cursor on a word. Press `gb` to select it and add a cursor to the next identical word. Press `gb` repeatedly to select more. Once selected, press `c` to change them all simultaneously. |

### VS Code Native Find & Replace

For massive refactors across multiple files, or when you just want a visual interface, bypass Vim and use VS Code's native UI.

| Action                        | Shortcut (Win/Linux) | Notes                                                                 |
| ----------------------------- | -------------------- | --------------------------------------------------------------------- |
| Replace in current file       | `Ctrl+H`             | Opens the visual find/replace widget at the top right of your editor. |
| Replace across entire project | `Ctrl+Shift+H`       | Opens the global search and replace menu in the left sidebar.         |
