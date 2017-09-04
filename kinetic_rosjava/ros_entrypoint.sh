#!/bin/bash
set -e

# setup ros environment
echo "[ROS] ros-kinetic, oracle-java7, rosjava"
echo "[IDE] idea, clion, pycharm"
echo "[Alias] cm:catkin_make cw:catkin_ws"
echo "Modify ROS_HOSTNAME in /root/.bashrc to your IP address and execute 'source ~/.bashrc'"

# for ros environment
if [ -e /opt/ros/kinetic/setup.bash ] ; then
  if ! grep -Fq "/opt/ros/kinetic/setup.bash" ~/.bashrc ; then
    echo "source '/opt/ros/kinetic/setup.bash'" >> ~/.bashrc
  fi
  source "/opt/ros/kinetic/setup.bash"
  if ! [ -e /root/catkin_ws/devel/setup.bash ] ; then
    cd /root/catkin_ws && catkin_make
    cd ~
  fi
fi

if [ -e /root/catkin_ws/devel/setup.bash ] ; then
  if ! grep -Fq "/root/catkin_ws/devel/setup.bash" ~/.bashrc ; then
    echo "source '/root/catkin_ws/devel/setup.bash'" >> ~/.bashrc
  fi
  source "/root/catkin_ws/devel/setup.bash"
fi

# for displying qt gui
export QT_X11_NO_MITSHM=1

exec "$@"
