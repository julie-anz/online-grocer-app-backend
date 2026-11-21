# The Plant Based Grocer: Backend

The backend for a full-stack online supermarket web app, built with Node.js, Express and MySQL. It handles user accounts, the product catalog, shopping carts, checkout and an admin portal.

The front end is built with Angular. For the client code and screenshots of the app, see the [client repo](https://github.com/julie-anz/online-grocer-app-client).

## Features

- Login and registration with hashed passwords (bcrypt) and JWT authentication
- Separate shopper and admin roles. Only admins can add or edit products and upload images
- Shopping carts that only their owner can view or change
- Checkout with delivery-date limits (max 3 deliveries per day) and downloadable receipts
- Parameterized SQL queries to prevent SQL injection

## How to run

1. Install and start MySQL.
2. Create the database: `mysql -u root -p < server/setup.sql` (enter your MySQL root password when asked)
3. Install and start the server:
   ```bash
   npm install
   node server/index.js
   ```
   The API runs on http://localhost:3000.
4. Start the [client](https://github.com/julie-anz/online-grocer-app-client) and open http://localhost:4200.

The server connects to MySQL as `root` with password `password` by default. If yours differs, start it with `DB_USER=... DB_PASSWORD=... node server/index.js`. Set `JWT_SECRET` to use your own secret for signing login tokens.

### Demo accounts

| Role     | Email                        | Password        |
|----------|------------------------------|-----------------|
| Shopper  | `bob@bob.com`                | `bobspassword`  |
| Admin    | `cookies@monstercookies.com` | `chocolatechip` |
