# docker、docker-compose自动安装配置
#请编写一个 Linux Shell 脚本，实现自动下载、安装、配置 Docker CE、docker-compose 的 latest 版本及其相关的运行环境。

#执行脚本：
docker.sh:自动下载、安装、配置 Docker CE、docker-compose 的 latest 版本及其相关的运行环境

#环境要求：ubuntu14.04 TLS以上版本
#由于oracle云和阿里云上只有ubuntu14.04环境，导致docker version默认是1.9.1版本，后面的docker-compose版本相应为version 1。

#运行效果及截图：
.....
docker start/running, process 3849
-----------------安装docker compose---------------------------------
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   617    0   617    0     0    686      0 --:--:-- --:--:-- --:--:--   687
100 7857k  100 7857k    0     0   391k      0  0:00:20  0:00:20 --:--:--  549k
查看docker版本号：Docker version 1.9.1, build a34a1d5
查看docker-compose版本号：docker-compose version 1.9.0, build 2585387
