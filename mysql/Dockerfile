FROM mysql:5.7
MAINTAINER GZCSS/HUANGWEIBO

#更新包缓存
RUN  apt-get update && \
apt-get install   wget vim zip ssh  telnet  curl  -y

WORKDIR  /home
RUN mkdir scripts

#将所需文件放到镜像中
ADD ./scripts/setup.sh /home/scripts/setup.sh
ADD ./scripts/schema.sql /home/scripts/schema.sql
#ADD jpcpdb180109.sql /home/scripts/jpcpdb180109.sql
ADD ./scripts/privileges.sql /home/scripts/privileges.sql
ADD ./scripts/my.cnf  /etc/my.cnf

#授权
RUN chmod 755 /etc/my.cnf  &&  chmod 755 /home/scripts/*

#设置免密登录
ENV MYSQL_ALLOW_EMPTY_PASSWORD yes

#授权
RUN chown  mysql:mysql /var/lib/mysql  && chmod -R 755 /var/lib/mysql

#开放端口
EXPOSE 3306
#设置容器启动时执行的命令
CMD ["sh", "/home/scripts/setup.sh"]
