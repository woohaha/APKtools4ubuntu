#!/bin/bash
Resolution='480x800'
SavePath="$HOME"
Pixfmt='rgb32'
# rgba rbg32
runninguser=`ps aux|grep adb|grep -v grep|awk '{print $1}'`
Name=`date +%Y_%m_%d_%T`
[ -z $runninguser ] && {
zenity --error --text='adb沒有運行'
exit
}
devExc=`adb devices|tail -n +2`
[ -z $devExc ] && {
zenity --error --text='找不到設備'
exit
}

[ $runninguser = 'root' ] && {
adb pull /dev/graphics/fb0 /tmp/fb0
dd bs=1920 count=800 if=/tmp/fb0 of=/tmp/fb0b
ffmpeg -vframes 1 -vcodec rawvideo -f rawvideo -pix_fmt $Pixfmt -s $Resolution -i /tmp/fb0b -f image2 -vcodec png $SavePath/$Name.png
}
#function snpsht_ics{
#adb shell "/system/bin/screencap -p /sdcard/screenshot.png"
#adb pull /sdcard/screenshot.png $Name.png
#}


