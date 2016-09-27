FROM debian:wheezy
MAINTAINER gaoal <keepob@163.com>

ADD run.sh /run.sh

RUN apt-get update && \
    apt-get -y install curl && \
    chmod 755 /run.sh && \
    curl -O http://mirrors.163.com/debian/pool/main/r/rlwrap/rlwrap_0.37-3_amd64.deb > /dev/null 2>&1 && \
    curl -O https://deb.nodesource.com/node_0.10/pool/main/n/nodejs/nodejs_0.10.40-1nodesource1~wheezy1_amd64.deb > /dev/null 2>&1 && \
    dpkg -i *.deb && \
    rm -rf /var/lib/apt/lists/* && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 
        
VOLUME  ["/data"]

EXPOSE  80

CMD ["/run.sh"]
  
