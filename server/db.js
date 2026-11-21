const mysql = require('mysql');

// Database settings. Can override with env vars.
const config = {
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || '',
    database: process.env.DB_NAME || 'market'
};

function openDb(app) {
    return new Promise((resolve, reject) => {
        const conn = mysql.createConnection(config);
        conn.connect(err => {
            if (err) return reject(err);
            app.set('CONNECTION', conn);
            resolve(true);
        });
    });
}

module.exports = { openDb };
