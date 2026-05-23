# Voidots
My notes on void linux installation and personalisation

---

## Table of contents
- [Installation](#installation)
- [Style](#style)
- [Keys](#keys)
- [Package Manager](#package-manager)
  - [Packages Utility](#packages-utility)
  - [Packages Games](#packages-games)
- [Extra software](#extra-software)
- [Gaming and Nvidia](#gaming-nvidia)
- [Grub](#grub)
- [Lightdm](#lightdm)
- [Bluetooth](#bluetooth)
- [Omen lights](#omen-lights)
- [Key remaps](#key-remaps)
- [To do](#to-do)

---

## Installation
Chosen XFCE version with GlibC for maximum compatibility
In live context, used the following commands to start installation
```bat
sudo su -
void-installer
```
Created three partitions
| mountpoint | FS | size |
|-------|-------|--------|
|/boot/efi|vfat|1 GB|
|swap|swap|8 GB|
|/|ext4|450 GB|

---
## Style
I removed every panel, only left a topbar for now.
Created the Cruxified theme, based on Cruxish default theme
```bat
cp -r /usr/share/themes/Cruxish ~/.themes/Cruxified
```
Edited themerc to add colors to borders: white for active window, red for others.
```bat
active_border_color=#AAAAAA
inactive_border_color=#FF0000
```
Since the border was too thin, I also added 4 more lines to the xpm files starting with "bottom", adding 4 to the number of columns (second in the numbers vector of each file).

Gtk3/4 theme: [Squared](https://www.xfce-look.org/p/2206255)

---
## Keys
- super+w: close window
- super+t: terminal
- super+f: web browser
- super+g: thunar
- ctrl+alt+left/right: change workspace
- ctrl+alt+shift+left/right: move window to workspace
- alt+leftclick: move window
- alt-rightclick: resize window
- alt+keypad numbers: tile window to screen zones

---
## Package Manager
Query the remote packages list with:
```bat
xbps-query -Rs name
```
Update system:
```bat
sudo xbps-install -Syu
```
Add repo:
```bat
sudo xbps-install -S void-repo-nonfree
```

---
### Packages: utility
- keepassxc : password manager
- xfce4-screenshooter : for screenshots (with Stamp key)
- libreoffice : documents, work
- engrampa : archives explorer, integrated with thunar
- octoxbps : graphical package manager for xbps
- pdfarranger : pdf editing (merging, splitting, etc)

---
### Packages: games
- dunelegacy
- prismlauncher
- openjdk25
- steam

---
## Extra software
Installed with script provided on the main webpage
- [VeraCrypt](https://veracrypt.io)
- Discord

---
## Gaming and Nvidia graphics
```bat
sudo xbps-install -S nvidia nvidia-libs
sudo xbps-install steam
sudo xbps-install -S void-repo-multilib{,-nonfree}
sudo xbps-install -S libgcc-32bit libstdc++-32bit libdrm-32bit libglvnd-32bit mesa-dri-32bit
sudo xbps-install nvidia-libs-32bit
```

---
## Grub
```bat
sudo mousepad /etc/default/grub
```
Uncommented the lines:
- GRUB_BACKGROUND=/usr/share/void-artwork/splash.png
- GRUB_GFXMODE=1280x1024x32
- GRUB_COLOR_NORMAL="light-blue/black"
- GRUB_COLOR_HIGHLIGHT="light-cyan/blue"

Modified lines:
- GRUB_TIMEOUT=15
- GRUB_CMDLINE_LINUX_DEFAULT="loglevel=4 video=1920x1080-32@60"

Then applied with:
```bat
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

---
## Lightdm
The login manager is way too small for a 4K monitor. I edited the gtk graphics with:
```bat
sudo mousepad /etc/lightdm/lightdm-gtk-greeter.conf
```

Adding the line:
```bat
xft-dpi = 192
```
Now it is usable.

---
## Bluetooth
Installed base packages with:
```bat
sudo xbps-install libspa-bluetooth
sudo xbps-install bluez
```
Registered the service and started it and added user to group with:
```bat
sudo ln -s /etc/sv/bluetoothd /var/service
sudo sv up bluetoothd
sudo usermod -aG bluetooth trogoz
```
Then added a GUI manager:
```bat
sudo xbps-install blueman
```

---
## Omen lights
Installed [Omen-light](https://github.com/chiahsing/omen-light)
```bat
sudo xbps-install hidapi-devel
git clone https://github.com/chiahsing/omen-light
g++ -o omen_light omen_light.cc -lhidapi-libusb
```
I created [lux.bash](scripts/lux.bash), added run permissions and made it autorun, adding it to /etc/rc.local

---
## Key remaps
Installed the X11 packages to interact with keybinds:
```bat
sudo xbps-install xev xbindkeys 
```
With xev it is possible to retrieve the button names, for example my mouse buttons are 8 and 9.
Then I generated the base config for xbindkeys
```bat
xbindkeys --defaults > ~/.xbindkeysrc
```
And edited the file to add the workspace switching functionality I needed. To do that the needed package is:
```bat
sudo xbps-install xdotool
```
The resulting config file is my [.xbindkeysrc](.xbindkeysrc)

---
## To do
- [ ] overlay clock (dclock is cool, TUI clock?)
- [ ] overlay workspace notifier (partially done)
- [x] Volume keys
- [X] Mouse buttons
- [X] Save dotfiles
- [ ] startup section (rc.local for prior to login (root) and .xinitrc for user)
- [ ] 3D printing
- [ ] arduino nfc reader and URKA
- [ ] rougue galaxy in heroic launcher
- [ ] PS1 color for user vs root
- [ ] backup system
- [ ] add recovery in grub
- [ ] save grub.conf
- [ ] desktop environment? (tiling?)
- [ ] AI
- [ ] VR


