#!/bin/bash
#wget http://192.168.211.12/apkgtk.tar.gz -o /tmp/apkgtk.tar.gz
#tar xzf /tmp/apkgtk.tar
wget http://192.168.211.12/aapt -O /tmp/aapt
wget http://192.168.211.12/apkgtk.sh -O /tmp/apkgtk.sh
[ ! -d $HOME/.gnome2/nautilus-scripts ] && mkdir -p $HOME/.gnome2/nautilus-scripts
cp /tmp/apkgtk.sh $HOME/.gnome2/nautilus-scripts/查看APK信息
[ ! -x $HOME/.gnome2/nautilus-scripts/查看APK信息 ] && chmod +x $HOME/.gnome2/nautilus-scripts/查看APK信息
[ ! -d $HOME/.bin ] && mkdir -p $HOME/.bin
cp /tmp/aapt $HOME/.bin/
[ ! -x $HOME/.bin/aapt ] && chmod +x $HOME/.bin/aapt
echo '安装完成!'
