#!/bin/bash
#author:huangweibo
#date:2018-04-13

#----------------建立目录-------------------------
mkdir -p ~/nginx/www  ~/nginx/logs  

echo "---------------拉取镜像--------------"
docker pull  nginx:latest
echo  "------------通过docker-compose运行容器------------"
docker-compose up -d

#nginx容器ID
containerid=`sudo docker ps -a|grep  nginx |awk '{print $1}'`
echo "------------------- 查看nginx状态------------------"
sudo docker exec -it  $containerid     service nginx status
