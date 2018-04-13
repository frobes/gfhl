## Rancher 自动安装配置
# 请编写一个 docker-compose.yml 文件，配置 Rancher 运行时的端口、服务名称、启动参数。
# 请编写一个 Linux Shell 脚本，实现自动下载Rancher的Docker镜像、Rancher Compose、Rancher CLI的stable 版本，自动安装Rancher并自动调用 docker-compose 运行 Rancher 。

#执行脚本：sh rancher.sh
#执行脚本后会实时显示容器日志，如果要退出可按CRTL+C强制退出。

#环境要求：
#1.ubuntu 14.04 TLS 以上
#2.宿主机端口58080、3307没有占用
#3.docker及docker compose启用

