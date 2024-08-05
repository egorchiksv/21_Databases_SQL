CREATE TABLE test1
(
	Id INT,
    Name VARCHAR(45)
);

-- INSERT INTO
INSERT INTO test1 VALUES
(1, "Bob"), (2, "Tom"), (3, "Tim");

SELECT * FROM test1;

CREATE TABLE copy SELECT * FROM test1;
SELECT * FROM copy;