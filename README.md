# Voidots
My notes on void linux installation and personalisation

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

## Style
Created the Cruxified theme, based on Cruxish default theme but with added borders
White border for active window, red for others
I also removed every panel, only left a topbar for now

## Keys
- super+w: close window
- super+t: terminal
- super+f: web browser
- super+g: thunar
- ctrl+alt+left/right: change workspace
- ctrl+alt+shift+left/right: move window to workspace
- alt+leftclick: 

## package manager
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

## Packages
- keepassxc
- xfce4-screenshooter
- libreoffice
- engrampa
- dunelegacy
- octoxbps

## Extra software
Installed with script provided on the main webpage
- veracrypt
- discord

## Gaming
```bat
sudo xbps-install -S nvidia nvidia-libs
sudo xbps-install steam
sudo xbps-install -S void-repo-multilib{,-nonfree}
sudo xbps-install -S libgcc-32bit libstdc++-32bit libdrm-32bit libglvnd-32bit mesa-dri-32bit
sudo xbps-install nvidia-libs-32bit
```

## Grub
sudo mousepad /etc/default/grub
-attivata splashscreen e gfx resolution decommentando roba
sudo grub-mkconfig -o /boot/grub/grub.cfg

###BT
sudo xbps-install libspa-bluetooth
sudo xbps-install bluez
sudo ln -s /etc/sv/bluetoothd /var/service
sudo usermod -aG bluetooth trogoz
sudo xbps-install blueman
-giocando con blueman-manager e connettendomi piu volte alla fine ha registrato il dispositivo

### omen lights
sudo xbps-install hidapi-devel
git clone https://github.com/chiahsing/omen-light
g++ -o omen_light omen_light.cc -lhidapi-libusb
  e cosi compila
creato:
#!/bin/bash
/home/trogoz/scripts/omen-light/omen_light 1 on static 0 0 0
/home/trogoz/scripts/omen-light/omen_light 4 on static 0 255 0
/home/trogoz/scripts/omen-light/omen_light 2 on static 0 0 0
poi chmod +x lux.bash
e aggiunto lux.bash a /etc/rc.local

###key remaps
siamo su X11 quindi usiamo xev e xbindkeys con xdotool per cambiare workspace
sudo xbps-install xev xbindkeys xdotool
xbindkeys --defaults > ~/.xbindkeysrc
killall xbindkeys; xbindkeys


###tema cruxified
sono partito da un tema esistente, rinominandolo:
cp -r /usr/share/themes/Cruxish ~/.themes/Cruxified
ho modificato il themerc aggiungendo dei colori ai bordi:
active_border_color=#AAAAAA
inactive_border_color=#FF0000
siccome lo spessore non mi soddisfaceva, ho aggiunto altre 4 righe al bordo inferiore 
nei files xpm che iniziano con "bottom", e sommato 4 al numero di colonne (seondo numero nel vettore alle prime righe)

###idee
scorciatoie da tastiera per il volume
aggiungere un orologio in overlay e magari anche cambio workspace in overlay?
salvare dei dotfiles con font, tema gtk e tema window decorator


