/*
1. Создайте таблицу users_old, аналогичную таблице users. Создайте процедуру, с помощью которой можно переместить любого 
(одного) пользователя из таблицы users в таблицу users_old (использование транзакции с выбором commit или rollback – обязательно).
*/

USE hw6;

DROP TABLE IF EXISTS users_old;
CREATE TABLE users_old (
	id INT PRIMARY KEY auto_increment, 
    firstname varchar(30), 
    lastname varchar(30), 
    email varchar(30)
);

DELIMITER //
DROP PROCEDURE IF EXISTS move_user;
CREATE PROCEDURE  move_user (IN num_id INT) 
	DETERMINISTIC
BEGIN
INSERT INTO users_old (firstname,lastname,email) 
SELECT firstname, lastname, email 
	FROM users 
	WHERE users.id = num_id;
DELETE FROM users 
	WHERE id = num_id;
COMMIT;
END//
DELIMITER ;

CALL move_user(3);