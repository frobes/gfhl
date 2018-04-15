#!/bin/bash
#author:huangweibo 
#date:2018-04-14

#启动tomcat
sh /home/apache-tomcat-8.0.27/bin/startup.sh
sleep 5

#防止容器自动退出
tail -f /dev/null
