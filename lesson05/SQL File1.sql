USE myfirstdb;

SELECT *
FROM products
ORDER BY Price DESC;

-- DESC - сортировка по убыванию


-- COUNT
SELECT COUNT(*) AS count
FROM products;

-- TOP
# Указан только 1 параметр
SELECT * FROM products
LIMIT 5;
# LIMIT с 2 параметрами:
SELECT * FROM products
LIMIT 1,2;

-- SUM
SELECT SUM(Price) AS totalSum FROM products;

-- MIN, MAX
productsSELECT MIN(Price) 
FROM products
WHERE Manufacturer = 'Apple';

SELECT
	MIN(Price),
    MAX(Price),
    AVG(Price)
FROM products
WHERE Manufacturer = 'Samsung';

-- Задание
SELECT Manufacturer, COUNT(*) AS ProductName
FROM products
WHERE Price > 40000
GROUP BY Manufacturer;