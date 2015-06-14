#!/bin/bash


debdir=/media/$USER/rootfs/home/debian
cd $debdir

mkdir devtools
mkdir projects

devtools=$debdir/devtools
projects=$debdir/projects

echo $devtools
echo $projects

echo "$(tput setaf 6)== creating scripts inside ~/devtools $(tput sgr0)"

echo "#!/bin/bash" >> $devtools/resizesd.sh
echo "echo '$(tput bold)$(tput setaf 6)'" >> $devtools/resizesd.sh
echo "echo 'On beagle bone ... perform the following to remove and add partition 2 and resize after reboot'" >> $devtools/resizesd.sh
echo "echo 'sudo su'" >> $devtools/resizesd.sh
echo "echo 'fdisk /dev/mmcblk0'" >> $devtools/resizesd.sh
echo "echo 'Delete partition : d'" >> $devtools/resizesd.sh
echo "echo 'Delete partition 2 : 2'" >> $devtools/resizesd.sh
echo "echo 'New partition : n'" >> $devtools/resizesd.sh
echo "echo 'Type primary : p'" >> $devtools/resizesd.sh
echo "echo 'Partition number 2 : 2'" >> $devtools/resizesd.sh
echo "echo 'Enter .. Enter (defaults for begin and end)'" >> $devtools/resizesd.sh
echo "echo 'Write to disk : w'" >> $devtools/resizesd.sh
echo "echo 'reboot'" >> $devtools/resizesd.sh
echo "echo 'sudo su (after reboot is complete)'" >> $devtools/resizesd.sh
echo "echo 'resize2fs /dev/mmcblk0p2'" >> $devtools/resizesd.sh
echo "echo '$(tput sgr0)'" >> $devtools/resizesd.sh

echo "#!/bin/bash" >> $devtools/internet.sh
echo "sudo route add default gw 192.168.7.1" >> $devtools/internet.sh
echo "echo '$(tput setaf 6)'" >> $devtools/internet.sh
echo "echo '== In case ping doesnt succees .. try =='" >> $devtools/internet.sh
echo "echo '== In beaglebone'" >> $devtools/internet.sh
echo "echo 'sudo su'" >> $devtools/internet.sh
echo "echo 'ifconfig usb0 192.168.7.2'" >> $devtools/internet.sh
echo "echo 'echo 'nameserver 8.8.8.8' >> /etc/resolv.conf'" >> $devtools/internet.sh
echo "echo 'Try to ping again ..'" >> $devtools/internet.sh
echo "echo '== In host machine'" >> $devtools/internet.sh
echo "echo 'If eth1 is the beaglebone usb connection'" >> $devtools/internet.sh
echo "echo 'sudo su'" >> $devtools/internet.sh
echo "echo 'ifconfig eth1 192.168.7.1'" >> $devtools/internet.sh
echo "echo 'iptables --table nat --append POSTROUTING --out-interface wlan0 -j MASQUERADE'" >> $devtools/internet.sh
echo "echo 'iptables --append FORWARD --in-interface eth5 -j ACCEPT'" >> $devtools/internet.sh
echo "echo 'echo 1 > /proc/sys/net/ipv4/ip_forwardc'" >> $devtools/internet.sh
echo "echo '$(tput sgr0)'" >> $devtools/internet.sh


echo "#!/bin/bash" >> $devtools/date.sh
echo "sudo ntpdate pool.ntp.org" >> $devtools/date.sh

echo "#!/bin/bash" >> $devtools/installvnc.sh
echo "sudo apt-get update -y" >> $devtools/installvnc.sh
echo "sudo apt-get upgrade -y" >> $devtools/installvnc.sh
echo "sudo apt-get install x11vnc" >> $devtools/installvnc.sh
echo "echo '$(tput setaf 6)'" >> $devtools/installvnc.sh
echo "echo '== To be run in host machine'" >> $devtools/installvnc.sh
echo "echo 'sudo apt-get install xtightvncviewer'" > $devtools/installvnc.sh
echo "echo '$(tput sgr0)'" >> $devtools/insatllvnc.sh

echo "#!/bin/bash" >> $devtools/installcheese.sh
echo "sudo apt-get install cheese" >> $devtools/installcheese.sh


echo "#!/bin/bash" >> $devtools/startvnc.sh
echo "x11vnc -bg -o %HOME/.x11vnc.log.%VNCDISPLAY -auth /var/run/lightdm/root/:0 -forever" >> $devtools/startvnc.sh

echo "#!/bin/bash" >> $devtools/stopvnc.sh
echo "x11vnc -bg -o %HOME/.x11vnc.log.%VNCDISPLAY -auth /var/run/lightdm/root/:0 -forever" >> $devtools/stopvnc.sh

echo "#!/bin/bash" >> $devtools/opencvprereq.sh
echo "sudo apt-get update" >> $devtools/opencvprereq.sh
echo "sudo apt-get upgrade" >> $devtools/opencvprereq.sh
echo "sudo apt-get install build-essential cmake pkg-config" >> $devtools/opencvprereq.sh
echo "sudo apt-get install libtiff4-dev libjpeg-dev libjasper-dev libpng12-dev" >> $devtools/opencvprereq.sh
echo "sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev v4l-utils" >> $devtools/opencvprereq.sh
echo "sudo apt-get install libgstreamer0.10-0-dbg libgstreamer0.10-0 libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libxine1-ffmpeg libxine-dev libxine1-bin libunicap2 libunicap2-dev libdc1394-22-dev libdc1394-22 libdc1394-utils libv4l-0 libv4l-dev" >> $devtools/opencvprereq.sh

echo "#!/bin/bash" >> $devtools/opencvbuild.sh
echo "cd ~/projects/opencv" >> $devtools/opencvbuild.sh
echo "mkdir build && cd build" >> $devtools/opencvbuild.sh
echo "cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_CUDA=OFF -D WITH_CUFFT=OFF -D WITH_CUBLAS=OFF -D WITH_NVCUVID=OFF -D WITH_OPENCL=OFF -D WITH_OPENCLAMDFFT=OFF -D WITH_OPENCLAMDBLAS=OFF -D BUILD_opencv_apps=OFF -D BUILD_DOCS=OFF -D BUILD_PERF_TESTS=OFF -D BUILD_TESTS=OFF -D ENABLE_NEON=on .." >> $devtools/opencvbuild.sh
echo "make" >> $devtools/opencvbuild.sh
echo "#sudo make install" >> $devtools/opencvbuild.sh
echo "#sudo ldconfig" >> $devtools/opencvbuild.sh


echo "$(tput setaf 6)== copying opencv files $(tput sgr0)"
cp -r ~/projects/beaglelab/debiansetup/build/opencv $projects
cp -r ~/projects/beaglelab/debiansetup/build/test $projects

