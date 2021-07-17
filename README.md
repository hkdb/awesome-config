# My Awesome WM Config
maintianed by: @hkdb

![screenshot](awesome-config-ss.png)

## SUMMARY

Starter configurations for Awesome WM customized to my liking for Arch(-based) Linux.

## DEFAULTS

- Terminal: Tilix
- Browser: Brave
- Editor: vim w/ customization
- Screenshot: Shutter
- Layout: Fair
- Powerline: Weather, Date, Time
- Widgets: Battery, Volume, CPU, RAM
- Network: Network Manager Applet, Blueman
- Input: ibus-damon, ibus-rime (pinyin) 
- Auto Start: AeroFS, OverGrive, Nextcloud
- Wallpaper: *nixtr
- Shortcut: Media keys for volume control
- Compositor: Compton
- Screensaver: xscreensaver, caffeine-indicator
- Screen Lock: xsecurelock

v2:

- Removed battery widget
- Added more powerline segments to replace battery widget and option to remove cpu and ram widgets/applets
- Removed auto-launch of apps that are specific to hkdb (Nextcloud, etc)

## INSTALL

1. `git clone https://github.com/hkdb/awesome-config.git`
2. `cd awesome-config`
3. `./install.sh`
4. Logout and login to awesome

## External Monitors

Create the following aliases:

After connecting my external monitor~

```
alias extmon 'xrandr --output DP2 --auto && xrandr --output DP2 --rotate left && xrandr --output eDP1 --off'
```

Before disconnecting from my external monitor~

```
alias intmon 'xrandr --output eDP1 --auto && xrandr --output DP2 --off'
```

## CHANGE LOG
- 07162021 - Fixed install script
- 07162021 - v2: using more powerline and less widgets + plank
- 07142021 - Added caffeine-indicator
- 07132021 - Updated external monitor tip
- 07132021 - Updated DEFAULTS in README
- 07132021 - Added installation of ibus-rime
- 07132021 - Added more customization & refined install
- 04172021 - Initial commit

## SUPPORT US!

If this repo was useful to you, feel free to buy us some coffees! :)

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/yellow_img.png)](https://www.buymeacoffee.com/3dfosi)

## DISCLAIMER

This repo is maintained by volunteers and in no way do the maintainers make any guarantees. Please use at your own risk!

To Learn more, please visit:

https://osi.3df.io

https://3df.io

