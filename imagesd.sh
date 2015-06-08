#!/bin/bash

lsblk
cd ~/projects/beaglelab/build
echo "$(tput bold)$(tput setaf 6)"
echo "== commands to run"
echo "unxz bone-debian-7.8-lxde-4gb-armhf-2015-03-01-4gb.img.xz -v"
echo "Replace sdX with the SD card identified in the output from lsblk in the following statement eg: sdb"
echo "sudo dd if=./bone-debian-7.8-lxde-4gb-armhf-2015-03-01-4gb.img of=/dev/sdX"
echo "To review progress of dd type the following in a new terminal"
echo "$(tput sgr0)"

