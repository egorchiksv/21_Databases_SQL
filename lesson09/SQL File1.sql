SELECT * FROM myfirstdb.products;

CREATE VIEW CopyProducts AS
SELECT Price, ProductCount, Manufacturer
FROM Products
WHERE Manufacturer = "Apple";

SELECT * FROM CopyProducts;

-- Удаление виртуальной таблицы
DROP VIEW CopyProducts;

CREATE TABLE test
(
	Id INT,
    Count INT
);

-- Удаление физической таблицы

DROP TABLE test;

ALTER VIEW CopyProducts AS
SELECT Price, ProductCount, Manufacturer, ProductName
FROM Products
WHERE Manufacturer = "Apple";

SELECT * FROM CopyProducts;

ALTER TABLE test ADD COLUMN TestString VARCHAR(40);
SELECT * FROM test;
ALTER TABLE test DROP COLUMN TestString;
SELECT * FROM test;

/*
Задача:
Создайте представление, которое показывало бы всех заказчиков, имеющих самые высокие рейтинги. 
Привязке к таблице нет, колонки таблицы воображаемые.
*/
CREATE VIEW Highratings
	AS SELECT *
		FROM Custamers
        WHERE rating = 
			(SELECT MAX (rating)
            FROM Customers);