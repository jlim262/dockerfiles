
### 1. Setup repository
```
sudo apt-get update  
sudo apt-get install \  
    linux-image-extra-$(uname -r) \  
    linux-image-extra-virtual  
sudo apt-get update  
sudo apt-get install \  
    apt-transport-https \  
    ca-certificates \  
    curl \  
    software-properties-common  
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

### 2. Install docker-ce
```
sudo apt-get update
sudo apt-get install docker-ce
apt-cache madison docker-ce
sudo apt-get install docker-ce=<VERSION>
sudo docker run hello-world
```

### 3. Intall cuda
```
sudo dpkg -i cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64.deb
sudo apt-get update
sudo apt-get install cuda
nvidia-smi
```

### 4. Install nvidia-docker and nvidia-docker-plugin
```
wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1-1_amd64.deb
sudo dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb  
```

### 5. Pull and Run ros-tensorflow
```
sudo docker pull jongyoon/ros-tensorflow
sudo nvidia-docker run -it --net="host" --privileged=true -e DISPLAY=${DISPLAY} -v  /tmp/.X11-unix:/tmp/.X11-unix --device "/dev" -p 8888:8888 jongyoon/ros-tensorflow /bin/bash
```
