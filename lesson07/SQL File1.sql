USE myfirstdb;

CREATE TABLE Customers
(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    AccountSum DECIMAL
);
CREATE TABLE Employees
(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL
);

INSERT INTO Customers(FirstName, LastName, AccountSum)
VALUES
('Tom', 'Swith', 2000),
('Sam', 'Brown', 3000),
('Mark', 'Adams', 2500),
('Paul', 'Ins', 4200),
('John', 'Swith', 2800),
('Tim', 'Cook', 2800);

INSERT INTO Employees(FirstName, LastName)
VALUES
('Homer', 'Simpson'),
('Tom', 'Swith'),
('Mark', 'Adams'),
('Nick', 'Svensson');

SELECT FirstName, LastName
FROM Customers
UNION SELECT FirstName, LastName FROM Employees
ORDER BY FirstName DESC;

SELECT FirstName, LastName
FROM Customers
UNION ALL SELECT FirstName, LastName 
FROM Employees
ORDER BY FirstName;

SELECT FirstName, LastName, AccountSum + AccountSum * 0.1 AS TotalSum
FROM Customers WHERE AccountSum < 3000
UNION SELECT FirstName, LastName, AccountSum + AccountSum * 0.3 AS TotalSum
FROM Customers WHERE AccountSum >= 3000;