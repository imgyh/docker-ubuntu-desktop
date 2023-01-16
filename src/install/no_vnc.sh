#!/usr/bin/env bash
### every exit != 0 fails the script
set -e
set -u

echo "Install noVNC - HTML5 based VNC viewer"
mkdir -p $NO_VNC_HOME/utils/websockify
wget https://github.com/novnc/noVNC/archive/refs/tags/v1.3.0.tar.gz && tar -zxvf v1.3.0.tar.gz -C $NO_VNC_HOME --strip-components=1
rm -f v1.3.0.tar.gz
# use older version of websockify to prevent hanging connections on offline containers
wget https://github.com/novnc/websockify/archive/refs/tags/v0.10.0.tar.gz && tar -zxvf v0.10.0.tar.gz -C $NO_VNC_HOME/utils/websockify --strip-components=1 
rm -f v0.10.0.tar.gz
#chmod +x -v $NO_VNC_HOME/utils/*.sh
## create index.html to forward automatically to `vnc.html`
ln -s $NO_VNC_HOME/vnc.html $NO_VNC_HOME/index.html
