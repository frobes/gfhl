FROM ubuntu:14.04 
#刷新包缓存
RUN apt-get update && apt-get install -y wget zip
#设置工作目录
WORKDIR /home
#安装 tomcat8
ADD apache-tomcat-8.0.27.zip /home
ADD  noquit.sh  /home
RUN unzip apache-tomcat-8.0.27.zip
RUN chmod -R 755 /home/apache-tomcat-8.0.27
#配置tomcat的环境变量
ENV CATALINA_HOME /home/apache-tomcat-8.0.27
ENV PATH $PATH:$CATALINA_HOME/bin
EXPOSE 8080
#设置tomcat 自启动
CMD  [ "sh" ,"/home/noquit.sh" ] 

