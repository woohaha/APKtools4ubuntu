#!/bin/bash
[ ! -e $HOME/.bin/aapt ] && {
zenity --error --text="核心解析有文件aapt不存在，請下載";
exit
}
CONTENT=`$HOME/.bin/aapt d badging $1|grep package|sed 's/^.*: //'|sed 's/\ /\n/g'|sed 's/=/:\ /g'|sed "s/'//g"`
md5=`md5sum $1|awk '{print $1}'`
CONTENT=$CONTENT"\nmd5: "$md5
zenity --info --text="$CONTENT"
