SELECT * FROM product;

SELECT CONCAT(FirstName,"  " , LastName) AS FullName from employees;

SELECT DISTINCT Name AS product_Name FROM product;

SELECT Name AS product_name, price_per_unit FROM product WHERE price_per_unit < 1000;

SELECT Name, price_per_unit FROM product ORDER BY Name asc;

SELECT EmailID FROM employees WHERE FirstName LIKE '%ahu%' OR LastName LIKE '%sal%';

SELECT Name, price_per_unit FROM product ORDER BY Name asc;

SELECT lower(email) FROM authentication; 

SELECT * FROM product WHERE Name like "Toy_";

SELECT * FROM product WHERE Name IN ('Toy Car', 'Voltas', 'LG');

SELECT * FROM product WHERE price_per_unit BETWEEN 100 AND 200;

SELECT P.Name, R.Review FROM product AS P, Reviews as R WHERE P.product_ID = R.ProductID;

SELECT Name FROM product ORDER BY Name;

SELECT S.Seller_ID, S.First_Name, P.Name FROM product AS P, Sellers as S WHERE P.Seller_ID = S.Seller_ID;

SELECT P.Name, R.Review FROM product as P LEFT JOIN Reviews as R ON P.product_ID = R.ProductID;

SELECT Review FROM Reviews WHERE ProductID in (SELECT product_ID FROM product WHERE Quantity > 10);

SELECT A.email, C.FirstName FROM authentication as A INNER JOIN customers as C ON A.email=C.email;

SELECT P.Name, AVG(R.Review) FROM product as P LEFT JOIN Reviews as R ON P.product_ID = R.ProductID GROUP BY P.Name HAVING AVG(R.Review) > 3.0;

SELECT Name FROM product LIMIT 5;

SELECT Code, CASE WHEN IsUsed = false THEN Code ELSE 'Expired' END FROM coupon;

SELECT P.Name, C.Quantity FROM product as P, cartItem as C WHERE P.product_ID = C.ProductID AND C.Quantity > 10;

SELECT P.Name, P.Quantity AS available_quantity, C.Quantity AS ordered_quantity FROM product as P, cartItem as C WHERE P.product_ID = C.ProductID AND C.Quantity = (SELECT MAX(Quantity) FROM cartItem);

SELECT Bill_ID FROM bill WHERE Delivery_Date < '2020-01-01';

SELECT * FROM coupon WHERE IsUsed = "no" AND Code>2000;

SELECT Code FROM coupon WHERE NOT IsUsed = "no";

SELECT P.Name FROM product AS P, Reviews as R WHERE P.product_ID = R.ProductID AND R.Review IS NOT NULL;

SELECT Debit_Card_Number,Debit_Card_Holder FROM seller WHERE Debit_Card_Number IS NOT NULL OR Debit_Card_Holder IS NOT NULL; 

SELECT P.Name, R.Review FROM product as P INNER JOIN Reviews as R ON P.product_ID = R.ProductID ORDER BY R.Review DESC;

SELECT product_ID FROM order_item INNER JOIN orders ON order_item.Order_ID = orders.Order_ID;

SELECT Billing_ID, SUM(order_item.price) FROM orders INNER JOIN order_item ON orders.Order_ID = order_item.Order_ID;

SELECT email FROM customers UNION SELECT email FROM sellers ORDER BY email;

SELECT ProductID, COUNT(Quantity) FROM cartItem GROUP BY ProductID HAVING COUNT(Quantity) > 0 ORDER BY COUNT(Quantity) DESC;

SELECT First_Name FROM sellers WHERE EXISTS (SELECT Name FROM product WHERE product.Seller_ID = sellers.Seller_ID AND product.price_per_unit >=100);

SELECT Name FROM product WHERE product_ID = ANY (SELECT ProductID FROM cartItem WHERE Quantity > 0);

SELECT Name FROM product WHERE product_ID = ANY (SELECT ProductID FROM cartItem WHERE Quantity > 0);

SELECT Name, Brand, 
CASE
    WHEN Quantity > 1 THEN 'Available'
    WHEN Quantity = 1 THEN 'Only 1 piece left'
    ELSE 'Sold Out'
END AS product_status
FROM product;

SELECT Name, price_per_unit - IFNULL(Discount, 0) FROM product;

SELECT Name, COALESCE(Product_Image, '') FROM product;

-- CREATE PROCEDURE FetchAllProducts AS SELECT * FROM product GO;

-- EXEC FetchAllProducts;

CREATE DATABASE midProject;

DROP DATABASE midProject;

-- TRUNCATE TABLE authentication;

-- ALTER TABLE product DROP COLUMN email;

-- CREATE TABLE authentication (
--     email varchar(255) NOT NULL,
--     password varchar(255) NOT NULL,
--     CONSTRAINT CHK_Password CHECK (password>=6)
-- );

INSERT INTO reviews (ProductID) SELECT product_ID FROM product;
















CREATE VIEW Mobile AS SELECT * FROM product WHERE category = 'mobile';






CREATE OR REPLACE VIEW Delhiite AS SELECT FirstName, LastName, State FROM customers WHERE State = 'delhi';

SELECT * FROM Delhiite;

DROP VIEW Delhiite;

DROP VIEW mobile;

CREATE USER 'pavitralocalhost1' IDENTIFIED WITH mysql_native_password BY 'password';

GRANT ALL PRIVILEGES ON database_name.* TO 'pavitralocalhost1';

SHOW GRANTS;

GRANT INSERT ON sellers TO pavitralocalhost1;

REVOKE INSERT ON sellers FROM pavitralocalhost1;