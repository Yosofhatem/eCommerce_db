create database eCommercestore;

use eCommercestore;

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(30) NOT NULL,
    Category VARCHAR(30) NOT NULL,
    Price DECIMAL(10, 2),
    StockQuantity INT DEFAULT 0
);

CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT CHECK (Quantity >= 0),
    UnitPrice DECIMAL(10, 2)
);



INSERT INTO Products (ProductName, Category, Price, StockQuantity) VALUES
('Laptop', 'Electronics', 800.00, 50),
('Smartphone', 'Electronics', 500.00, 100),
('Tablet', 'Electronics', 300.00, 75),
('Headphones', 'Accessories', 100.00, 200),
('Charger', 'Accessories', 20.00, 500);


INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 3, 2, 300.00),
(2, 2, 3, 500.00),
(3, 5, 1, 20.00),
(4, 1, 4, 800.00),
(5, 4, 2, 100.00),
(6, 3, 1, 300.00),
(7, 1, 2, 800.00),
(8, 5, 3, 20.00),
(9, 2, 1, 500.00),
(10, 4, 4, 100.00),
(11, 5, 3, 20.00),
(12, 1, 1, 800.00),
(13, 2, 2, 500.00),
(14, 4, 3, 100.00),
(15, 3, 1, 300.00);








