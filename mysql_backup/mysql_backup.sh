#!/bin/bash
#author:huangweibo
#date:2018-04-12

#备份数据库
databases='mysql jpcomtest'

# 备份文件要保存的目录
basepath='/home/gfhl/'

#备份日期
dt=`date +%Y%m%d`
if [ ! -d "$basepath" ]; then
   mkdir -p "$basepath"
fi

#解决明文密码警告问题
touch   ~/my.cnf
cat << EOF >  ~/my.cnf
[client]  
host=127.0.0.1
user=root  
password=123456 
EOF


# 循环databases数组
for db in $databases; do
    echo   "------------------- 备份数据库生成SQL文件---------------------"
    mysqldump --defaults-extra-file=~/my.cnf  --events --ignore-table=mysql.events  $db > $basepath$db-$dt.sql
    
    #将生成的SQL文件压缩
    tar -czPvf $basepath$db-$dt.sql.tar.gz  $basepath$db-$dt.sql
    
    #删除14天之前的备份数据
    find $basepath -mtime +14 -name "*.sql.tar.gz" -exec rm -rf {} \;
  done


# 删除生成的SQL文件
rm -rf $basepath/*.sql

#测试压缩文件是否完好
cd $basepath
tar -xvPf $db-$dt.sql.tar.gz 
if [ -e $basepath$db-$dt.sql ]; then 
  echo "该压缩文件完好，可正常解压！"
  rm -rf $basepath/*.sql
else
  echo "该压缩文件已损坏"
fi

