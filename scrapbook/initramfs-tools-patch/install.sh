#!/bin/sh

if [ "`whoami`" != "root" ]; then
    echo "Require root privilege"
    exit 1
fi

cd `dirname $0`

VERSION=`dpkg -l | grep -e "initramfs-tools\s" | awk '{print $3}'`

PATCH_FILE="initramfs-tools-v$VERSION.patch"

if [ -e $PATCH_FILE ]; then
    sed -i "s/#INITRD=Yes/INITRD=Yes/g" /etc/default/raspberrypi-kernel
    sudo patch -p1 -d / < $PATCH_FILE
    exit 0
else
    echo "Unsupported version [$VERSION]"
    exit 1
fi
