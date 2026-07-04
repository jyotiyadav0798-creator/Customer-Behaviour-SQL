Create database customerbehaviour1

CREATE TABLE Products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price INT
);

CREATE TABLE Sales(
    sale_id INT IDENTITY(1,1),
    user_id INT,
    product_id INT,
    created_date DATE
);

INSERT INTO Products VALUES
(1,'iPhone 15',80000),
(2,'Samsung Galaxy S24',75000),
(3,'Dell Laptop',65000),
(4,'HP Laptop',60000),
(5,'Apple Watch',35000),
(6,'Sony Headphones',15000),
(7,'Bluetooth Speaker',5000),
(8,'Gaming Keyboard',4000),
(9,'Wireless Mouse',1500),
(10,'Power Bank',2000),
(11,'Tablet',30000);

INSERT INTO Sales(user_id,product_id,created_date)
VALUES
(1,1,'2019-01-15'),
(1,5,'2019-02-10'),
(1,3,'2019-03-05'),

(2,7,'2018-05-10'),
(2,2,'2018-06-15'),
(2,9,'2018-07-01'),

(3,1,'2019-04-10'),
(3,6,'2019-05-12'),
(3,4,'2019-06-18'),

(4,8,'2018-01-22'),
(4,2,'2018-02-12'),
(4,11,'2018-03-30'),

(5,6,'2019-01-05'),
(5,5,'2019-02-14'),
(5,1,'2019-03-28'),

(6,7,'2018-11-10'),
(6,3,'2018-12-12'),
(6,2,'2019-01-15'),

(7,5,'2019-07-01'),
(7,1,'2019-07-10'),
(7,6,'2019-08-15'),

(8,8,'2018-10-05'),
(8,9,'2018-10-15'),
(8,2,'2018-11-10'),

(9,6,'2019-01-15'),
(9,1,'2019-02-20'),
(9,4,'2019-03-25'),

(10,3,'2018-07-18'),
(10,11,'2018-08-21'),
(10,8,'2018-09-05'),

(1,1,'2020-01-01'),
(2,5,'2020-02-15'),
(3,6,'2020-03-20'),
(4,7,'2020-04-10'),
(5,1,'2020-05-18'),
(6,8,'2020-06-25'),
(7,6,'2020-07-14'),
(8,3,'2020-08-22'),
(9,5,'2020-09-01'),
(10,1,'2020-10-15');

CREATE TABLE Users(
    user_id INT PRIMARY KEY,
    signup_date DATE
);
INSERT INTO Users VALUES
(1,'2015-01-10'),
(2,'2015-03-15'),
(3,'2015-05-20'),
(4,'2016-01-12'),
(5,'2016-04-25'),
(6,'2016-08-30'),
(7,'2017-02-10'),
(8,'2017-02-10'),
(9,'2018-06-18'),
(10,'2018-06-18');

CREATE TABLE User_Name(
    user_id INT,
    user_name VARCHAR(50)
);
INSERT INTO User_Name VALUES
(1,'Amit'),
(2,'Priya'),
(3,'Rahul'),
(4,'Neha'),
(5,'Karan'),
(6,'Pooja'),
(7,'Vikas'),
(8,'Anjali'),
(9,'Rohit'),
(10,'Sneha');

CREATE TABLE GoldUsers_Signup(
    user_id INT,
    gold_signup_date DATE
);

INSERT INTO GoldUsers_Signup VALUES
(1,'2019-01-10'),
(3,'2019-03-15'),
(5,'2018-11-20'),
(7,'2019-06-05'),
(9,'2018-12-01');

SELECT * FROM Products;
SELECT * FROM Sales;
SELECT * FROM Users;
SELECT * FROM User_Name;
SELECT * FROM GoldUsers_Signup;


SELECT
    p.product_name,
    SUM(p.price) AS Total_Revenue
FROM Sales s
INNER JOIN Products p
ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY Total_Revenue DESC;

SELECT TOP 3
    p.product_name,
    SUM(p.price) AS Total_Revenue
FROM Sales s
INNER JOIN Products p
ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY Total_Revenue DESC;

SELECT
    (SELECT COUNT(*) FROM Users) AS Total_Users,
    (SELECT COUNT(*) FROM GoldUsers_Signup) AS Gold_Members;


SELECT
    SUM(p.price) AS Revenue_From_Gold_Users
FROM Sales s
INNER JOIN GoldUsers_Signup g
    ON s.user_id = g.user_id
INNER JOIN Products p
    ON s.product_id = p.product_id

