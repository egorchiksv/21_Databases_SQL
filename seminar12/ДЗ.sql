-- 1. Подсчитать общее количество лайков, которые получили пользователи младше 12 лет.

SELECT COUNT(*) -- количество лайков
FROM likes l
JOIN media m ON l.media_id = m.id
JOIB profiles p ON p.user_id = m.user_id
WHERE TIMESTAMPDIFF(YEAR, p.birthday, NOW())<12;

-- 2. Определить кто больше поставил лайков (всего): мужчины или женщины.
SELECT COUNT(l.id) AS cnt, p.gender
FROM likes l
JOIN profiles p ON l.user_id = p.user_id
GROUP BY p.gender
ORDER BY cnt DESC;

-- 3. Вывести всех пользователей, которые не отправляли сообщения.
SELECT
	u.id,
    CONCAT(u.firstname, ' ', u.lastname) AS 'user'
FROM user ux
LEFT JOIN massages m ON u.id = m.from_user_id
WHERE m.id IS NULL;

-- 4. (по желанию)* ПУсть задан некторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех написал ему сообщений.
SELECT
	m.from_user_id,
    CONCAT(u.first, ' ', u.lastname) AS 'От кого',
    COUNT(*) AS cnt
FROM messages m
JOIN user u ON u.id = m.from_user_id
JOIN friend_request fr ON 	(fr.initiator_user_id = m.to_user_id AND fr.tarfet_user_id = m.from_user_id)
							OR
                            (fr.tarfet_user_id = m.to_user_id AND fr.initiator_user_id = m.from_user_id)
WHERE fr.status = 'approved' AND m.to_user_id = 1
GROUP BY m.from_user_id
ORDER BY cnt DESC
LIMIT 1;