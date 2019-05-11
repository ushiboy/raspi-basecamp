#!/bin/bash

check_privilage()
{
    if [ "`whoami`" != "root" ]; then
        echo "Require root privilege"
        exit 1
    fi
}

upgrade_packages()
{
    apt-get update
    apt-get upgrade -y
}

install_requirement_packages()
{
    apt-get install -y rng-tools
}

setup_locale_en_us_and_ja_jp()
{
    sed -i "s/en_GB.UTF-8 UTF-8/# en_GB.UTF-8 UTF-8/" /etc/locale.gen
    sed -i "s/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/" /etc/locale.gen
    sed -i "s/# ja_JP.UTF-8 UTF-8/ja_JP.UTF-8 UTF-8/" /etc/locale.gen
    sed -i "s/^\s*LANG=\S*/LANG=en_US.UTF-8/" /etc/default/locale
    dpkg-reconfigure -f noninteractive locales
}

setup_timezone_asia_tokyo()
{
    rm /etc/localtime
    echo "Asia/Tokyo" > /etc/timezone
    dpkg-reconfigure -f noninteractive tzdata
}

setup_keyboard_jp()
{
    sed -i "s/XKBLAYOUT=\"gb\"/XKBLAYOUT=\"jp\"/" /etc/default/keyboard
    dpkg-reconfigure -f noninteractive keyboard-configuration
}

setup_wifi_country()
{
    wpa_cli set country "JP" > /dev/null 2>&1
    if [ "$?" = 0 ]; then
        wpa_cli save_config
    fi
}

check_privilage

upgrade_packages
install_requirement_packages

setup_locale_en_us_and_ja_jp
setup_timezone_asia_tokyo
setup_keyboard_jp
setup_wifi_country
