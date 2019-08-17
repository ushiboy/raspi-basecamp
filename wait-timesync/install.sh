#!/bin/sh

if [ "`whoami`" != "root" ]; then
    echo "Require root privilege"
    exit 1
fi

cp wait-timesync /usr/local/bin
cp wait-timesync.default /etc/default/wait-timesync
cp wait-timesync.service /etc/systemd/system

if [ -e /var/lib/systemd/timesync/clock ]; then
    sed -i "s/WAIT_CLOCK_TARGET=\/var\/lib\/systemd\/clock/WAIT_CLOCK_TARGET=\/var\/lib\/systemd\/timesync\/clock/g" /etc/default/wait-timesync
fi
