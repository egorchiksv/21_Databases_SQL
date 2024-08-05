USE myfirstdb;

CREATE TABLE Products1
(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(30) NOT NULL,
    Manufacturer VARCHAR(20) NOT NULL, ProductCount INT DEFAULT 0,
    Price DECIMAL NOT NULL
);

CREATE TABLE Customers1
(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL
);

CREATE TABLE Orders1
(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT NOT NULL,
	CustomerId INT NOT NULL,
    CreatedAt DATE NOT NULL,
    ProductCount INT DEFAULT 1,
    Price DECIMAL NOT NULL,
    FOREIGN KEY (ProductId) REFERENCES Products(Id) ON DELETE CASCADE,
    FOREIGN KEY (CustomerId) REFERENCES Customers(Id) ON DELETE CASCADE
);

SELECT Orders1.CreatedAt, Orders1.ProductCount, Products1.ProductName
FROM Orders1
JOIN Products1 ON Products1.Id = Orders1.ProductId;