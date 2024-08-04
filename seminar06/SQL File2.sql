USE seminar_6;

DROP TABLE IF EXISTS employee_tbl;
CREATE TABLE employee_tbl (
	id_empt INT AUTO_INCREMENT PRIMARY KEY,
    id INT,
    name VARCHAR(45),
    work_date DATE,
    daily_typing_pages INT
);

INSERT INTO employee_tbl (id, name, work_date, daily_typing_pages)
VALUES
(1, 'John', '2007-01-24', 250),
(2, 'Ram', '2007-05-27', 220),
(3, 'Jack', '2007-05-06', 170),
(3, 'Jack', '2007-04-06', 100),
(4, 'Jill', '2007-04-06', 220),
(5, 'Zara', '2007-06-06', 300),
(5, 'Zara', '2007-02-06', 350);

/*
1. Рассчитайте общее количество всех страниц daily_typing_pages

2. Введите общее количество напечатанных страниц каждым человеком (с помощью предложения GROUP BY)

3. Посчитайте количество записей в таблице

4. Выведите количество имен, которые являются уникальными

5. Найдите среднее арифметическое по количеству ежедневных страниц для набора (daily_typing_pages)
*/

SELECT * FROM employee_tbl;

-- 1
SELECT SUM(daily_typing_pages) AS sum FROM employee_tbl;

-- 2 
SELECT name, SUM(daily_typing_pages) AS sum FROM employee_tbl
GROUP BY name;

-- 3
SELECT COUNT(*) FROM employee_tbl;

-- 4
SELECT COUNT(DISTINCT name) FROM employee_tbl;

-- 5
SELECT ROUND(AVG(daily_typing_pages), 2) AS 'среднее' FROM employee_tbl;