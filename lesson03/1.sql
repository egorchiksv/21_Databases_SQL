USE myfirstdb;

-- CREATE TABLE - создает базу данныхalter
CREATE TABLE Custumer
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    Age INT,
    FirstName VARCHAR(20),
    LastName VARCHAR(20)
);

SELECT * FROM Custumer;