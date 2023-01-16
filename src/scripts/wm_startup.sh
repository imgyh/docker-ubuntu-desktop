#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo -e "\n------------------ startup of Xfce4 window manager ------------------"

if [[ -f $HOME/.vnc/xstartup ]]; then
    echo -e "\n---------  purging existing VNC xstartup settings  ---------"
    rm -f $HOME/.vnc/xstartup
fi

echo "#!/bin/sh" > $HOME/.vnc/xstartup
echo "unset SESSION_MANAGER" >> $HOME/.vnc/xstartup
echo "unset DBUS_SESSION_BUS_ADDRESS" >> $HOME/.vnc/xstartup
echo "### disable screensaver and power management" >> $HOME/.vnc/xstartup
echo "xset -dpms &" >> $HOME/.vnc/xstartup
echo "xset s noblank &" >> $HOME/.vnc/xstartup
echo "xset s off &" >> $HOME/.vnc/xstartup
echo "### exec startxfce4" >> $HOME/.vnc/xstartup
echo "exec startxfce4" >> $HOME/.vnc/xstartup
chmod u+x $HOME/.vnc/xstartup