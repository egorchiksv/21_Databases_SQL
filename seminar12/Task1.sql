-- Транзакции

INSERT INT user (firstname, lastname, email)
VALUES ('Дмитрий', 'Дмитриев', ''dima@mail.ru);

SET @last_user_id = last_insert_id();

INSERT INTO profiles (user_id, hometown, birthday, photo_id)
VALUES (@last_user_id, 'Moscow', '1999-10-10', NULL);

COMMIT; -- применить изменения
-- ROLLBACK; -- отменить изменения