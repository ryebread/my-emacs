#!/bin/bash

# Time-stamp: <2010-08-27 16:19:38 Friday by ryebread>

bin=`dirname "$0"`
bin=`cd "$bin"; pwd`

sed -n "1,32p" "${bin}/.emacs" > "${bin}/.emacs.changed"
echo "(defconst my-emacs-path \"${bin}/\" \"我的emacs相关配置文件的路径\")" >> "${bin}/.emacs.changed"
sed -n "34,$ p" "${bin}/.emacs" >> "${bin}/.emacs.changed"

dateTime=`date '+%F_%T'`

dotEmacs=~/.emacs
if [[ -f "$dotEmacs" && ! -L "$dotEmacs" ]]; then
    mv "$dotEmacs" "$dotEmacs.$dateTime"
fi

#windows平台中不支持cygwin的链接
SYSTEM=`uname -o`
WHO=`whoami`
if [ ${SYSTEM} = "Cygwin" ]; then
    cp -f "${bin}"/.emacs.changed ~/.emacs
    cp -f "${bin}"/windows/.emacs-load "C:/Documents and Settings/"$WHO"/Application Data/.emacs"
else
    ln -sf "${bin}"/.emacs.changed ~/.emacs
fi