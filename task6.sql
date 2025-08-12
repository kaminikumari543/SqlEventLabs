-- Drop if exists
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10, 2),
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

---INSERT DATA
-- Customers
INSERT INTO Customers (CustomerID, CustomerName, City)
VALUES
(1, 'John Smith', 'New York'),
(2, 'Sara Johnson', 'Los Angeles'),
(3, 'Michael Scott', 'Chicago'),
(4, 'Anna Brown', 'Houston');

-- Orders
INSERT INTO Orders (OrderID, CustomerID, Product, Quantity, Price, OrderDate)
VALUES
(101, 1, 'Laptop', 1, 1200.00, '2024-05-10'),
(102, 1, 'Mouse', 2, 25.00, '2024-05-15'),
(103, 2, 'Phone', 1, 800.00, '2024-06-01'),
(104, 3, 'Keyboard', 1, 45.00, '2024-06-05'),
(105, 3, 'Monitor', 2, 200.00, '2024-06-10');
---Scalar Subquery in SELECT
SELECT 
    CustomerID,
    CustomerName,
    (SELECT COUNT(*) 
     FROM Orders 
     WHERE Orders.CustomerID = Customers.CustomerID) AS TotalOrders
FROM Customers;
---Correlated Subquery in WHERE
SELECT CustomerName, City
FROM Customers C
WHERE EXISTS (
    SELECT 1
    FROM Orders O
    WHERE O.CustomerID = C.CustomerID
      AND O.Price > 500
);
---Subquery with IN
SELECT CustomerName
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Orders
    WHERE Product = 'Laptop'
);
---Subquery with =
SELECT CustomerName
FROM Customers
WHERE CustomerID = (
    SELECT CustomerID
    FROM Orders
    WHERE OrderID = 103
);
---Subquery in FROM (Derived Table)
SELECT City, COUNT(*) AS CustomersInCity
FROM (
    SELECT DISTINCT City, CustomerName
    FROM Customers
) AS CityList
GROUP BY City;


