USE seminar_2;

CREATE TABLE movies(
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AI UNIQUE
    title VARCHAR(50) NOT NULL,
    title_eng VARCHAR(50),
    year_movie YEAR NOT NULL,
    count_min INT,
    storyline TEXT
);

INSERT INTO movies (title, title_eng, year_movie, count_min, storyline)
VALUES
('Игры разума', 'A Beautiful Mind', 2001, 135, 'От всемирной известности до греховных глубин - все это познал на своей шкуре Джон Форбс Нэш-младший. Математический гений, он на заре совей карьеры сделал титаническую работу в области теории игр, которая перевернула этот раздел математики и практически принесла ему международную известность. Однако буквально в то же время заносчивый и пользующийся успехом у женщин Нэш получает удар судьбы, который переворачивает уже его собственную жизнь.'),
('Форрест Гамп', 'Forrest Gump', 1994, 142, 'sdfghsdfgsdfgsdfgsdfgsdfgsdfgsdfg'),
('Иван Васильевич меняет профессию', NULL, 1998, 128, 'zvczcvzcvzvczcvzxcvzxcvzxcvzcv'),
('Назад в будущее', 'Back to the Future', 1985, 116, 'lk;khjlhklhkjlhjklhjklhjklkjl'),
('Криминальное чтиво', 'Pulp Fiction', 1994, 154, null);

SELECT * FROM movies;

create table genres(
	id serial primary key,
    name varchar(100) not null
);

create table actors(
	id serial primary key,
    firstname varchar(100) not null,
    lastname varchar(100) not null
);

/*
Переимоновать сущность movies в cinema.
Добавить сущность cinema новый атрибут status_active (тип BIT) и атрибут genre_id после атрибута title_eng.
Удалить атрибут status_active сущности cinema.
Удалить сущность actors из базы данных
Добавить внешний ключ на атрибут genre_id сущность cinema и направить его на атрибут id сущности genres.
Очистить сущность genres от данных и обулить автоинкрементное поле.
*/

-- 1 Переимоновать сущность movies в cinema.
rename table movies to cinema;
-- 2 Добавить сущность cinema новый атрибут status_active (тип BIT) и атрибут genre_id после атрибута title_eng.
alter table cinema
add column status_active bit default b'1',
add genere_id bigint unsigned after title_eng;

/*
Можно было написать
alter table cinema
add column status_active bit default b'1';
alter table cinema
add column genere_id bigint unsigned after title_eng;
*/

select * from cinema;

-- 3 Удалить атрибут status_active сущности cinema.
alter table cinema
drop column status_active;

-- 4 Удалить сущность actors из базы данных
drop table actors;

-- 5 Добавить внешний ключ на атрибут genre_id сущность cinema и направить его на атрибут id сущности genres.
alter table cinema
add foreign key(genre_id) references genres(id);

show create table cinema;

-- 6 Очистить сущность genres от данных и обулить автоинкрементное поле.
truncate table genres;

alter table cinema
drop foreign key cinema_ibfk_1;

truncate table genres;

alter table cinema
add foreign key(genre_id) references genres(id)
on update cascade on delete set null;


-- Задание 3

create table studentMarks (
stud_id serial primary key,
total_marks int,
grade varchar(5));

insert into studentMarks(total_marks, grade)
values
(450, 'A'),
(480, 'A+'),
(490, 'A++'),
(440, 'B+'),
(400, 'C+'),
(380, 'C'),
(250, 'D'),
(200, 'E'),
(100, 'F'),
(150, 'F'),
(220, 'E');

select total_marks as 'оценки', grade,
	case grade
		when 'A++' then 'DISTINCTION'
        when 'A+' then 'FIRST CLASS'
        when 'A' then 'SECOND CLASS'
        when 'B+' then 'SECOND CLASS'
        when 'C+' then 'THIRD CLASS'
        else 'FAIL'
	end as class
from studentMarks;

select total_marks, grade,
	case
		when total_marks >= 450 then 'ПЕРВЫЙ КЛАСС С ОТЛИЧИЕМ'
        when total_marks >= 400 and total_marks < 450 then 'ПЕРВЫЙ КЛАСС'
		when total_marks between 350 and 400 then 'ВТОРОЙ КЛАСС'
        when total_marks between 300 and 350 then 'ТРЕТИЙ КЛАСС'
        else 'НЕУДАЧА'
	end as class
from studentMarks;


-- 5
SELECT IF(100 > 200, 'y', 'n');

SELECT total_marks, grade, 
IF(total_marks >= 450, 'Отлично', 'Хорошо') AS res
FROM studentMarks;
