#!/bin/bash


# Prompt - download opencv 
echo "$(tput bold)$(tput setaf 6)------------------------------------------"
read -p "download opencv source : " opencv
echo "------------------------------------------ $(tput sgr0)"
if [[ "$opencv" == [Yy]* ]]
then
	echo "== downloading open cv source"
	mkdir ~/projects/beaglelab/debiansetup/build
	cd ~/projects/beaglelab/debiansetup/build
	git clone https://github.com/Itseez/opencv.git
fi


# Prompt - download debian 7.8 
echo "$(tput bold)$(tput setaf 6)------------------------------------------"
read -p "download debian 7.8 (y/n) : " d78
echo "------------------------------------------ $(tput sgr0)"
if [[ "$d78" == [Yy]* ]]
then
	echo "== downloading bone-debian-7.8"
	mkdir ~/projects/beaglelab/debiansetup/build
	cd ~/projects/beaglelab/debiansetup/build
	wget https://rcn-ee.com/rootfs/bb.org/release/2015-03-01/lxde-4gb/bone-debian-7.8-lxde-4gb-armhf-2015-03-01-4gb.img.xz
	md5sum bone-debian-7.8-lxde-4gb-armhf-2015-03-01-4gb.img.xz
	echo "md5sum must be : c848627722b7a5f7bc89791cc8949e3b"
fi

# Prompt - download debian 8.0 
echo "$(tput bold)$(tput setaf 6)------------------------------------------"
read -p "download debian 8.0 (y/n) : " d80
echo "------------------------------------------ $(tput sgr0)"
if [[ "$d80" == [Yy]* ]]
then
	echo "== downloading bone-debian-8.0"
	mkdir ~/projects/beaglelab/debiansetup/build
	cd ~/projects/beaglelab/debiansetup/build
	wget https://rcn-ee.com/rootfs/bb.org/testing/2015-05-17/lxqt-4gb/bone-debian-8.0-lxqt-4gb-armhf-2015-05-17-4gb.img.xz
	md5sum bone-debian-8.0-lxqt-4gb-armhf-2015-05-17-4gb.img.xz
	echo "md5sum must be : daf3660fd4b6776838fa3eb86f2d0a65"
fi

# Prompt - disk image to micro sd
#echo "$(tput bold)$(tput setaf 6)------------------------------------------"
#read -p "disk image to micro sd (y/n) : " image78
#echo "------------------------------------------ $(tput sgr0)"
#if [[ "$image78" == [Yy]* ]]
#then
	#echo "== copying image to micro sd"
	#cd ~/projects/beaglelab/debiansetup/build
	#lsblk
	#read -p "sdX disk name : " sdx
	#sudo dd if=./bone-debian-8.0-console-armhf-2015-05-08-2gb.img of=/dev/$sdx
	#echo $sdx
#fi


