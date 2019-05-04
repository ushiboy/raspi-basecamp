#!/bin/sh

is_enable_readonlyfs()
{
    grep "\<readonlyfs\>" /proc/cmdline > /dev/null 2>&1 && return 0
    return 1
}

if [ "`whoami`" != "root" ]; then
    echo "Require root privilege"
    exit 1
fi

if is_enable_readonlyfs; then
    echo "Require disable readolyfs"
    exit 1
fi

apt-get update
apt-get install -y parted
cp -a etc/init.d /etc
update-rc.d expand-extrafs defaults
