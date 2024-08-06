/*
Задача:
Найти второй отдел во всех банках по количеству ревизий:

SELECT MAX(count_revisions) ms
FROM Table_Rev
WHERE count_revisions!=(SELECT MAX(count_revisions)
FROM Table_Rev)

Но если речь идет не про второй отдел, а про третий?
Уже сложнее. Именно поэтому, попробуйте воспользоваться оконной функцией
*/

WITH T_R AS
(
SELECT *, DENSE_RANK() OVER(PARTITION BY tb
ORDER BY count_revisions) ds
FROM Table_Rev
)
SELECT tb, dep, count_revisions
FROM T_R
WHERE ds=1;


-- Оконные функции смещения
SELECT *,
LEAD (Event, 1, 'end') OVER (PARTITION BY ID_Task
ORDER BY Data_Event) as Next_Event, 
LEAD (Date_Event, 1, '2099-01-01') OVER(PARTITON BY 
ID_Task ORDER BY Data_Event) as Next_Date
FROM Table_Task;
