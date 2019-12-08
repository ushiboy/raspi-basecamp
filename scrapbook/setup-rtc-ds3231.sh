#!/bin/sh

check_privilage()
{
    if [ "`whoami`" != "root" ]; then
        echo "Require root privilege"
        exit 1
    fi
}

remove_fake_hwclock()
{
    systemctl disable fake-hwclock
    apt-get -y remove fake-hwclock
}

enable_hwclock_set()
{
    cat <<EOF > /tmp/hwclock-set.patch
--- a/lib/udev/hwclock-set
+++ b/lib/udev/hwclock-set
@@ -4,9 +4,9 @@

 dev=$1

-if [ -e /run/systemd/system ] ; then
-    exit 0
-fi
+#if [ -e /run/systemd/system ] ; then
+#    exit 0
+#fi

 if [ -e /run/udev/hwclock-set ]; then
     exit 0
EOF

    patch -p1 -d / < /tmp/hwclock-set.patch
    rm /tmp/hwclock-set.patch
}

add_dtoverlay()
{
    echo "dtoverlay=i2c-rtc,ds3231" >> /boot/config.txt
}

check_privilage

remove_fake_hwclock

enable_hwclock_set

add_dtoverlay
