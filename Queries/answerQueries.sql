-- Active: 1719520043435@@127.0.0.1@3306@company
-- Question 1 

SELECT UPPER(e.FirstName) AS FirstName, LOWER(e.LastName) AS LastName, 
LENGTH(e.Position) AS Postion_Length,d.DepartmentName 
FROM employees AS e INNER JOIN departments AS d
ON e.DepartmentID = d.DepartmentID;



-- Question 2
SELECT d.DepartmentName , ROUND(SUM(e.Salary) ,-3) AS Total_Salary
, count(EmployeeID) AS NO_of_employees
FROM employees AS e INNER JOIN departments AS d
ON e.DepartmentID = d.DepartmentID
GROUP BY DepartmentName;


-- Question 3
SELECT UPPER(p.ProjectName) AS Project_Name , 
CONCAT_WS(' ',e.FirstName,e.LastName) AS Employee_Name
FROM projects AS p INNER JOIN assignments AS a
ON p.ProjectID = a.ProjectID 
INNER JOIN employees AS e 
ON e.EmployeeID = a.EmployeeID ;


-- Question 4
SELECT LOWER(c.CustomerName) AS CustomerName, COUNT(o.OrderID) AS No_of_orders, 
SUM(O.TotalAmount) AS Total_Amount
FROM customers AS c INNER JOIN orders AS o
ON c.CustomerID = o.CustomerID
GROUP BY CustomerName;


-- Question 5
SELECT LEFT(p.ProductName,10) AS ProductName 
, LEFT(p.ProductName, 2) AS ProductCategory
, SUM(od.Quantity) AS Total_Quantity
FROM products AS p INNER JOIN orderdetails AS od
ON p.ProductID = od.ProductID
GROUP BY ProductName;



-- Question 6
DELIMITER $$
CREATE PROCEDURE Get_high_salaries()
BEGIN
SELECT CONCAT_WS(' ',e.FirstName,e.LastName) AS Employee_Name
,e.Salary , d.DepartmentName 
FROM employees AS e INNER JOIN departments AS d
ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > (
    SELECT  AVG(salary) FROM employees
    GROUP BY DepartmentID
    HAVING DepartmentID =d.DepartmentID
);
END$$
DELIMITER ;

CALL Get_high_salaries();



-- Additional Questions
# 1

DELIMITER $$
CREATE FUNCTION CheckSalary(Employee_ID INT) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE avgSalary DECIMAL(10,2);
    
    SELECT AVG(Salary) INTO avgSalary 
    FROM Employees 
    WHERE DepartmentID = (SELECT DepartmentID FROM Employees WHERE EmployeeID = Employee_ID);

    IF (SELECT Salary FROM Employees WHERE EmployeeID = Employee_ID) > avgSalary THEN
        RETURN 'Higher than';
    ELSE
        RETURN 'Lower than';
    END IF;
END $$
DELIMITER ;

SELECT 
    CONCAT_WS(' ', e.FirstName, e.LastName) AS Employee_Name,
    e.Salary,
    d.DepartmentName,
    CheckSalary(e.EmployeeID) AS SalaryComparison
FROM Employees AS e INNER JOIN Departments AS d 
ON e.DepartmentID = d.DepartmentID;


# 2

DELETE FROM projects WHERE ProjectID IN (
    SELECT ProjectID FROM assignments WHERE EmployeeID IN (
        SELECT EmployeeID FROM employees WHERE DepartmentID IN (
            SELECT DepartmentID FROM departments WHERE DepartmentName = 'IT'
        )
    )
);


# 3

SELECT CONCAT_WS(' ', FirstName, LastName) AS Employee_Name
FROM employees 
WHERE DepartmentID = (
    SELECT DepartmentID FROM departments WHERE DepartmentName = 'IT'
);




