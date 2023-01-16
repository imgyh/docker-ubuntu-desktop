# This Dockerfile is used to build an vnc image based on Ubuntu

FROM ubuntu:20.04

LABEL maintainer="imgyh<admin@imgyh.com>"

# change apt sources
#RUN sed -i s/archive.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list \
# 	&& sed -i s/security.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list

## Connection ports for controlling the UI:
# VNC port:5901
# noVNC webport, connect via http://IP:6901/?password=vncpassword
ENV DISPLAY=:1 \
    VNC_PORT=5901 \
    NO_VNC_PORT=6901
EXPOSE $VNC_PORT $NO_VNC_PORT

### Envrionment config
ENV HOME=/root \
    TERM=xterm \
    STARTUPDIR=/root/docker-ubuntu-desktop/src/scripts \
    INST_SCRIPTS=/root/docker-ubuntu-desktop/src/install \
    NO_VNC_HOME=/opt/noVNC \
    DEBIAN_FRONTEND=noninteractive \
    VNC_COL_DEPTH=24 \
    VNC_RESOLUTION=1280x1024 \
    VNC_PW=vncpassword \
    VNC_VIEW_ONLY=false
WORKDIR $HOME

### Add all install scripts for further steps
ADD ./src/install/ $INST_SCRIPTS/
ADD ./src/scripts/ $STARTUPDIR/


### Install some common tools
RUN $INST_SCRIPTS/tools.sh
ENV LANG='en_US.UTF-8' LANGUAGE='en_US.UTF-8' LC_ALL='en_US.UTF-8'

### Install custom fonts
RUN $INST_SCRIPTS/install_custom_fonts.sh

### Install xvnc-server & noVNC - HTML5 based VNC viewer
RUN $INST_SCRIPTS/tigervnc.sh
RUN $INST_SCRIPTS/no_vnc.sh

### Install xfce UI
RUN $INST_SCRIPTS/xfce_ui.sh

### Install chrome browser
RUN $INST_SCRIPTS/chrome.sh

### Install ibus-pinyin
RUN $INST_SCRIPTS/ibuspinyin.sh

ENTRYPOINT ["/root/docker-ubuntu-desktop/src/scripts/vnc_startup.sh"]
CMD ["--wait"]
