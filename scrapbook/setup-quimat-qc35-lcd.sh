#!/bin/sh


check_privilage()
{
    if [ "`whoami`" != "root" ]; then
        echo "Require root privilege"
        exit 1
    fi
}

append_hdmi_config()
{
    cat <<EOF >> /boot/config.txt

# hdmi config for QC35 lcd
config_hdmi_boost=7
hdmi_drive=2
hdmi_force_hotplug=1
hdmi_group=2
hdmi_mode=87
hdmi_cvt 480 320 60 6 0 0 0
dtoverlay=ads7846,cs=1,penirq=25,penirq_pull=2,speed=50000,keep_vref_on=0,swapxy=0,pmax=255,xohms=150,xmin=200,xmax=3900,ymin=200,ymax=3900
EOF
}

install_xserver()
{
    apt-get install -y --no-install-recommends xserver-xorg
    apt-get install -y xserver-xorg-video-fbturbo xserver-xorg-input-evdev
}

add_calibration_config()
{
    cat <<EOF > /usr/share/X11/xorg.conf.d/99-calibration.conf
Section "InputClass"
        Identifier      "calibration"
        MatchProduct    "ADS7846 Touchscreen"
        Option  "Calibration"   "3945 233 3939 183"
        Option  "SwapAxes"      "1"
EndSection
EOF
}

add_fbcon_for_cmdline()
{
    sed -z -i 's/\n/ fbcon=map:10 fbcon=font:ProFont6x11\n/g' /boot/cmdline.txt
}

add_fbturbo_config()
{
    cat <<EOF >> /usr/share/X11/xorg.conf.d/99-fbturbo.conf
Section "Device"
        Identifier      "Allwinner A10/A13/A20 FBDEV"
        Driver          "fbturbo"
        Option          "fbdev" "/dev/fb0"
        Option          "SwapbuffersWait" "true"
EndSection
EOF
}

setup_input_evdev()
{
    cp -rf /usr/share/X11/xorg.conf.d/10-evdev.conf /usr/share/X11/xorg.conf.d/45-evdev.conf
}


check_privilage
append_hdmi_config
install_xserver
add_calibration_config
setup_input_evdev
add_fbcon_for_cmdline
add_fbturbo_config
reboot
