#
# Ghost Dockerfile
#
# https://github.com/dockerfile/ghost
#

# Pull base image.
FROM dockerfile/nodejs

# Install Ghost
RUN apt-get update && \
	apt-get -y install mysql-client && \
	cd /tmp && \
	wget http://dl.ghostchina.com/Ghost-0.7.4-zh-full.zip && \
	unzip Ghost-0.7.4-zh-full.zip -d /ghost && \
	rm -f Ghost-0.7.4-zh-full.zip && \
	cd /ghost && \
	npm config set registry http://registry.cnpmjs.org && \
	npm install mysql && \
	npm install --production && \
	sed 's/127.0.0.1/0.0.0.0/' /ghost/config.example.js > /ghost/config.js && \
	sed 's/2236/80/' /ghost/config.example.js > /ghost/config.js && \
	useradd ghost --home /ghost && \
	rm -rf /var/lib/apt/lists/* && \
	cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# Add files.
ADD start.bash /ghost-start

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
