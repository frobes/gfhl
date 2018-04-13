#!/bin/bash
#author:huangweibo
#date:2018-04-12
#解决明文密码警告问题
touch   ~/my.cnf
cat << EOF >  ~/my.cnf
[client]  
host=127.0.0.1
user=gfhl  
password=gfhl
port=53306
EOF

mysql_status=`mysql --defaults-extra-file=~/my.cnf   -e "show databases" | wc -l`
if [ $mysql_status -gt  3  ] ; then
   echo "Mysql is running"
else
   echo "Mysql is not running"
fi
