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
Created the Cruxified theme, based on Cruxish default theme but with added borders: white for active window, red for others.
I also removed every panel, only left a topbar for now.

Colorscheme: [Squared](https://www.xfce-look.org/p/2206255)

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

## Packages: utility
- keepassxc
- xfce4-screenshooter
- libreoffice
- engrampa
- octoxbps

## Packages: games
- dunelegacy
- prismlauncher
- openjdk25

## Extra software
Installed with script provided on the main webpage
- [VeraCrypt](veracrypt.io)
- Discord

## Gaming and Nvidia graphics
```bat
sudo xbps-install -S nvidia nvidia-libs
sudo xbps-install steam
sudo xbps-install -S void-repo-multilib{,-nonfree}
sudo xbps-install -S libgcc-32bit libstdc++-32bit libdrm-32bit libglvnd-32bit mesa-dri-32bit
sudo xbps-install nvidia-libs-32bit
```

## Grub
```bat
sudo mousepad /etc/default/grub
```
Uncommented the lines:
- GRUB_BACKGROUND=/usr/share/void-artwork/splash.png
- GRUB_GFXMODE=800x600x32
- GRUB_COLOR_NORMAL="light-blue/black"
- GRUB_COLOR_HIGHLIGHT="light-cyan/blue"
Then applied with:
```bat
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

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

## Omen lights
```bat
sudo xbps-install hidapi-devel
git clone https://github.com/chiahsing/omen-light
g++ -o omen_light omen_light.cc -lhidapi-libusb
```
I created a script [lux.bash](scripts/lux.bash)
added run permissions and made it autorun:
```bat
chmod +x lux.bash
echo "/home/trogoz/scripts/lux.bash" >> /etc/rc.local
```

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


