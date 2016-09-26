FROM library/ghost
MAINTAINER gaoal <keepob@163.com>

# Install packages
RUN rm -rf /var/lib/apt/lists/* && \
    npm config set registry http://registry.cnpmjs.org && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 
    
# Exposed ENV
ENV NODE_ENV=production
    
VOLUME  ["/data"]

WORKDIR /data/ghost/

EXPOSE  80
CMD ["npm start"]
  
