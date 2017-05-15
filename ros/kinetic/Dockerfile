FROM ubuntu:16.04
MAINTAINER JongYoon Lim <jongyoon@apache.org>

# setup environment
#RUN locale-gen en_US.UTF-8
#ENV LANG en_US.UTF-8

# setup keys
RUN apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 421C365BD9FF1F717815A3895523BAEEB01FA116

# setup sources.list
RUN echo "deb http://packages.ros.org/ros/ubuntu xenial main" > /etc/apt/sources.list.d/ros-latest.list

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    python-rosdep \
    python-rosinstall \
    python-vcstools \
    && rm -rf /var/lib/apt/lists/*

# bootstrap rosdep
RUN rosdep init \
    && rosdep update

# install ros packages
ENV ROS_DISTRO kinetic
RUN apt-get update && apt-get install -y \
    wget \
    ros-kinetic-desktop-full && \
    rm -rf /var/lib/apt/lists/*

RUN wget -O /pylon-5.0.5.9000.tar.gz "https://www.dropbox.com/s/7yxzyudgdukicme/pylon-5.0.5.9000--RC8-x86_64.tar.gz?dl=0"
RUN cd / && tar xzvf /pylon-5.0.5.9000.tar.gz
RUN cd /pylon-5.0.5.9000-x86_64 && tar -C /opt -xzf pylonSDK*.tar.gz
RUN cd /pylon-5.0.5.9000-x86_64 && yes | ./setup-usb.sh

# setup entrypoint
COPY ./ros_entrypoint.sh /

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]
