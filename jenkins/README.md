## 请选择以下一个或多个应用按后面的要求完成该应用容器的自动化安装、配置、部署和运行
* FusionDirectory Ldap Manager - Latest版本
* Jira - v7.54
* GitLab - Latest 简体中文版本
* JFrog Artifactory OSS - Latest版本
* Jenkins Blue Ocean - Latest版本
* Drone - Latest版本
* Ajenti | Vesta Server Control Pannel - Latest版本

## 实现要求
* 请编写上述应用容器的Dockerfile 文件。
* 所有上述应用容器依赖的基础运行环境，例如：jdk、php、python、Node.js、Ruby、Go等必须为单独的Base Image容器，不能直接嵌入到上述的应用容器中。
* 上述应用容器必须链接使用[“必做题”](## 必做题)中构建的数据库服务。
* 上述应用容器必须与Ldap服务集成，链接到一个已经创建好的Open-Ldap服务。
* 与数据库及Ldap集成时如需配置连接数据库、Ldap的账户、密码，不得使用明文配置密码，只能使用密文或者加密的key，请提供一个Linux Shell脚本自动生成加密key或密码的密文。
* 为运行上述应用服务创建必要的用户组和用户，并对其需要访问的目录、文件、其他服务等进行必要的授权，不得直接使用root账户运行该服务。
* 请编写上述应用容器的docker-compose.yml 文件，在文件中定义：该应用容器运行时的端口、链接数据库和Ldap服务时所需的参数、存放上述应用容器的配置文件和用户数据的目录映射路径、用于启动和运行该容器服务的操作系统用户等。
* 请编写上述应用容器的rancher-compose.yml文件，在文件中定义运行该应用服务的部署参数和流程。
* 请编写Linux Shell脚本，实现自动根据上述Dockerfile构建Docker容器镜像文件、自动判断构建状态，若构建成功，自动根据docker-compose.yml、.env、rancher-compose.yml部署并运行该应用服务。
* 每个应用容器都单独提供一套Dockerfile、docker-compose.yml、.env、rancher-compose.yml和Linux Shell脚本。


#执行脚本：
jenkins.sh:主脚本，依次生成jdk,tomcat,maven,jenkins镜像，并根据docker-compose启动容器，容器之间互相关联，最后生成容器启动日志，按CRTL+C终止日志输出。
noquit.sh:保持容器为运行状态
docker-compose.yml:配置jdk,tomcat,maven,jenkins容器的名称，关联容器，环境变量,端口,挂载等
Dockerfile:jdk，tomcat,maven,jenkins各有一个文件夹存放各自的Dockerfile


#环境要求：
1.docker-compose为version1
2.开放端口18080,28080,50000

#访问地址：
#35.194.202.47为oracle云地址
1.jenkins:http://35.194.202.47:18080
#一开始登录需要输入admin密码，密码从日志中可以看到。

2.tomcat:http://35.194.202.47:28080
提示：可看到tomcat界面



#运行效果
Jenkins initial setup is required. An admin user has been created and a password generated.
Please use the following password to proceed to installation:

5fb859723cf84d81afaf30e0f5c1dbe5

This may also be found at: /var/jenkins_home/secrets/initialAdminPassword

*************************************************************
*************************************************************
*************************************************************

--> setting agent port for jnlp
--> setting agent port for jnlp... done
Apr 15, 2018 1:39:19 AM hudson.model.UpdateSite updateData
INFO: Obtained the latest update center data file for UpdateSource default
Apr 15, 2018 1:39:20 AM hudson.model.DownloadService$Downloadable load
INFO: Obtained the updated data file for hudson.tasks.Maven.MavenInstaller
Apr 15, 2018 1:39:21 AM hudson.model.UpdateSite updateData
INFO: Obtained the latest update center data file for UpdateSource default
Apr 15, 2018 1:39:21 AM hudson.WebAppMain$3 run
INFO: Jenkins is fully up and running
Apr 15, 2018 1:39:22 AM hudson.model.DownloadService$Downloadable load
INFO: Obtained the updated data file for hudson.tools.JDKInstaller
Apr 15, 2018 1:39:22 AM hudson.model.AsyncPeriodicWork$1 run
INFO: Finished Download metadata. 23,098 ms

root@ravello-virtual-machine:/home/docker/gfhl/jenkins# docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED              STATUS              PORTS                                               NAMES
60802d32263c        hwb/jenkins:1.0     "/bin/tini -- /usr/lo"   About a minute ago   Up About a minute   0.0.0.0:50000->50000/tcp, 0.0.0.0:18080->8080/tcp   jenkins
d9ca728db731        hwb/maven3:1.0      "sh /home/noquit.sh"     About a minute ago   Up About a minute                                                       maven3
d7dcdfe4a7f0        hwb/tomcat8:1.0     "sh /home/noquit.sh"     About a minute ago   Up About a minute   0.0.0.0:28080->8080/tcp                             tomcat
bd8c6fc9034d        hwb/jdk8:1.0        "sh /usr/local/noquit"   About a minute ago   Up About a minute                                                       jdk

root@ravello-virtual-machine:/home/docker/gfhl/jenkins# docker images 
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
hwb/maven3          1.0                 14cdc04e2158        5 minutes ago       260 MB
hwb/tomcat8         1.0                 f85064f13273        6 minutes ago       291 MB
hwb/jdk8            1.0                 b927c4f4f4e7        7 minutes ago       620.2 MB
hwb/jenkins         1.0                 2acd7338a0e7        8 minutes ago       804.7 MB
ubuntu              14.04               3e61fa2ae47c        2 days ago          222.8 MB
jenkins             latest              75be44eea167        3 weeks ago         800.8 MB



