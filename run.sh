#!/bin/bash

VOLUME_HOME="/data"
G_CONF="$VOLUME_HOME/ghost/config.js"

echo "root:${ROOT_PASS}" | chpasswd

npm config set registry http://registry.cnpmjs.org
sed -i "s/localhost/$GHOST_URL/g" /etc/nginx/conf.d/ghost.conf

Ghost_Ver()
{
    if [[ ${GHOST_V} != *full ]]; then
    echo "=> Installing "npm install --production" ..."
    cd $VOLUME_HOME/ghost
    npm install --production
    echo "=> Done-ghost-version!"
    fi
}


if [[ ! -d $VOLUME_HOME/ghost ]]; then

    echo "=> Installing GHOST ..."
    cd $VOLUME_HOME
    curl -O http://dl.ghostchina.com/Ghost-${GHOST_V}.zip > /dev/null 2>&1
    unzip -q Ghost-${GHOST_V}.zip -d ghost/
    rm -rf *.zip
    Ghost_Ver
    cp -a /var/config.js $G_CONF
    StartMysql
    sed -i "s/you_url/$GHOST_URL/g" $G_CONF
else
    echo "=> Using an existing volume of GHOST"
fi

NODE_ENV=production forever start $VOLUME_HOME/ghost/index.js


