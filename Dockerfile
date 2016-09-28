# Pull base image.
FROM debian:wheezy

# Install Ghost
RUN apt-get update && \
    apt-get -y install wget curl unzip mysql-client && \
    cd /tmp && \
    curl -O http://mirrors.163.com/debian/pool/main/r/rlwrap/rlwrap_0.37-3_amd64.deb > /dev/null 2>&1 && \
    curl -O https://deb.nodesource.com/node_0.10/pool/main/n/nodejs/nodejs_0.10.40-1nodesource1~wheezy1_amd64.deb > /dev/null 2>&1 && \
    dpkg -i *.deb && rm -rf *.deb && \
    wget http://dl.ghostchina.com/Ghost-0.7.4-zh-full.zip && \
    unzip Ghost-0.7.4-zh-full.zip -d /ghost && \
    rm -f Ghost-0.7.4-zh-full.zip && \
    cd /ghost && \
    npm install mysql && \
    npm install --production && \
    useradd ghost --home /ghost && \
    rm -rf /var/lib/apt/lists/* && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# Add files.
ADD run.sh /ghost-start
ADD config.js /config.js

# Set environment variables.
ENV NODE_ENV production

# Define mountable directories.
VOLUME ["/data", "/ghost-override"]

# Define working directory.
WORKDIR /ghost

# Define default command.
CMD ["bash", "/ghost-start"]

# Expose ports.
EXPOSE 80
