FROM library/ghost
MAINTAINER gaoal <keepob@163.com>

ADD run.sh /run.sh

# Install packages
RUN apt-get update && \
    apt-get -y install curl unzip  && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /data && \
    chmod 755 /run.sh && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 
    

# Exposed ENV
ENV ROOT_PASS=123456 \
    GHOST_V=0.7.4-zh-full \
    GHOST_URL=my-ghost-blog.com \
    NODE_ENV=production
    
VOLUME  ["/data"]

EXPOSE  80
CMD ["/run.sh"]
  
