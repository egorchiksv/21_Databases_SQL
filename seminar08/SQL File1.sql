USE seminar_8;

CREATE TABLE members
(
member_id INT AUTO_INCREMENT,
name VARCHAR(100),
PRIMARY KEY (member_id)
);

CREATE TABLE committees
(
committee_id INT AUTO_INCREMENT,
name VARCHAR(100),
PRIMARY KEY (committee_id)
);

INSERT INTO members (name)
VALUES ("John"), ("Jane"), ("Wary"), ("David"), ("2melia");

INSERT INTO committees (name)
VALUES ("John"), ("Mary"), ("Amelial"), ("Joe");

/*
Выведите участников, которые также являются членами комитета, используйте INNER JOIN (пересечение 2 таблиц по имени)
*/

SELECT * FROM members;

SELECT * FROM committees;

SELECT m.member_id, m.name AS member, c.committee_id, c.name AS comit
FROM members m
INNER JOIN committees c
ON c.name = m.name;

/*
1. Выведител учатников, которые являются членами комитета (Используя LEFT JOIN, выполните соединение двух таблиц по полю "Имя")
2. Выведите участников, которые не являются членами комитета
*/

-- 1 
SELECT m.member_id, m.name, c.committee_id, c.name
FROM members m
LEFT JOIN committees c
USING(name);

-- 2
SELECT m.member_id, m.name, c.committee_id, c.name
FROM members m
LEFT JOIN committees c
USING(name)
WHERE c.committee_id IS NULL;

/*
1. Найти членов комитета, которых нет в members с помощью RIGHT JOIN
2. Выполинить RIGHT JOIN между 2 таблицами по полю "Имя"
*/

-- 1
SELECT m.member_id, m.name, c.committee_id, c.name
FROM members m
RIGHT JOIN committees c
USING(name)
WHERE m.member_id IS NULL;

-- 2
SELECT m.member_id, m.name, c.committee_id, c.name
FROM members m
RIGHT JOIN committees c
USING(name);

-- CROSS JOIN
SELECT m.member_id, m.name, c.committee_id, c.name
FROM members m
CROSS JOIN committees c;

/*
UNION и UNION ALL

1. Получить список пользователей и клиентов, удалив одинаковых клиентов и пользователей
2. Получить список пользователей и клиентов. Дубликаты удалять не нужно.
*/

-- 1 Если необходимо удалить дубликаты используем UNION без ALL
SELECT * FROM users
UNION
SELECT * FROM clients;

-- 2 Если необходимо не удалять дубликаты используем UNION с ALL
SELECT * FROM users
UNION ALL
SELECT * FROM clients;

/*
1. Проверить, присутствует ли буква "А" в последовательности 'A', 'B', 'C', 'D'
2. Проверить, присутствует ли буква "Z" в последовательности 'A', 'B', 'C', 'D'
3. Получить столбцы из таблицы "clients", в которых первое имя является набором значений.
4. Выберите все логины из таблицы "users", кроме "Mikle".
*/

-- 1 
SELECT 'A' IN ('A', 'B', 'C', 'D');

-- 2 
SELECT 'Z' IN ('A', 'B', 'C', 'D');

-- 3
SELECT * FROM clients
WHERE login IN ('Mikle', 'Tom', 'Masha');

-- 4
SELECT login FROM users
WHERE 'Mikle' NOT IN (login);

/*
1. Получите из таблицы "Сотрудника" только тех сотрудников, которые в данный момент работают над любым из активных проектов.
2. Проверьте, существует ли сотрудник с идентификатором 1004 в таблице сотрудников или нет.
*/

-- 1 
SELECT * FROM Employee
WHERE EXISTS (SELECT * FROM Projects
WHERE Employee.id = Projects.EmployeeID);

-- 2
SELECT EXISTS (SELECT * FROM Employee WHERE id = 1004) AS res;

SELECT EXISTS (SELECT * FROM Employee WHERE id = 900) AS res;