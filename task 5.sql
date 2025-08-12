--- Create Two Related Tables
-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

-- Orders Table
DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- Insert into Customers
INSERT INTO Customers (CustomerID, CustomerName, City)
VALUES
(1, 'John Smith', 'New York'),
(2, 'Sara Johnson', 'Los Angeles'),
(3, 'Michael Scott', 'Chicago'),
(4, 'Anna Brown', 'Houston');

-- Insert into Orders
INSERT INTO Orders (OrderID, CustomerID, Product, Quantity, Price)
VALUES
(101, 1, 'Laptop', 1, 1200.00),
(102, 1, 'Mouse', 2, 25.00),
(103, 2, 'Phone', 1, 800.00),
(104, 3, 'Keyboard', 1, 45.00);
--INNER JOIN
SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.Product, Orders.Price
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
---LEFT JOIN 
SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.Product, Orders.Price
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

---RIGHT JOIN
SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.Product, Orders.Price
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
----FULL JOIN
SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.Product, Orders.Price
FROM Customers
FULL JOIN Orders ON Customers.CustomerID = Orders.CustomerID;



