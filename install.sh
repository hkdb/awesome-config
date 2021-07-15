#!/bin/bash

# Install base dependencies
sudo pacman --needed -S gvim git powerline nautilus-typeahead awesome-terminal-fonts powerline-fonts powerline-vim awesome nitrogen picom compton dmenu lxappearance xorg-xinput network-manager-applet yay shutter arc-icon-theme acpi ibus-rime alsa-utils pavucontrol blueman xscreensaver xsecurelock brave ibus-rime caffeine

# Install awesome config
mkdir -p ~/.config/awesome
cp rc.lua ~/.config/awesome

# Install awesome wm widgets
mkdir -p /home/$USER/.config
git -C /home/$USER/.config clone https://github.com/streetturtle/awesome-wm-widgets.git

if [[ -f /home/$USER/.vimrc ]]
   cp /home/$USER/.vimrc /home/$USER/.vimrc.bak
fi
cp .vimrc /home/$HOME/

# Install wallpaper
mkdir -p ~/Pictures
cp nixtr-wallpaper.png /home/$USER/Pictures/

cp -R nitrogen /home/$USER/.config/
