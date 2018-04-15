FROM jenkins
#用户root运行
USER root
RUN apt-get update && apt-get install -y sudo && rm -rf /var/lib/apt/lists/*

#授权jenkins用户sudo权限
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

#用户jenkins运行
USER jenkins
