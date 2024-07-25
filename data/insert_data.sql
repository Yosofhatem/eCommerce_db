create database Company;
drop database company;
use Company;


CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(30) NOT NULL,
    Category VARCHAR(30) NOT NULL,
    Price DECIMAL(10, 2) CHECK (Price > 0),
    StockQuantity INT DEFAULT 0,
    INDEX(ProductName)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT CHECK (Quantity >= 0),
    UnitPrice DECIMAL(10, 2),
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
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


-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(255) NOT NULL,
    Location VARCHAR(255) NOT NULL,
    CONSTRAINT id_Department_unique UNIQUE (DepartmentID)
);

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    DepartmentID INT,
    HireDate DATE,
    Position VARCHAR(255) NOT NULL,
    Salary DECIMAL(10, 2) CHECK (Salary > 0),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    CONSTRAINT id_Employee_unique UNIQUE (EmployeeID)
);


-- Create Projects table
CREATE TABLE Projects (
    ProjectID INT AUTO_INCREMENT PRIMARY KEY,
    ProjectName VARCHAR(255) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Budget DECIMAL(10, 2)
);

-- Create Assignments table
CREATE TABLE Assignments (
    AssignmentID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    ProjectID INT,
    Role VARCHAR(255) NOT NULL,
    AssignmentDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
    ON DELETE CASCADE 
);


-- Insert data into Departments

INSERT INTO Departments (DepartmentName, Location) VALUES
('Human Resources', 'New York'),
('IT', 'San Francisco'),
('Finance', 'Chicago'),
('Marketing','New York'),
('Operations Management','Chicago');

-- Insert data into Employees
INSERT INTO Employees (FirstName, LastName, DepartmentID, HireDate, Position, Salary) VALUES
('Kamel', 'Mohamed', 1, '2020-01-01', 'HR Manager', 12200.00),
('Edward', 'Hanna', 1, '2019-03-15', 'Software Engineer', 8500.00),
('Alice', 'Brown', 2, '2017-07-22', 'Accountant', 5500.00),
('Maher', 'Ahmed', 2, '2018-09-12', 'Software Engineer', 8700.00),
('Anas', 'Khaled', 2, '2018-07-27', 'Software Engineer', 8600.00),
('Ahmed', 'Sami', 3, '2018-09-22', 'Accountant', 7500.00),
('Maha', 'Gamal', 3, '2020-11-01', 'Product Manager', 12200.00),
('Moaz', 'Khaled', 3, '2018-07-22', 'Software Engineer', 8000.00),
('Sara', 'Wael', 3, '2018-07-19', 'HR Manager', 12000.00),
('Anas', 'Ahmed', 3, '2019-01-09', 'Accountant', 6500.00),
('Moaz', 'Khaled', 4, '2018-07-22', 'Marketing Manager', 10500.00),
('Sama', 'Gamal', 4, '2018-07-19', 'HR Manager', 11000.00),
('Hani', 'Ahmed', 5, '2019-01-09', 'Accountant', 9800.00);


-- Insert data into Projects
INSERT INTO Projects (ProjectName, StartDate, EndDate, Budget) VALUES
('Project Alpha', '2021-01-01', '2021-12-31', 500000.00),
('Project Beta', '2022-06-01', '2022-07-31', 300000.00);

-- Insert data into Assignments
INSERT INTO Assignments (EmployeeID, ProjectID, Role, AssignmentDate) VALUES
(1, 1, 'Project Manager', '2021-01-01'),
(2, 1, 'Software Engineer', '2021-01-01'),
(3, 1, 'Accountant', '2021-06-01'),
(4, 1, 'Software Engineer', '2021-02-05'),
(5, 2, 'Software Engineer', '2022-06-20'),
(6, 2, 'Accountant', '2022-07-10'),
(7, 2, 'Product Manager', '2022-06-29'),
(8, 2, 'Analyst', '2022-06-17'),
(9, 2, 'Analyst', '2022-06-23'),
(10, 2, 'Analyst', '2022-07-11');



CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    CustomerName VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(20)NOT NULL,
    Email VARCHAR(200),
    Address VARCHAR(200)
);

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2) CHECK (TotalAmount >=0),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers (CustomerName, ContactNumber, Email, Address) VALUES
('David Green', '678-901-2345', 'david.green@example.com', '123 Birch St'),
('Emma Johnson', '789-012-3456', 'emma.johnson@example.com', '456 Spruce St'),
('Frank Miller', '890-123-4567', 'frank.miller@example.com', '789 Fir St'),
('Grace Lee', '901-234-5678', 'grace.lee@example.com', '321 Aspen St'),
('Hannah King', '012-345-6789', 'hannah.king@example.com', '654 Redwood St'),
('Alice Johnson', '555-123-4567', 'alice.johnson@example.com', '123 Main Street, Anytown, CA 12345'),
('Bob Smith', '555-987-6543', 'bob.smith@example.net', '456 Elm Street, Springfield, IL 62701'),
('Carol Davis', '555-222-3333', 'carol.davis@example.org', '789 Oak Avenue, Denver, CO 80202'),
('David Wilson', '555-444-5555', 'david.wilson@example.info', '1011 Pine Street, Austin, TX 78701'),
('Emily Brown', '555-666-7777', 'emily.brown@example.biz', '1213 Maple Lane, Seattle, WA 98101'),
('Frank Garcia', '555-888-9999', 'frank.garcia@example.co', '1415 Willow Drive, Chicago, IL 60601'),
('Gina Rodriguez', '555-111-2222', 'gina.rodriguez@example.io', '1617 Birch Court, New York, NY 10001'),
('Henry Lee', '555-333-4444', 'henry.lee@example.me', '1819 Cedar Way, Los Angeles, CA 90001'),
('Isabella Moore', '555-555-6666', 'isabella.moore@example.us', '2021 Redwood Road, San Francisco, CA 94101'),
('Jack Williams', '555-777-8888', 'jack.williams@example.net', '2223 Pine Street, Miami, FL 33101');


INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(14, '2023-10-26', 123.45), 
(7, '2023-10-27', 56.78), 
(1, '2023-10-28', 90.12), 
(1, '2023-10-29', 234.56), 
(14, '2023-10-30', 67.89), 
(4, '2023-10-31', 101.23), 
(9, '2023-11-01', 45.67), 
(12, '2023-11-02', 89.01), 
(5, '2023-11-03', 345.67), 
(4, '2023-11-04', 78.90), 
(11, '2023-11-05', 123.45), 
(12, '2023-11-06', 56.78), 
(7, '2023-11-07', 90.12), 
(2, '2023-11-08', 234.56), 
(9, '2023-11-09', 67.89), 
(1, '2023-11-10', 101.23), 
(3, '2023-11-11', 45.67), 
(1, '2023-11-12', 89.01), 
(13, '2023-11-13', 345.67), 
(11, '2023-11-14', 78.90), 
(7, '2023-11-15', 123.45), 
(8, '2023-11-16', 56.78), 
(9, '2023-11-17', 90.12), 
(3, '2023-11-18', 234.56), 
(12, '2023-11-19', 67.89), 
(5, '2023-11-20', 101.23), 
(2, '2023-11-21', 45.67), 
(10, '2023-11-22', 89.01), 
(15, '2023-11-23', 345.67), 
(15, '2023-11-24', 78.90);












