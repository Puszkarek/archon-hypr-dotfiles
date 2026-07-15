# Setup

## Moving Files

1. Copy `config` folder to `~/.config`

   ```
   cp -r .config/* ~/.config
   ```

   - Notes:
     - Waybar it's set to only show on my monitor, so you might want to edit the `waybar/config` file to fit your setup.

1. Copy fonts to `~/.fonts`
   ```
   sudo cp -r fonts/.fonts/* /usr/share/fonts/ && cp -R fonts/fontconfig/* ~/.config/fontconfig/
   ```
1. Copy `zen-browser` files
   ```
   cp -r zen-browser/* ~/.zen/${PROFILE}/chrome/
   ```
1. Copy `icons` folder to `~/.icons`
   ```
   sudo cp -r .icons/* /usr/share/icons/
   ```
1. Copy `sddm` theme

   ```
   sudo cp -r sddm/* /usr/share/sddm/themes/
   ```

   - Run the following commands to create the config directory and set the theme:

   ```bash
   sudo mkdir -p /etc/sddm.conf.d
   printf "[Theme]\nCurrent=nyxtralis\n" | sudo tee /etc/sddm.conf.d/nyxtralis.conf
   ```

   - (Optional) If you want to enable autologin, run this command as well:

   ```bash
   printf "\n[Autologin]\nUser=$USER\nSession=hyprland.desktop\n" | sudo tee -a /etc/sddm.conf.d/nyxtralis.conf
   ```

   - Don't forget to enable the SDDM service so it runs on boot:

   ```bash
   sudo systemctl enable sddm
   ```

## Utility Folders

Create the workspace directory structure:

```bash
mkdir -p ~/grimoire/desires
mkdir -p ~/grimoire/pacts
mkdir -p ~/grimoire/coven
mkdir -p ~/grimoire/appendices
mkdir -p ~/grimoire/revelations
mkdir -p ~/incantations
```
