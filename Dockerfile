FROM debian:wheezy
MAINTAINER gaoal <keepob@163.com>

ADD sources.list  /etc/apt/sources.list
ADD run.sh /run.sh

# Install packages
RUN apt-get update && \
    apt-get -y install curl unzip  && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /data && \
    chmod 755 /run.sh && \
#   Install nodejs 0.10
    cd /data && \
    curl -O http://mirrors.163.com/debian/pool/main/r/rlwrap/rlwrap_0.37-3_amd64.deb > /dev/null 2>&1 && \
    curl -O https://deb.nodesource.com/node_0.10/pool/main/n/nodejs/nodejs_0.10.40-1nodesource1~wheezy1_amd64.deb > /dev/null 2>&1 && \
    dpkg -i *.deb && rm -rf *.deb && \
    npm install forever -g && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 
    

ADD config.js /var/config.js

# Exposed ENV
ENV ROOT_PASS=123456 \
    GHOST_V=0.7.4-zh-full \
    GHOST_URL=my-ghost-blog.com \
    MYSQL_HOST= \
    MYSQL_PORT= \
    MYSQL_USER= \
    MYSQL_PASS= \
    MYSQL_DB=

VOLUME  ["/data"]

EXPOSE  80
CMD ["/run.sh"]
  
