WITH RECURSIVE sequence (n) AS
(
	SELECT 0
    UNION ALL
    SELECT n + 1
    FROM sequence
    WHERE n + 1 <= 10
)
SELECT n
FROM sequence;