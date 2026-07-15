# Updating

This guide shows how to update individual configuration folders without copying the entire `.config` directory.

## Individual Config Folders

### Fish

```bash
cp -r .config/fish ~/.config/
```

### Waybar

```bash
cp -r .config/waybar ~/.config/
```

### Niri

```bash
cp -r .config/niri ~/.config/
```

#### Vim/VSCode Cheatsheet

```bash
cp -r .config/vim_vscode_cheatsheet.txt ~/.config/
```

### GTK Styles

```bash
mkdir -p ~/.config/gtk-3.0 ~/.config/gtk-4.0
cp -r .config/gtk-3.0/* ~/.config/gtk-3.0/
cp -r .config/gtk-4.0/* ~/.config/gtk-4.0/
```
