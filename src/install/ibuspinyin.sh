#!/usr/bin/env bash
set -e

echo "Install ibus-pinyin"
apt-get install -y ibus-pinyin
apt-get clean -y
