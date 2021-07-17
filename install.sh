#!/bin/bash

# Setting Text Bolding Variables
bold=$(tput bold)
normal=$(tput sgr0)

echo ""

# Check to make sure it's Linux
if [[ "$OSTYPE" != "linux-gnu" ]]; then
   echo -e "\nThis is not a supported operating system... exiting...\n"
   exit
fi

if [ -n "$(command -v lsb_release)" ]; then
      distro=$(lsb_release -s -d)
elif [ -f "/etc/os-release" ]; then
      distro=$(grep PRETTY_NAME /etc/os-release | sed 's/PRETTY_NAME=//g' | tr -d '="')
elif [ -f "/etc/debian_version" ]; then
      distro="Debian $(cat /etc/debian_version)"
elif [ -f "/etc/redhat-release" ]; then
      distro=$(cat /etc/redhat-release)
else
      distro="$(uname -s) $(uname -r)"
fi
echo "${bold}OS:${normal} Linux"
echo ""
echo "${bold}Distro:${normal} ${distro}"

# Check to make sure it's a supported distro
if [[ $distro == "Pop!_OS"* ]] || [[ $distro == "Ubuntu"* ]] || [[ $distro == "Debian"* ]] || [[ $distro == "Arch"* ]]; then
      echo -e "\nYour distro is supported... continuing...\n"
else
      echo -e "\nYour distro is not suported... exiting...\n"
      exit
fi

# Install base dependencies
if [[ distro == "Arch" ]]; then
   sudo pacman --needed -S gvim git powerline nautilus-typeahead awesome-terminal-fonts powerline-fonts powerline-vim awesome nitrogen picom compton dmenu lxappearance xorg-xinput network-manager-applet yay shutter arc-icon-theme acpi ibus-rime alsa-utils pavucontrol blueman xscreensaver xsecurelock brave caffeine plank python3-xdg plank
else
   sudo apt install apt-transport-https curl
   sudo add-apt-repository ppa:linuxuprising/shutter
   sudo apt update -y
   sudo apt install vim-gtk git powerline nautilus fonts-powerline awesome nitrogen picom compton dmenu lxappearance xinput budgie-network-manager-applet shutter acpi ibus-rime alsa-utils pavucontrol blueman xscreensaver xsecurelock caffeine fonts-font-awesome python3-xdg plank -y

   if [[ ! -f "/usr/bin/brave-browser" ]]; then
      sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
      echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
      sudo apt update -y
      sudo apt install brave-browser -y
   fi
fi

# Install additional Python libraries
pip install powerline-mem-segment

# Configure powerline
cp -R powerline /home/$USER/.config/

# Configure plank
cp -R plank /home/$USER/.config/

# Install awesome config
echo -e "\nInstalling Awesome config...\n"
mkdir -p ~/.config/awesome
cp rc.lua ~/.config/awesome

# Install awesome wm widgets
echo -e "\nInstalling Awesome widgets...\n"
mkdir -p /home/$USER/.config
git -C /home/$USER/.config clone https://github.com/streetturtle/awesome-wm-widgets.git

read -p "Should I configure vim for you? (Y/n): " CVI
if [[ $CVI = "" ]] || [[ $CVI = "Y" ]] || [[ $CVI = "y" ]]; then
   if [[ -f /home/$USER/.vimrc ]]; then
      cp /home/$USER/.vimrc /home/$USER/.vimrc.bak
   fi
   cp .vimrc /home/$HOME/
elif [[ $CVI = "N" ]] || [[ $CVI = "n" ]]; then
   echo -e "\nNot going to configure vim... skipping...\n"
else
   echo -e "\nInvalid input... Not going to configure vim... skipping...\n"
fi

# Install wallpaper
echo -e "\nInstalling wallpaper...\n"
mkdir -p ~/Pictures
cp nixtr-wallpaper.png /home/$USER/Pictures/

cp -R nitrogen /home/$USER/.config/
