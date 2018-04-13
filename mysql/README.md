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

#各脚本实现功能：
mysql.sh:主要脚本，建立用户、挂载的目录及授权，根据Dockerfile文件来建立mysql镜像,根据docker-compose文件来启动容器，启动容器后执行scripts目录下的setup.sh脚本
setup.sh:容器启动后执行的脚本，负责建立数据库gfhl,mysql账号密码为gfhl/gfhl
privileges.sql:负责建立账号密码
schema.sql:负责建立数据库（可做数据的初始化）
my.cnf:mysql服务的相关配置及解决密码明文显示警告问题
Dockerfile:主要负责拉取镜像，授权，将用到的文件添加到镜像中。
docker-compose.yml:定义MySql 运行时的服务名称、端口、cnf 配置文件、/data 目录、/logs 目录的映射路径、MySql root 用户的初始化密码等。

mysql_test.sh:测试该mysql服务是否正常运行。

#环境要求：
#1.开放端口53306
#2./opt/mysql目录不存在


