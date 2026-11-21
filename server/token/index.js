const jwt = require('jsonwebtoken');

const JWT_SECRET = process.env.JWT_SECRET || 'local-dev-secret';

function authenticateToken(req, res, next) {
    const bearerHeader = req.headers.authorization //.split(" ")[1];

    if (typeof bearerHeader !== 'undefined') {
        const token = bearerHeader.split(" ")[1];

        if (token == null) return res.status(401).json({ state: 'error', message: 'token not found' });

        jwt.verify(token, JWT_SECRET, (err, authUser) => {
            if (err) {
                res.status(403).json({ state: 'error', message: 'invalid token' });
            } else {
                console.log(authUser);
                req.authUser = authUser;
                next();

            }
        }) 
    }else { res.status(403).json({state: 'error', message: 'forbidden'})}
}


module.exports = authenticateToken;
module.exports.JWT_SECRET = JWT_SECRET;
