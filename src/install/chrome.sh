#!/usr/bin/env bash 
### every exit != 0 fails the script 
set -e 

echo "Install Chrome Browser" 

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt-get install -y -f ./google-chrome-stable_current_amd64.deb \
    && rm -f google-chrome-stable_current_amd64.deb 


