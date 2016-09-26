var path = require('path'),
    config;

config = {

    production: {
        url: 'http://you_url',
        mail: {},
        database: {
            client: 'sqlite3',
            connection: {
                filename: path.join(__dirname, '/content/data/ghost.db')
            },
       	/*
       	database: {
            client: 'mysql',
            connection: {
                host     : 'host',
                port     : 'port',
                user     : 'user',
                password : 'password',
                database : 'database',
                charset  : 'utf8'
            },
            */
            debug: false
        },

        server: {
            host: '127.0.0.1',
            port: '2368'
        }
    }
};
module.exports = config;
