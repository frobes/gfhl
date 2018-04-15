FROM ubuntu:14.04 
#刷新包缓存
RUN apt-get update 
#设置工作目录
WORKDIR /usr/local
# 安装jdk
ADD  noquit.sh  /usr/local/
ADD  jdk1.8   /usr/local/jdk1.8
# 配置jdk环境变量
ENV JAVA_HOME  /usr/local/jdk1.8
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib
ENV PATH $PATH:$JAVA_HOME/bin

#容器启动后执行命令，保持运行状态
CMD  [ "sh","/usr/local/noquit.sh" ] 
