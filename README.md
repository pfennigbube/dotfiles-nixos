# NixOS Dotfiles ❄️
*My personal nixos configuration for NixOS. Grab a cup of Tea and look around!*
copying is of course allowed ✔️
![showcase of my rice](https://github.com/pfennigbube/dotfiles-nixos/blob/main/screenshots/nixosshowcase1.png)
![showcase of my rice2](https://github.com/pfennigbube/dotfiles-nixos/blob/main/screenshots/nixosshowcase2.png)
     
# Biggest thanks to all the people which helped me to get this rice done!
     
- [my friend which got me into nix](https://github.com/AimPizza)
- [the great user wiki](https://nixos.wiki/wiki/Main_Page)
- [the official wiki](https://wiki.nixos.org/wiki/NixOS_Wiki)
- [notusknots dots](https://github.com/notusknot/dotfiles-nix)
- [andreys dots](https://github.com/Andrey0189/nixos-config)
     
i cant call up every name from which i got inspiration and help from but if you ever find 
anything that looks almost like mine, my biggest thanks!
     
# Informations and things that might interest you
- uses the great [Catppuccin](https://github.com/catppuccin/catppuccin) theme
- Terminal Emulator: 🐱 kitty
- Shell: 🐚 zsh with ohmyzsh
- Browser: 🌐 qutebrowser and 🐺 Librewolf
- Notifications: ✍️ Swaync
- File-Manager: 📁 Thunar
- Discord Client: 🗣️ Vesktop
- Bar: 📊 Waybar
- Editor: 🗒️ Helix

  # Installation
  **Important!**
  - **Read through all files and see if there are any files that could harm your PC!**
  - **Dont use my hardware-configuration.nix.. the values for the drives are only for my drives.. You have to move you own hardware-configuration.nix (/etc/nixos) into the dotfiles folder!**
  ## Actual Install Process
  What do you need?
  - [A running NixOS installation](https://nixos.org/manual/nixos/stable/index.html#ch-installation)
   - The best would be with a USB-Stick and any non Minimal NixOS variant with a Desktop Environment like GNOME or KDE (just makes the install process easier) 
  - [git installed as a package](https://nixos.org/manual/nixos/stable/#sec-package-management)
  Clone my repo (git clone) and change the directory (cd) into the repo
```bash
git clone https://github.com/pfennigbube/dotfiles-nixos && cd dotfiles-nixos
```
move your hardware-configuration.nix from /etc/nixos to the dotfiles directory and just replace mine
```bash
mv /etc/nixos/hardware-configuration  dotfiles-nixos/
```
now you should not have to care about anything anymore and just [rebuild the flake](https://nixos.wiki/wiki/Nixos-rebuild) that i put into that directory! (you need to be in the directory of the flake, later you can just type rb and it will automatically rebuild from that directory (linux moment 👍 )
```bash
sudo nixos-rebuild switch --flake .#yourcomputerhostname
```
("yourcomputerhostname" has to be changed to the name of your machine (#default should work fine tho))


and thats it! after some waiting you can reboot your pc and it should look just like mine!
  # Troubleshooting
  - just contact me or [open an issue](https://github.com/pfennigbube/dotfiles-nixos/issues)!

**Happy Coding!** 💚

     
      
