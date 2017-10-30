#!/bin/bash
sudo apt-get update -y && sudo apt-get upgrade -y
# Setup
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
CODENAME=$(lsb_release -cs)

# Add the repository
echo "deb http://repos.mesosphere.com/${DISTRO} ${CODENAME} main" | 
  sudo tee /etc/apt/sources.list.d/mesosphere.list
sudo apt-get -y update

sudo apt-get install docker \
docker.io \
openssh-server \
ansible -y \
libapr1 \
libapr1-dev \
default-jre \
default-jdk \
maven \
mesos  \
marathon \
curl \
ansible \

sudo echo 'sympo	ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

sudo service docker start
sudo service sshd start
#wget http://www.apache.org/dist/mesos/1.4.0/mesos-1.4.0.tar.gz && tar -xzf  mesos-1.4.0.tar.gz

