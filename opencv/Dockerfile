# This is an auto generated Dockerfile for ros:indigo-ros-base
# generated from templates/docker_images/create_ros_image.Dockerfile.em
# generated on 2017-01-27 02:33:52 +0000
FROM ubuntu:14.04
LABEL maintainer "JongYoon Lim<jongyoon@apache.org>"

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
  build-essential \
	cmake \
  git \
  pkg-config \
  libswscale-dev \
	python3-dev \
  python3-numpy \
	libtbb2 \
  libtbb-dev \
  libjpeg-dev \
	libpng-dev \
  libtiff-dev \
  libjasper-dev \
  yasm \
  libavformat-dev \
  libpq-dev \
  wget && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir ~/opencv
RUN cd ~/opencv && git clone https://github.com/Itseez/opencv_contrib.git && cd opencv_contrib && git checkout 3.2.0
RUN cd ~/opencv && git clone https://github.com/Itseez/opencv.git && cd opencv && git checkout 3.2.0

RUN cd ~/opencv/opencv && mkdir release && cd release && \
         cmake -D CMAKE_BUILD_TYPE=RELEASE \
         -D CMAKE_INSTALL_PREFIX=/usr/local \
         -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
         -D INSTALL_C_EXAMPLES=OFF \
         -D INSTALL_PYTHON_EXAMPLES=OFF \
         -D BUILD_EXAMPLES=OFF \
         -D WITH_OPENGL=ON \
         -D WITH_V4L=ON \
         -D WITH_XINE=ON \
         -D WITH_TBB=ON ..

CMD ["bash"]
