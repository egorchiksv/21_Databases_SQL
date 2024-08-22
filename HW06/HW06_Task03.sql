/*
3. (по желанию)* Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, communities и 
messages в таблицу logs помещается время и дата создания записи, название таблицы, идентификатор первичного ключа.
*/

USE hw6;

DROP TABLE IF EXISTS logs;

CREATE TABLE logs (
    created_datetime DATETIME DEFAULT now(),
    table_name VARCHAR(50) NOT NULL,
    primarykey_id INT UNSIGNED NOT NULL
)  ENGINE=ARCHIVE;

CREATE 
    TRIGGER  users_logs
 AFTER INSERT ON users FOR EACH ROW 
    INSERT INTO logs SET table_name = 'users' , primarykey_id = NEW.id;

CREATE 
    TRIGGER  communities_logs
 AFTER INSERT ON communities FOR EACH ROW 
    INSERT INTO logs SET table_name = 'communities' , primarykey_id = NEW.id;

CREATE 
    TRIGGER  messages_logs
AFTER INSERT ON messages FOR EACH ROW 
    INSERT INTO logs SET table_name = 'messages' , primarykey_id = NEW.id;