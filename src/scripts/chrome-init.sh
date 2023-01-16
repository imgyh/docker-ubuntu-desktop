#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

sed -e '/chrome/ s/^#*/#/' -i /opt/google/chrome/google-chrome && \
echo 'exec -a "$0" "$HERE/chrome" "$@" --user-data-dir="$HOME/.config/chrome" --no-sandbox --disable-dev-shm-usage' >> /opt/google/chrome/google-chrome
