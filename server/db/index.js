const mysql = require('mysql');

let conn;


function openDb(app) {
    return new Promise((resolve, reject) => {
        conn = mysql.createConnection({
            host: process.env.DB_HOST || 'localhost',
            user: process.env.DB_USER || 'root',
            password: process.env.DB_PASSWORD || 'password',
            database: process.env.DB_NAME || 'market'
        });

        conn.connect( err => {
            if (err) {
                conn.end();
                reject(err);
            } else {
                console.log('db connected');
                app.set('CONNECTION', conn);
                resolve(true);
            }
        });
    });
}


module.exports = { openDb }; 
