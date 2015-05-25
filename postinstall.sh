#!/bin/bash

#cd ~/Downloads
#lsblk
#wget https://rcn-ee.com/rootfs/bb.org/release/2015-03-01/lxde-4gb/bone-debian-7.8-lxde-4gb-armhf-2015-03-01-4gb.img.xz
#md5sum: c848627722b7a5f7bc89791cc8949e3b

#wget https://rcn-ee.com/rootfs/bb.org/testing/2015-05-17/lxqt-4gb/bone-debian-8.0-lxqt-4gb-armhf-2015-05-17-4gb.img.xz

#Verify Image with:

#md5sum bone-debian-8.0-console-armhf-2015-05-08-2gb.img.xz
#7cbb8e62761baea58b42c4f601cef97c  bone-debian-8.0-console-armhf-2015-05-08-2gb.img.xz

#unxz bone-debian-8.0-console-armhf-2015-05-08-2gb.img.xz
#sudo dd if=./bone-debian-8.0-console-armhf-2015-05-08-2gb.img of=/dev/sdX

debdir=/media/$USER/rootfs/home/debian
cd $debdir

mkdir devtools
mkdir projects

devtools=$debdir/devtools
projects=$debdir/projects

echo $devtools
echo $projects

echo "== copying opencv files"
cp -r ~/projects/beaglelab/build/opencv $projects
cp -r ~/projects/beaglelab/build/test $projects

echo "== creating scripts inside ~/devtools"

echo "#!/bin/bash" >> $devtools/route.sh
echo "sudo route add default gw 192.168.7.1" >> $devtools/route.sh

echo "#!/bin/bash" >> $devtools/date.sh
echo "sudo ntpdate pool.ntp.org" >> $devtools/date.sh

echo "#!/bin/bash" >> $devtools/installvnc.sh
echo "sudo apt-get update -y" >> $devtools/installvnc.sh
echo "sudo apt-get upgrade -y" >> $devtools/installvnc.sh
echo "sudo apt-get install x11vnc" >> $devtools/installvnc.sh


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


