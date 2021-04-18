#!/bin/bash

# Install base dependencies
sudo pacman -S vim awesome nitrogen nautilus tilix picom dmenu lxappearance xorg-xinput network-manager-applet yay

# Install browser
yay -S brave flameshot

# Install awesome config
mkdir -p ~/.config/awesome
cp rc.lua ~/.config/awesome

# Install wallpaper
mkdir -p ~/Pictures
cp nixtr-wallpaper.png ~/Pictures/
