--1. Identify Key Entities

--From a retail sales dataset, typical entities are:

--Products (Product details)

--Customers (Customer details)

--Orders (Each purchase transaction)

--Payments (How each order was paid)
--3. Normalize to 3NF

--Customers → CustomerID is the primary key.

--Products → ProductID is the primary key.

--Orders → Linked to Customers.

--OrderDetails → Breaks down many-to-many between Orders & Products.

--Payments → Linked to Orders.
--4. DDL Scripts in SQL Server
-- Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100) NOT NULL,
    Region VARCHAR(50)
);

-- Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10,2) NOT NULL
);

-- Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(12,2)
);

-- OrderDetails
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT NOT NULL,
    LineTotal DECIMAL(12,2) NOT NULL
);

-- Payments
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    PaymentDate DATETIME DEFAULT GETDATE(),
    PaymentMethod VARCHAR(50),
    Amount DECIMAL(12,2)
);
--5. Populate Tables with Sample Data
-- Customers
INSERT INTO Customers (CustomerName, Region)
VALUES ('Amit Sharma', 'Delhi'),
       ('Priya Verma', 'Mumbai'),
       ('Rahul Mehta', 'Bangalore');

-- Products
INSERT INTO Products (ProductName, Category, Price)
VALUES ('Laptop', 'Electronics', 55000),
       ('Mobile', 'Electronics', 20000),
       ('Shoes', 'Fashion', 3000);

-- Orders
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES (1, '2025-09-01', 75000),
       (2, '2025-09-02', 20000);

-- OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, LineTotal)
VALUES (1, 1, 1, 55000),
       (1, 3, 2, 6000),
       (2, 2, 1, 20000);

-- Payments
INSERT INTO Payments (OrderID, PaymentDate, PaymentMethod, Amount)
VALUES (1, '2025-09-01', 'Credit Card', 61000),
       (1, '2025-09-01', 'Wallet', 14000),
       (2, '2025-09-02', 'UPI', 20000);
	   
--6. JOIN Queries & Views for Sales Reports
--a) Sales by Customer
SELECT c.CustomerName, SUM(o.TotalAmount) AS TotalSpent
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerName;

--b) Sales by Product
SELECT p.ProductName, SUM(od.Quantity) AS TotalQty, SUM(od.LineTotal) AS TotalSales
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName;

--c) Payment Summary
SELECT PaymentMethod, SUM(Amount) AS TotalCollected
FROM Payments
GROUP BY PaymentMethod;

--d) Create a View: Customer Orders
CREATE VIEW vw_CustomerOrders AS
SELECT o.OrderID, c.CustomerName, o.OrderDate, o.TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;

--e) Create a View: Product Sales
CREATE VIEW vw_ProductSales AS
SELECT p.ProductName, SUM(od.Quantity) AS TotalQty, SUM(od.LineTotal) AS TotalSales
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName;


