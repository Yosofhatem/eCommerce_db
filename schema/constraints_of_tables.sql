-- Add constraints to Products table
ALTER TABLE Products
    ADD CONSTRAINT chk_price CHECK (Price > 0),
    ADD INDEX(ProductName);

-- Add constraints to Orders table
ALTER TABLE Orders
    ADD CONSTRAINT fk_customer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    ADD CONSTRAINT chk_total_amount CHECK (TotalAmount >= 0);

-- Add constraints to OrderDetails table
ALTER TABLE OrderDetails
    ADD CONSTRAINT fk_order FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    ADD CONSTRAINT fk_product FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    ADD CONSTRAINT chk_quantity CHECK (Quantity >= 0);

-- Add constraints to Employees table
ALTER TABLE Employees
    ADD CONSTRAINT fk_department FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    ADD CONSTRAINT chk_salary CHECK (Salary > 0);

-- Add constraints to Departments table
ALTER TABLE Departments
    ADD CONSTRAINT id_Department_unique UNIQUE (DepartmentID);

-- Add constraints to Assignments table
ALTER TABLE Assignments
    ADD CONSTRAINT fk_employee FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    ADD CONSTRAINT fk_project FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID) ON DELETE CASCADE;
