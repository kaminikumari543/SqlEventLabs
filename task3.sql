CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES
(1, 'John', 'Smith', 'Sales', 50000, '2019-05-10'),
(2, 'Sara', 'Johnson', 'Marketing', 60000, '2020-03-15'),
(3, 'Michael', 'Scott', 'Sales', 45000, '2018-11-22'),
(4, 'Anna', 'Brown', 'IT', 75000, '2021-01-05'),
(5, 'David', 'Wilson', 'Sales', 55000, '2017-09-30');


-- 1. Select all columns
SELECT *
FROM Employees;

-- 2. Select specific columns
SELECT EmployeeID, FirstName, LastName, Department, Salary
FROM Employees;

-- 3. Apply WHERE, AND, OR, LIKE, BETWEEN
SELECT EmployeeID, FirstName, LastName, Department, Salary
FROM Employees
WHERE Department = 'Sales'                 
  AND Salary BETWEEN 40000 AND 60000       
  AND LastName LIKE 'S%'                   
  OR Department = 'Marketing';             

-- 4. Sort results
SELECT EmployeeID, FirstName, LastName, Department, Salary
FROM Employees
WHERE Department = 'Sales'
ORDER BY Salary DESC;   
