#!/bin/bash
#author:huangweibo
#date:2018-04-11
echo `service mysql status`
echo '---------------1.启动mysql------------------'
service mysql start
sleep 3
echo `service mysql status`
echo '------------2.建库(数据初始化)--------------'
mysql --defaults-extra-file=/etc/my.cnf < /home/scripts/schema.sql
sleep 3
echo '--------------3.开始修改密码----------------'
mysql --defaults-extra-file=/etc/my.cnf < /home/scripts/privileges.sql
echo '--------------4.修改密码完毕----------------'
echo `service mysql status`

#防止容器自动关闭
tail -f /dev/null
