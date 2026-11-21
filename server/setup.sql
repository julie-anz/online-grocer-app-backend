-- Creates the 'market' database with all tables and demo data.
-- Run with: mysql -u root < server/setup.sql
--
-- Demo logins:
--   shopper: bob@bob.com / bobspassword
--   admin:   cookies@monstercookies.com / chocolatechip

DROP DATABASE IF EXISTS market;
CREATE DATABASE market;
USE market;
CREATE TABLE users(
 user_id INT, first_name VARCHAR(100) NOT NULL, last_name VARCHAR(100) NOT NULL,
 email VARCHAR(100) NOT NULL, password VARCHAR(100) NOT NULL, city VARCHAR(50), street VARCHAR(100),
 admin TINYINT(1) NOT NULL DEFAULT 0, PRIMARY KEY(user_id));
INSERT INTO users VALUES
 (222444888,'bob','marley','bob@bob.com','$2a$10$AlneRtJeQy5myIDz/mJrs.8QHJeYrsd8Y0pG.VKDByHUxtnd9KMmC','Brooklyn','3 pineapple avenue',0),
 (1112223333,'Sara','Collins','cookies@monstercookies.com','$2a$10$XVUr9UWkYmoJONwjDvkS8ONd.1V27TgTQy2vVrHNXmioMlJuVhWu.',null,null,1);
CREATE TABLE product_category(id INT AUTO_INCREMENT, category_name VARCHAR(100) NOT NULL, PRIMARY KEY(id));
INSERT INTO product_category(category_name) VALUES('fruits'),('vegetables'),('grains'),('legumes'),('plant milk'),('nuts & seeds'),('frozen produce');
CREATE TABLE products(product_id INT AUTO_INCREMENT, product_name VARCHAR(100) NOT NULL, category_id INT NOT NULL,
 price DECIMAL(13,2) NOT NULL, image VARCHAR(100) NOT NULL, PRIMARY KEY(product_id),
 FOREIGN KEY(category_id) REFERENCES product_category(id));
INSERT INTO products(product_name,category_id,price,image) VALUES
 ('almond milk',5,2.50,'almondMilk.jpg'),('frozen blueberries',7,3.99,'frozenBlueberries.jpg'),
 ('rolled oats',3,1.99,'rolledOats.jpg'),('brown rice',3,2.29,'rice.jpg');
CREATE TABLE shopping_cart(id INT AUTO_INCREMENT, user_id INT, cart_date DATE, PRIMARY KEY(id),
 FOREIGN KEY(user_id) REFERENCES users(user_id));
CREATE TABLE cart_item(item_id INT AUTO_INCREMENT, product_id INT, quantity INT, total_price DECIMAL(13,2), cart_id INT,
 PRIMARY KEY(item_id), FOREIGN KEY(product_id) REFERENCES products(product_id), FOREIGN KEY(cart_id) REFERENCES shopping_cart(id));
CREATE TABLE customer_orders(order_id INT AUTO_INCREMENT, customer_id INT, cart_id INT, cart_price DECIMAL(13,2),
 shipping_city VARCHAR(100), shipping_street VARCHAR(100), shipping_date DATE, cc_digits INT, PRIMARY KEY(order_id),
 FOREIGN KEY(customer_id) REFERENCES users(user_id), FOREIGN KEY(cart_id) REFERENCES shopping_cart(id));
ALTER TABLE customer_orders AUTO_INCREMENT=900;
