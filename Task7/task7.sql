-- Drop if already exists (SQL Server)
IF OBJECT_ID('Orders', 'U') IS NOT NULL DROP TABLE Orders;
IF OBJECT_ID('Customers', 'U') IS NOT NULL DROP TABLE Customers;
-- Create tables and insert data
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50)
);
GO

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2)
);
GO

-- Insert data
INSERT INTO Customers VALUES (1, 'Amit Sharma', 'Delhi');
INSERT INTO Customers VALUES (2, 'Priya Verma', 'Mumbai');
INSERT INTO Customers VALUES (3, 'Rahul Mehta', 'Bangalore');
GO

INSERT INTO Orders VALUES (101, 1, '2025-08-01', 1200.50);
INSERT INTO Orders VALUES (102, 1, '2025-08-05', 750.00);
INSERT INTO Orders VALUES (103, 2, '2025-08-02', 2300.75);
INSERT INTO Orders VALUES (104, 3, '2025-08-10', 1500.00);
INSERT INTO Orders VALUES (105, 3, '2025-08-12', 1800.00);
GO

-- Now CREATE VIEW (must be first in batch)
CREATE VIEW CustomerOrderSummary AS
SELECT 
    c.CustomerID,
    c.CustomerName,
    c.City,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(o.TotalAmount) AS TotalSpent,
    AVG(o.TotalAmount) AS AvgOrderValue
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName, c.City;
GO
SELECT * FROM CustomerOrderSummary;

----Abstraction View
GO
CREATE VIEW CustomerPurchaseSummary
AS
SELECT 
    c.CustomerID,
    c.CustomerName,
    c.City,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(o.TotalAmount) AS TotalSpent,
    AVG(o.TotalAmount) AS AvgOrderValue
FROM Customers c
LEFT JOIN Orders o 
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName, c.City;
GO







