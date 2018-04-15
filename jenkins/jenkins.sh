#!/bin/bash
#根据Dockerfile生成jenkins镜像-------------
sudo docker build -t  hwb/jenkins:1.0  ./jenkins
#根据Dockerfile生成jdk镜像-----------------
sudo docker build -t hwb/jdk8:1.0   ./jdk
#根据Dockerfile生成tomcat镜像-----------------
sudo docker build -t hwb/tomcat8:1.0   ./tomcat
#根据Dockerfile生成maven镜像-----------------
sudo docker build -t hwb/maven3:1.0   ./maven
#生成容器
docker-compose up -d
#jenkins容器ID
containerid=`sudo docker ps -a|grep  jenkins |awk '{print $1}'`
echo "--------显示并查看jenkins容器的日志-----------"
sudo docker logs -f $containerid
