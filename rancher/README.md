## Rancher 自动安装配置
# 请编写一个 docker-compose.yml 文件，配置 Rancher 运行时的端口、服务名称、启动参数。
# 请编写一个 Linux Shell 脚本，实现自动下载Rancher的Docker镜像、Rancher Compose、Rancher CLI的stable 版本，自动安装Rancher并自动调用 docker-compose 运行 Rancher 。

#执行脚本：
rancher.sh：根据Dockerfile去生成rancher镜像，再根据docker-compose来启动rancher容器。
docker-compose.yml:配置 Rancher 运行时的端口、服务名称、启动参数
执行脚本后会实时显示容器日志，如果要退出可按CRTL+C强制退出。


#环境要求：
1.宿主机端口48080,43306没有占用
2.docker及docker compose启用
3.docker-compose为version1


#访问地址：
#35.194.202.47为oracle云地址
rancher:http://35.194.202.47:48080
可直接进入rancher主页，点击ADMIN修改登录密码



#运行效果：
Status: Downloaded newer image for rancher/server:stable
----安装并运行rancher容器，端口号为58080----------
Creating rancher
--------显示并查看 Rancher 服务器的日志-----------
180415  2:28:02 [Note] /usr/sbin/mysqld (mysqld 5.5.59-0ubuntu0.14.04.1) starting as process 27 ...
Uptime: 2  Threads: 1  Questions: 2  Slow queries: 0  Opens: 33  Flush tables: 1  Open tables: 26  Queries per second avg: 1.000
Setting up database
Importing schema
CATTLE_AGENT_PACKAGE_HOST_API_URL=/usr/share/cattle/artifacts/host-api.tar.gz
CATTLE_AGENT_PACKAGE_PER_HOST_SUBNET_URL=/usr/share/cattle/artifacts/rancher-per-host-subnet.zip
CATTLE_AGENT_PACKAGE_PYTHON_AGENT_URL=/usr/share/cattle/artifacts/go-agent.tar.gz
CATTLE_AGENT_PACKAGE_WINDOWS_AGENT_URL=/usr/share/cattle/artifacts/go-agent.zip
CATTLE_API_UI_URL=//releases.rancher.com/api-ui/1.0.8
CATTLE_CATTLE_VERSION=v0.183.46
CATTLE_DB_CATTLE_DATABASE=mysql
CATTLE_DB_CATTLE_MYSQL_HOST=localhost
CATTLE_DB_CATTLE_MYSQL_NAME=cattle
CATTLE_DB_CATTLE_MYSQL_PORT=3306
CATTLE_DB_CATTLE_USERNAME=cattle
CATTLE_GRAPHITE_HOST=
CATTLE_GRAPHITE_PORT=
CATTLE_HOME=/var/lib/cattle
CATTLE_HOST_API_PROXY_MODE=embedded
CATTLE_LOGBACK_OUTPUT_GELF_HOST=
.....



root@ravello-virtual-machine:/home/docker/gfhl/rancher# docker ps -a
CONTAINER ID     IMAGE                 COMMAND                  CREATED            STATUS                              PORTS                      NAME                       
Sceb551f02dc6   rancher/server:stable  "/usr/bin/entry /usr/"   5 minutes ago   Up 5 minutes    0.0.0.0:43306->3306/tcp, 0.0.0.0:48080->8080/tcp  rancher


root@ravello-virtual-machine:/home/docker/gfhl/rancher# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
rancher/server      stable              0d9444481bf7        9 days ago          1.087 GB





