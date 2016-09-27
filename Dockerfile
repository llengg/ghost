FROM library/ghost
MAINTAINER gaoal <keepob@163.com>

ADD run.sh /run.sh
# Install packages
RUN rm -rf /var/lib/apt/lists/* && \
    chmod 755 /run.sh && \
    npm config set registry http://registry.cnpmjs.org && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 
    
# Exposed ENV
ENV NODE_ENV=production
    
VOLUME  ["/data"]

EXPOSE  80
CMD ["run.sh"]
  
