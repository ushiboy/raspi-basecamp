#!/bin/bash

if [ "`whoami`" != "root" ]; then
    echo "Require root privilege"
    exit 1
fi

sudo cp restart-network /usr/local/sbin
sudo chmod +x /usr/local/sbin/restart-network
