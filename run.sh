#!/bin/bash

VOLUME_HOME="/data"
G_CONF="$VOLUME_HOME/ghost/config.js"

npm config set registry http://registry.cnpmjs.org
sed -i "s/localhost/$GHOST_URL/g" /etc/nginx/conf.d/ghost.conf

cd /data/ghost/
NODE_ENV=${NODE_ENV:-production} npm start


