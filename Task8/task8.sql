-- Drop if exists
IF OBJECT_ID('Orders', 'U') IS NOT NULL DROP TABLE Orders;
IF OBJECT_ID('Customers', 'U') IS NOT NULL DROP TABLE Customers;
GO

-- Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50)
);

-- Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2)
);
GO

-- Insert sample data
INSERT INTO Customers VALUES 
(1, 'Amit Sharma', 'Delhi'),
(2, 'Priya Verma', 'Mumbai'),
(3, 'Rahul Mehta', 'Bangalore');
GO

INSERT INTO Orders VALUES
(101, 1, '2025-08-01', 1200.50),
(102, 1, '2025-08-05', 750.00),
(103, 2, '2025-08-02', 2300.75),
(104, 3, '2025-08-10', 1500.00),
(105, 3, '2025-08-12', 1800.00);
GO
----CREATE PROCEDURE with Parameters & Conditional Logic
GO
CREATE PROCEDURE GetCustomerOrders
    @City VARCHAR(50),     
    @MinAmount DECIMAL(10,2) = 0  
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        c.CustomerName,
        c.City,
        o.OrderID,
        o.OrderDate,
        o.TotalAmount
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    WHERE c.City = @City
      AND o.TotalAmount >= @MinAmount
    ORDER BY o.OrderDate;
END;
GO
EXEC GetCustomerOrders @City = 'Delhi', @MinAmount = 1000;

---CREATE FUNCTION with Logic
GO
CREATE FUNCTION GetCustomerTotalSpent (@CustID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @Total DECIMAL(10,2);

    SELECT @Total = SUM(TotalAmount)
    FROM Orders
    WHERE CustomerID = @CustID;

    -- Handle case when no orders exist
    IF @Total IS NULL
        SET @Total = 0;

    RETURN @Total;
END;
GO
SELECT dbo.GetCustomerTotalSpent(1) AS TotalSpentByAmit;
