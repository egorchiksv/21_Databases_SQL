USE seminar_6;

CREATE TABLE employee_salary (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45),
    age INT,
    salary INT
);

INSERT INTO employee_salary (name, age, salary)
VALUES
('Дима', 23, 100),
('Петя', 23, 200),
('Вася', 23, 300),
('Коля', 24, 1000),
('Иван', 24, 2000),
('Паша', 25, 700);

SELECT * FROM employee_salary;

/*
1. Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). Для каждой группы найдите суммарную зарплату

2. Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). Найдите максимальную зароботную плату внутри группы

3. Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). Найдите минимальную зароботную плату внутри группы
*/

-- 1
SELECT age, SUM(salary) FROM employee_salary
GROUP BY age;

-- 2
SELECT age, MAX(salary) FROM employee_salary
GROUP BY age;

-- 3
SELECT age, MIN(salary) FROM employee_salary
GROUP BY age;

/*
1. Выведите только те строки, в которых суммарная зарплата больше или равна 1000
2. Выведите только те группы, в которых количество строк меньше или равно двум
3. Вывдите только те группы, в которых количетво строк меньше или равно двум.
Для решения используй оператор "BETWEEN"
4.* Выветиде только те группы, в которых количество строк меньше или равно двум. Для решения используй оператор "IN"
*/

-- 1
SELECT age, SUM(salary) AS sum
FROM employee_salary
GROUP BY age
HAVING sum >= 1000;

-- 2
SELECT age, COUNT(*) AS count
FROM employee_salary
GROUP BY age
HAVING count <= 2;

-- 3
SELECT age, COUNT(*) AS count
FROM employee_salary
GROUP BY age
HAVING count BETWEEN 0 AND 2;

-- 4
SELECT age, COUNT(*) AS count
FROM employee_salary
GROUP BY age
HAVING count IN(0, 1, 2);