## MySql 自动备份
#请编写一个Linux Shell 脚本，实现MySql数据库的以下自动备份和配置：
# 创建运行该备份的定时任务，可配置备份的时间、频率、需要备份的数据表、日志文件、存放备份文件的git私有库、压缩格式。
# 为运行该自动备份定时任务创建必要的用户组和用户，并对其需要访问的目录、文件、其他服务等进行必要的授权，不得直接使用root账户运行该任务。
# 备份完成后自动将生成的备份文件命名为“备份日期-时间戳”的格式。
# 备份完成后自动将数据文件压缩成指定的格式。
# 压缩完成后自动检测压缩文件是否完好、可正常解压。
# 检测完成后自动将压缩文件commit到指定的Git私有库，并自动按备份的时间戳建立一个分支。

#执行脚本：
mysql_backup.sh:负责把mysql数据库备份到指定的目录，压缩并加上备份日期,压缩完成后自动检测压缩文件是否完好、可正常解压
cron.sh:建立gfhl用户每15分钟执行mysql_backup.sh脚本


#环境要求
1、系统中不存在 gfhl用户
2、mysqldump为全局参数
3、系统本身有数据库mysql,jpcomtest


#运行效果：
root@ravello-virtual-machine:/home/docker/gfhl/mysql_backup# sh cron.sh 
-----------------建立gfhl用户---------------------
cron stop/waiting
cron start/running, process 19478
------------------------查看gfhl定时任务--------------------
15  *  * *  * /bin/sh /home/gfhl/mysql_backup.sh



root@ravello-virtual-machine:/home/docker/gfhl/mysql_backup# sh mysql_backup.sh 
------------------- 备份数据库生成SQL文件---------------------
/home/gfhl/mysql-20180415.sql
------------------- 备份数据库生成SQL文件---------------------
/home/gfhl/jpcomtest-20180415.sql
/home/gfhl/jpcomtest-20180415.sql
该压缩文件完好，可正常解压！



root@ravello-virtual-machine:/home/docker/gfhl/mysql_backup# ll /home/gfhl/
总用量 45924
drwxr-xr-x  5 gfhl gfhl     4096  4月 15 11:05 ./
drwxr-xr-x 14 root root     4096  4月 12 13:18 ../
-rw-------  1 gfhl gfhl      190  4月 15 10:59 .bash_history
-rw-r--r--  1 gfhl gfhl      220  4月  9  2014 .bash_logout
-rw-r--r--  1 gfhl gfhl     3637  4月  9  2014 .bashrc
-rwxr-xr-x  1 gfhl gfhl     8980 10月  4  2013 examples.desktop*
-rw-r--r--  1 root root 23141402  4月 15 11:05 jpcomtest-20180415.sql.tar.gz
-rwxr-xr-x  1 gfhl gfhl       55  4月 13 17:15 my.cnf*
-rw-r--r--  1 root root   511389  4月 15 11:04 mysql-20180415.sql.tar.gz
-rwxr-xr-x  1 root root     1105  4月 15 10:59 mysql_backup.sh*
-rw-r--r--  1 gfhl gfhl      675  4月  9  2014 .profile
-rw-rw-r--  1 gfhl gfhl       66  4月 12 13:19 .selected_editor



