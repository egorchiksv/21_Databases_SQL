/* Задача:
Собрать дэшборд, в котором содержится информация о максимальной задолжности в каждом банке, а также средний размер 
процентной ставки в каждом банке в заваисимости от сегмента и количества договоров всего по всем банкам
*/

SELECT TB, ID_CLIENT, ID_DOG, OSZ, PROCENT_RATE, RAITTING, SEGMENT,
	MAX(OSZ) OVER(PARTITION BY TB) AS 'максимальной задолжности в каждом банке',
	AVG(PROCENT_RATE) OVER(PARTITION BY TB, SEGMENT) AS 'средний размер процентной ставки',
	COUNT(ID_DOG) OVER () 'количества договоров'
FROM table1;

/*
Проранжируем таблицу по убыванию количества ревизий
*/

SELECT *,
	ROW_NUMBER() OVER(ORDER BY count_revisions DESC),
    RANK() OVER(ORDER BY count_revisions DESC),
    DENSE_RANK() OVER(ORDER BY count_revisions DESC), 
    NTILE(3) OVER(ORDER BY count_revisions DESC)
FROM table1;