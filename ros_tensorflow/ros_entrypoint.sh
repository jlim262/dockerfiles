#!/bin/bash
set -e

# setup ros environment
echo "ros-kinetic with tensorflow, gpu supported"
echo "[pycharm] pychrm > /dev/null 2>&1 &"
echo "[clion] clion > /dev/null 2>&1 &"
echo "[jupyter] jupyter notebook --allow-root"
echo "[pylonviewer] pylonviewer"

# to setup pylon sdk, cheese needs to be setup after login.
if [ $(dpkg-query -W -f='${Status}' cheese 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
  echo "please wait until initial configuration will be done."
  apt-get update -qq && apt-get install -qqy cheese;
  yes | /tmp/pylon-5.0.5.9000-x86_64/setup-usb.sh
fi

# for ros environment
if [ -e /opt/ros/kinetic/setup.bash ] ; then
  if ! grep -Fxq "/opt/ros/kinetic/setup.bash" ~/.bashrc ; then
    echo "source '/opt/ros/kinetic/setup.bash'" >> ~/.bashrc
  fi
  echo "setup.bash"
  source "/opt/ros/kinetic/setup.bash"
  cd /root/catkin_ws && catkin_make
fi

if [ -e /root/catkin_ws/devel/setup.bash ] ; then
  if ! grep -Fxq "/root/catkin_ws/devel/setup.bash" ~/.bashrc ; then
    echo "source '/root/catkin_ws/devel/setup.bash'" >> ~/.bashrc
  fi
  source "/root/catkin_ws/devel/setup.bash"
fi

# for displying qt gui
export QT_X11_NO_MITSHM=1

exec "$@"
