# Tx11nVNC
Dual connection screen to display via Termux x11 on VNC ✧⁠◝⁠(⁠⁰⁠▿⁠⁰⁠)⁠◜⁠✧
![Archana Berry](archanaberry/banner.png)

# Setup

## Install package for termux x11 and vnc service's
 
```
pkg update && pkg upgrade
pkg install proot pulseaudio termux-x11 x11-repo
pkg install xorg-xrandr xfce4
pkg install xorg-x11-server-Xvfb x11vnc
```

## Don't forget to install dbus
* For Arch Linux
```
sudo pacman -S dbus
``` 

* For Debian distro such as Ubuntu, Linux Mint, or etc...
```
sudo apt install dbus
```

## These are ideal for remote access via SSH, and i use PuTTY.
![My screenshot](archanaberry/screenshot0.png)

## This my tablet portait mode (1200x2000)
![My screenshot](archanaberry/screenshot1.png)

## This my tablet landscape mode (2000x1200)
![My screenshot](archanaberry/screenshot3.png)