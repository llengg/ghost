var path = require('path'),
    config;

config = {

    production: {
        url: 'http://you_url',
        mail: {},
       /*
        database: {
            client: 'sqlite3',
            connection: {
                filename: path.join(__dirname, '/content/data/ghost.db')
            },
       	    */
       	database: {
            client: 'mysql',
            connection: {
                host     : '10.10.32.51',
                port     : '3306',
                user     : 'uaxjIcJgP5s16fQ7',
                password : 'ppFkldAh7VuGMg04T',
                database : 'g2jRMkpnxVoXFmAl',
                charset  : 'utf8'
            },
            
            debug: false
        },

        server: {
            host: '0.0.0.0',
            port: '80'
        }
    }
};
module.exports = config;
