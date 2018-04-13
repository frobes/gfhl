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






