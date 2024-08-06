/*
Задача:
1. Используя СТЕ, выведите всех пользователей из таблицы users_profile
2. Используя СТЕ, подсчитайте количество активных пользователей. Задайте псевдоним релультирующему окну. Пример: Total Active Users
3. С помощью СТЕ реализуйте таблицу квадратов чилей от 1 до 10: (пример для чисел от 1 до 3) a: 1 2 3
																							 result: 1 4 9
*/
-- 1
WITH cte1 AS (
	SELECT * FROM users_profile)
SELECT * FROM cte1
WHERE username = 'admin';

-- 2
WITH cte_users AS (
	SELECT COUNT(*) AS total
    FROM users
    WHERE status = 'Active'
    GROUP BY status
    # HAVING
)
SELECT total AS 'total active' FROM cte_users;

-- 3
WITH RECURSIVE cte2 AS
(
	SELECT 1 AS a, a AS res
    UNION ALL
    SELECT a + 1, pow(a + 1, 2) AS res # pow возводит указанное первое число в степень указанную 2 числом
    FROM cte2
    WHERE a < 10
)
SELECT * FROM cte2; # Вызыв рекурсии