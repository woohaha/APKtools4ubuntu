#!/bin/bash
#$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS 變量：選中的文件，多選時以\n分隔
[ ! -e $HOME/.bin/aapt ] && {
zenity --error --text="核心解析有文件aapt不存在，請下載";
exit
}
flag=`$HOME/.bin/aapt d badging $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS|head -n1|cut -c1-5`
[ -z $flag ] && {
zenity --error --text="不是有效的APK包";
exit
}
pgname=`$HOME/.bin/aapt d badging $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS |grep package|awk '{print $2}'|sed "s/'//g"|cut -c6-`
vername=`$HOME/.bin/aapt d badging $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS |grep package|awk '{print $4}'|sed "s/'//g"|cut -c13-`
mv $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS ${pgname}_${vername}.apk
