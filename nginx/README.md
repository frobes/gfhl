## Ngnix 自动安装配置
# 请编写一个 docker-compose.yml 文件，配置Ngnix运行时的端口、服务名称、配置文件映射路径等参数。
# 请编写一个rancher-compose.yml、.env文件，在文件中定义Ngnix 服务的部署参数和流程。
# 请编写一个Linux Shell 脚本，实现自动下载Ngnix Docker 镜像的Latest版本、根据docker-compose.yml、rancher-compose.yml、.env部署并运行Ngnix 服务。

#执行脚本：
sh nginx.sh

#环境要求：
1.系统中8889端口不被占用
2.docker-compose.yml为version1

#访问nginx地址：
#35.194.202.47为oracle云地址
http://35.194.202.47:8889
提示：Welcome to nginx!

#运行效果及截图:
Status: Downloaded newer image for nginx:latest
------------通过docker-compose运行容器------------
Creating nginx
------------------- 查看nginx状态------------------
nginx is running.
root@ravello-virtual-machine:/home/docker/gfhl/nginx# docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                  NAMES
d76df34746ca        nginx:latest        "nginx -g 'daemon off"   9 minutes ago       Up 9 minutes        0.0.0.0:8889->80/tcp   nginx

