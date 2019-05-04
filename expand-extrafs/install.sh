#!/bin/sh

if [ "`whoami`" != "root" ]; then
    echo "Require root privilege"
    exit 1
fi

apt-get update
apt-get install -y parted
cp -a etc/init.d /etc
update-rc.d expand_extrafs defaults
