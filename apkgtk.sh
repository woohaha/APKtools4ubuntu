#!/bin/bash
[ ! -e $HOME/.bin/aapt ] && {
zenity --error --text="核心解析有文件aapt不存在，請下載";
exit
}
CONTENT=`$HOME/.bin/aapt d badging $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS|grep package|sed 's/^.*: //'|sed 's/\ /\n/g'|sed 's/=/:\ /g'|sed "s/'//g"`
md5=`md5sum $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS|awk '{print $1}'`
CONTENT=$CONTENT"\nmd5: "$md5
zenity --info --text="$CONTENT"
