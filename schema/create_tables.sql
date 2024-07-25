DROP DATABASE IF EXISTS eCommerce;

CREATE DATABASE IF NOT EXISTS eCommerce;

Use eCommerce;

-- Create Products table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(30) NOT NULL,
    Category VARCHAR(30) NOT NULL,
    Price DECIMAL(10, 2),
    StockQuantity INT DEFAULT 0
);

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(20) NOT NULL,
    Email VARCHAR(200),
    Address VARCHAR(200)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2)
);

-- Create OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2)
);

-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(255) NOT NULL,
    Location VARCHAR(255) NOT NULL
);

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    DepartmentID INT,
    HireDate DATE,
    Position VARCHAR(255) NOT NULL,
    Salary DECIMAL(10, 2)
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
    AssignmentDate DATE
);