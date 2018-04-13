#!/bin/bash
#author:huangweibo
#date:2018-04-12

echo "-----------------建立gfhl用户---------------------" 
groupadd gfhl
useradd  -g gfhl  gfhl -d /home/gfhl
 


#授权
chmod 755 /home/my.cnf
chown -R  gfhl:gfhl /home/my.cnf
chmod  -R 755 /var/lib/mysql
chmod  -R 755 /usr/bin/mysqldump
chmod -R  755  /home/gfhl/*
cp  mysql_backup.sh  /home/gfhl/mysql_backup.sh
chmod  755  /home/gfhl/mysql_backup.sh

#设置15分钟执行一次定时任务
sudo touch /var/spool/cron/gfhl
crontab -u gfhl  /var/spool/cron/gfhl
chmod -R 755  /var/spool/cron/gfhl

#设置15分钟执行
echo "15  *  * *  * /bin/sh /home/gfhl/mysql_backup.sh" >>/var/spool/cron/gfhl

echo "------------------------查看gfhl定时任务--------------------"
crontab -l -u gfhl
