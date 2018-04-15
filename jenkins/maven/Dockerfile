FROM ubuntu:14.04 
#刷新包缓存 并且 安装wget工具
RUN apt-get update && apt-get install -y wget
#设置工作目录
WORKDIR /home
ADD  noquit.sh  /home
RUN mkdir /home/maven
#安装maven
RUN wget -P /home/maven  http://apache.fayea.com/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz \
&& tar -xvf /home/maven/apache-maven-3.3.9-bin.tar.gz -C /home/maven \
&& rm -rf /home/maven/apache-maven-3.3.9-bin.tar.gz
#设置maven环境变量
ENV M2_HOME /home/maven/apache-maven-3.3.9
ENV PATH $PATH:$M2_HOME/bin
#打包项目并拷贝到tomcat webapps目录
#RUN mkdir /home/webapp
#ADD  ./project  /home/webapp
#RUN cd /home/webapp && mvn package && cp /home/webapp/target/XXX.war /home/tomcat/apache-tomcat-8.5.8/webapps
CMD  [ "sh" ,"/home/noquit.sh" ] 
