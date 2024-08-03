-- comment
# comment
/*
comment
comment
*/

/*
1. Получить список с информацией обо всех студентахalter

2. Получить список всех студентов с именем "Антон" (или любого существующего студента)

3. Вывести имя и назване курса из таблицки "Студент"

4*. Выбрать студентов, имя которых начинаются с буквы "А".
*/

USE seminar_1;

-- 1
SELECT * FROM student;

-- 2
SELECT * FROM student
WHERE name = 'anton';

-- 3
SELECT name, course_name FROM student;

-- 4
# % - любая подстрока. Galaxy S7, Galaxy S10, Galaxy S8s, Galaxy A10
# 'Galaxy S%' -> Galaxy S7, Galaxy S10, Galaxy S8s

# _ - любой символ. Galaxy S7, Galaxy S10, Galaxy S8s, Galaxy A10
# 'Galaxy S%' -> Galaxy S7

SELECT * FROM student
WHERE name LIKE 'A%';

SELECT * FROM student
WHERE name LIKE '%A%';

SELECT * FROM student
WHERE name LIKE '_A_';