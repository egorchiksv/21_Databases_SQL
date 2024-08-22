/*
2. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна 
возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
*/

DELIMITER //
CREATE FUNCTION hello() 
	RETURNS VARCHAR(15)
	DETERMINISTIC
BEGIN
DECLARE revert_back VARCHAR(15);
SELECT CASE 
	WHEN CURRENT_TIME >= '06:00:00' AND  CURRENT_TIME < '12:00:00' THEN 'Доброе утро'
	WHEN CURRENT_TIME >= '12:00:00' AND  CURRENT_TIME < '18:00:00' THEN 'Добрый день'
    WHEN CURRENT_TIME >= '18:00:00' AND  CURRENT_TIME < '00:00:00' THEN 'Добрый вечер'
	ELSE 'Доброй ночи'
END INTO revert_back;
RETURN revert_back;
END//
DELIMITER ;

SELECT hello();