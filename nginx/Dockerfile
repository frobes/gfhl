FROM debian:jessie
#所有者
MAINTAINER huangweibo "1275758000@qq.com"

ENV NGINX_VERSION 1.10.1-1~jessie

#将几条命令合在一起写，运行时只在一个容器运行，可节省资源，不会有太多层容器。
RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
    && echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
                                                ca-certificates \
                                                nginx=${NGINX_VERSION} \
                                                nginx-module-xslt \
                                                nginx-module-geoip \
                                                nginx-module-image-filter \
                                                nginx-module-perl \
                                                nginx-module-njs \
                                                gettext-base \
     && rm -rf /var/lib/apt/lists/*


RUN ln -sf /dev/stdout /var/log/nginx/access.log \
     && ln -sf /dev/stderr /var/log/nginx/error.log

#暴露端口80   443
EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
