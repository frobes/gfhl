### MySql 镜像制作
#请编写一个 Dockerfile 实现 Mysql Community Server 5.x latest 版本的镜像、为运行该数据库服务创建必要的用户组和用户，并对其需要访问的目录、文件、其他服务等\
#进行必要的授权，不得直接使用root账户运行该服务。
#请编写一个 docker-compose.yml 文件，在文件中定义：MySql 运行时的服务名称、端口、cnf 配置文件、/data 目录、/logs 目录的映射路径、MySql root 用户的初始化密码\
#用于启动和运行MySql数据库服务的操作系统用户等参数。
#请编写一个rancher-compose.yml、.env文件，在文件中定义MySql数据库服务的部署参数和流程。
#请编写一个Linux Shell脚本，实现自动根据上述Dockerfile构建Docker容器镜像文件、自动判断构建状态，若构建成功，自动根据docker-compose.yml、rancher-compose.yml、\
#.env部署并运行MySql服务。
#请编写一个Linux Shell脚本，测试一下该MySql服务是否正常运行，例如：自动登录MySql数据库并自动执行一条select语句等。


#执行脚本：
1.安装部署mysql:sh mysql.sh
2.测试mysql: sh mysql_test.sh


#各配置文件实现功能：
mysql.sh:主脚本，建立用户、挂载的目录及授权，根据Dockerfile文件来建立mysql镜像,根据docker-compose文件来启动容器，启动容器后执行scripts目录下的setup.sh脚本
setup.sh:容器启动后默认执行的脚本，负责建立数据库gfhl,mysql账号密码为gfhl/gfhl
privileges.sql:负责建立账号密码
schema.sql:负责建立数据库（可做数据的初始化）
my.cnf:mysql服务的相关配置及解决密码明文显示警告问题
Dockerfile:主要负责拉取镜像，授权，将用到的文件添加到镜像中。
docker-compose.yml:定义MySql 运行时的服务名称、端口、cnf 配置文件、/data 目录、/logs 目录的映射路径、MySql root 用户的初始化密码等。

mysql_test.sh:测试该mysql服务是否正常运行。

#环境要求：
1.开放端口53306
2.docker-compose为version1

#访问地址：
#35.194.202.47为oracle云地址
#数据库：gfhl  用户名：gfhl   密码：gfhl 端口：53306
root@ravello-virtual-machine:/home/docker/gfhl/mysql# mysql -h 35.194.202.47 -P53306 -u gfhl -pgfhl -e "show databases"
+--------------------+
| Database           |
+--------------------+
| information_schema |
| gfhl               |
| mysql              |
| performance_schema |
| sys                |
+--------------------+




#运行效果
Successfully built 1243a1137679
----------创建mysql数据库并初始化密码--------
Creating mysqldb
--------显示并查看mysql容器的日志-----------
MySQL Community Server 5.7.21 is not running.
---------------1.启动mysql------------------
2018-04-15T02:11:15.505204Z 0 [Warning] TIMESTAMP with implicit DEFAULT value is deprecated. Please use --explicit_defaults_for_timestamp server option (see documentat
ion for more details).2018-04-15T02:11:15.505359Z 0 [Warning] 'NO_ZERO_DATE', 'NO_ZERO_IN_DATE' and 'ERROR_FOR_DIVISION_BY_ZERO' sql modes should be used with strict mode. They will be merg
ed with strict mode in a future release.2018-04-15T02:11:15.505365Z 0 [Warning] 'NO_AUTO_CREATE_USER' sql mode was not set.
2018-04-15T02:11:16.187369Z 0 [Warning] InnoDB: New log files created, LSN=45790
2018-04-15T02:11:16.296639Z 0 [Warning] InnoDB: Creating foreign key constraint system tables.
2018-04-15T02:11:16.315903Z 0 [Warning] No existing UUID has been found, so we assume that this is the first time that this server has been started. Generating a new U
UID: 4756ac87-4052-11e8-a18d-0242ac110007.2018-04-15T02:11:16.318896Z 0 [Warning] Gtid table is not ready to be used. Table 'mysql.gtid_executed' cannot be opened.
2018-04-15T02:11:16.321628Z 1 [Warning] root@localhost is created with an empty password ! Please consider switching off the --initialize-insecure option.
2018-04-15T02:11:17.298473Z 1 [Warning] 'user' entry 'root@localhost' ignored in --skip-name-resolve mode.
2018-04-15T02:11:17.298613Z 1 [Warning] 'user' entry 'mysql.session@localhost' ignored in --skip-name-resolve mode.
2018-04-15T02:11:17.298630Z 1 [Warning] 'user' entry 'mysql.sys@localhost' ignored in --skip-name-resolve mode.
2018-04-15T02:11:17.298657Z 1 [Warning] 'db' entry 'performance_schema mysql.session@localhost' ignored in --skip-name-resolve mode.
2018-04-15T02:11:17.298664Z 1 [Warning] 'db' entry 'sys mysql.sys@localhost' ignored in --skip-name-resolve mode.
2018-04-15T02:11:17.298678Z 1 [Warning] 'proxies_priv' entry '@ root@localhost' ignored in --skip-name-resolve mode.
2018-04-15T02:11:17.298727Z 1 [Warning] 'tables_priv' entry 'user mysql.session@localhost' ignored in --skip-name-resolve mode.
2018-04-15T02:11:17.298738Z 1 [Warning] 'tables_priv' entry 'sys_config mysql.sys@localhost' ignored in --skip-name-resolve mode.
...
MySQL Community Server 5.7.21 is started.
MySQL Community Server 5.7.21 is running.
------------2.建库(数据初始化)--------------
Database
information_schema
gfhl
mysql
performance_schema
sys
--------------3.开始修改密码----------------
host	user
localhost	mysql.session
localhost	mysql.sys
localhost	root
host	user
%	gfhl
%	root
127.0.0.1	gfhl
127.0.0.1	root
localhost	gfhl
localhost	mysql.session
localhost	mysql.sys
localhost	root
--------------4.修改密码完毕----------------
MySQL Community Server 5.7.21 is running.



root@ravello-virtual-machine:/home/docker/gfhl/mysql# docker ps -a
CONTAINER ID        IMAGE          COMMAND               CREATED             STATUS                PORTS                                         NAMES
AMES4e00c43eb110   mysql5.7:1.0  "docker-entrypoint.sh"   4 minutes ago       Up 4 minutes   0.0.0.0:53306->3306/tcp                             mysqldb


root@ravello-virtual-machine:/home/docker/gfhl/mysql# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
mysql5.7            1.0                 1243a1137679        7 minutes ago       494.5 MB
mysql               5.7                 6a06a45da6ad        4 weeks ago         371.4 MB



root@ravello-virtual-machine:/home/docker/gfhl/mysql# sh mysql_test.sh 
Mysql is running


