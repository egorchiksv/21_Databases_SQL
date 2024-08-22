/*Создание таблицы users*/
USE hw6;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY AUTO_INCREMENT, 
    firstname VARCHAR(30),
    lastname VARCHAR(30),
    email VARCHAR(30) UNIQUE
);

INSERT INTO users (firstname, lastname, email) VALUES 
('Олег', 'Коростиль', 'korostil_oleg@mail.ru'),
('Андрей', 'Петропавловских', 'petrop_andrey@yandex.ru'),
('Егор', 'Саратов', 'saratov_egor@gmail.com'),
('Уткин', 'Максим', 'donald@mail.ru'),
('Эмиль', 'Абдюшев', 'abdushev_emil@yandex.ru'),
('Аввакумов', 'Сергей', 'avvakum-ser11@example.net'),
('Колокольников', 'Андрей', 'andrey_kolokol@example.com');