-- Задача 1

DROP DATABASE IF EXISTS seminar_6;
CREATE DATABASE seminar_6;
USE seminar_6;

-- Персонал
DROP TABLE IF EXISTS staff;
CREATE TABLE staff (
	id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(45),
    lastname VARCHAR(45),
    post VARCHAR(100),
    seniority INT,
    salary INT,
    age INT
);

-- Наполнение данными
INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', '40', 100000, 60),
('Петр', 'Власов', 'Начальник', '8', 70000, 30),
('Катя', 'Катина', 'Инженер', '12', 70000, 25),
('Саша', 'Сасин', 'Инженер', '40', 50000, 35),
('Иван', 'Иванов', 'Рабочий', '40', 30000, 59),
('Петр', 'Петров', 'Рабочий', '20', 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', '10', 20000, 35),
('Антон', 'Антонов', 'Рабочий', '8', 19000, 28),
('Юрий', 'Юрков', 'Рабочий', '5', 15000, 25),
('Максим', 'Максимов', 'Рабочий', '2', 11000, 22),
('Юрий', 'Галкин', 'Рабочий', '3', 12000, 24),
('Людмила', 'Маркина', 'Уборщик', '10', 10000, 49);

SELECT * FROM staff;

/*
1. Выведите все записи, отсортированные по полю "age" по возрастанию

2.Выведите все записи отсортированные по полю "firstname"

3. Выведите записи полей "firstname", "surname", "age", отсортированные по полю "firstname" в алфовитном порядке по убыванию

4. Выполните сортировку по полям "firstname" и "age" по убыванию
*/

-- 1
SELECT * FROM staff
ORDER BY age;

SELECT * FROM staff
ORDER BY age DESC;

-- 2
SELECT * FROM staff
ORDER BY firstname;

-- 3
SELECT firstname, lastname, age 
FROM staff
ORDER BY firstname DESC;

-- 4
SELECT * FROM staff
ORDER BY firstname DESC, age DESC;

/* Задача 2
1. Выведите униклаьные (непвторяющиеся значения "firstname"

2. Отсортируйте записи по возрастанию значений поля "id". Выведите первые две записи данной выборки

3. Отсортируйте записи по возрастанию поля "id". Пропустите первые 4 строки данной выборки и извлеките следующие 3

4. Отсортируйте записи по убыванию поля "id". Пропустите две строки данной выборки и извлеките за ними 3 строки
*/


-- 1 
SELECT DISTINCT firstname FROM staff;

-- 2
SELECT * FROM staff
ORDER BY id
LIMIT 2;

-- 3
SELECT * FROM staff
ORDER BY id
LIMIT 4, 3;

-- 4
SELECT * FROM staff
ORDER BY id DESC
LIMIT 2, 3;