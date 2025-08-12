CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    ProductCategory VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10, 2),
    OrderDate DATE
);
INSERT INTO Orders (OrderID, CustomerName, ProductCategory, Quantity, Price, OrderDate)
VALUES
(1, 'John Smith', 'Electronics', 2, 500.00, '2024-05-10'),
(2, 'Sara Johnson', 'Clothing', 5, 50.00, '2024-05-15'),
(3, 'Michael Scott', 'Electronics', 1, 800.00, '2024-06-01'),
(4, 'Anna Brown', 'Clothing', 3, 75.00, '2024-06-05'),
(5, 'David Wilson', 'Furniture', 1, 1200.00, '2024-06-10'),
(6, 'Emma Davis', 'Electronics', 4, 300.00, '2024-06-15'),
(7, 'Chris Lee', 'Clothing', 6, 40.00, '2024-06-20');
--Apply Aggregate Functions
SELECT 
    COUNT(*) AS TotalOrders,
    SUM(Quantity) AS TotalQuantity,
    AVG(Price) AS AveragePrice,
    MIN(Price) AS LowestPrice,
    MAX(Price) AS HighestPrice
FROM Orders;
--GROUP BY to categorize
SELECT 
    ProductCategory,
    COUNT(*) AS OrdersCount,
    SUM(Quantity) AS TotalQuantity,
    SUM(Quantity * Price) AS TotalRevenue
FROM Orders
GROUP BY ProductCategory;
--HAVING to filter grouped results
SELECT 
    ProductCategory,
    COUNT(*) AS OrdersCount,
    SUM(Quantity * Price) AS TotalRevenue
FROM Orders
GROUP BY ProductCategory
HAVING SUM(Quantity * Price) > 1000;  













