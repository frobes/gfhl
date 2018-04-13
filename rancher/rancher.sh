#!/bin/bash
#author:huangweibo
#date:2018-04-12

echo "--------------------------拉取镜像-----------------"
#sudo docker run -d --restart=always  --name rancher -p 58080:8080 rancher/server 
docker pull rancher/server:stable

echo "----安装并运行rancher容器，端口号为58080----------"
docker-compose up -d

#显示 Rancher 服务器的容器 ID
containerid=`sudo docker ps -a|grep rancher |awk '{print $1}'`

echo "--------显示并查看 Rancher 服务器的日志-----------"
sudo docker logs -f $containerid

