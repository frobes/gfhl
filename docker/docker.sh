#!/bin/bash
#author:黄伟波
#date:2018-04-10
echo "-------------关闭防火墙-----------------------"
sudo ufw disable
echo "----------------------安装docker CE------------"
sudo apt-get install apt-transport-https -y
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sudo bash -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
#更新包
sudo apt-get update
sudo apt-get install lxc-docker -y
echo "-----------------启动docker-----------------"
sudo service docker restart

echo "-----------------安装docker compose---------------------------------"
curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod u+x /usr/local/bin/docker-compose

dk=`docker --version`
dc=`docker-compose -vesion`
echo "查看docker版本号：$dk"
echo "查看docker-compose版本号：$dc"

