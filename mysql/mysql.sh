#!/bin/sh
#author:huangweibo
#date:2018-04-11 
#添加用户
#user=mysql  
#group=mysql  

#用户组为空自动创建
#cat /etc/group |grep "^$group"  >& /dev/null  
#if [ $? -ne 0 ]; then  
#    groupadd $group  
#fi  
  
#用户为空则创建  
#cat /etc/passwd | grep "^$user" >& /dev/null  
#if [ $? -ne 0 ]; then  
#    useradd -g $group $user  
#fi  


echo "-------------------生成mysql镜像-----------"
docker build -t  mysql5.7:1.0 .

echo "----------创建mysql数据库并初始化密码--------"
docker-compose up -d 
#docker run  -d  -p  53306:3306  --name mysqldb mysql5.7:1.0 
sleep 5


#mysqldb容器ID
containerid=`sudo docker ps -a|grep  mysqldb |awk '{print $1}'`
echo "--------显示并查看mysql容器的日志-----------"
sudo docker logs -f $containerid

