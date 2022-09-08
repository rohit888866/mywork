#!/bin/bash
 
pip uninstall opencv-python
pip uninstall opencv-contrib-python
sudo apt-get purge 'opencv'
sudo apt purge libopencv-dev libopencv-python libopencv-samples libopencv*
sudo apt install build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev \
python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev python3-pip python3-numpy
sudo apt install gstreamer1.0*
sudo apt install ubuntu-restricted-extras
sudo apt install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
git clone https://github.com/ridgerun/opencv.git --depth 1
VERSION=4.4.0
git clone https://github.com/opencv/opencv.git -b $VERSION --depth 1
git clone https://github.com/RidgeRun/opencv_contrib.git --depth 1
VERSION=4.4.0
git clone https://github.com/opencv/opencv_contrib.git -b $VERSION --depth 1
cd opencv
mkdir build
cd build

sudo cmake -D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D OPENCV_GENERATE_PKGCONFIG=ON \
-D BUILD_EXAMPLES=OFF \
-D INSTALL_PYTHON_EXAMPLES=OFF \
-D INSTALL_C_EXAMPLES=OFF \
-D PYTHON_EXECUTABLE=$(which python2) \
-D BUILD_opencv_python2=OFF \
-D PYTHON3_EXECUTABLE=$(which python3) \
-D PYTHON3_INCLUDE_DIR=$(python3 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
-D PYTHON3_PACKAGES_PATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
-D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules/ \
-D WITH_GSTREAMER=ON \
..

make -j8

sudo make install
sudo ldconfig

wget https://github.com/rohit888866/mywork/raw/main/myfaces.tar.xz
tar -xvf myfaces.tar.xz
apt-get install wget -y

wget https://raw.githubusercontent.com/rohit888866/mywork/main/test.py
wget https://raw.githubusercontent.com/rohit888866/mywork/main/haarcascade_frontalface_default.xml
python3 test.py
