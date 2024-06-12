USE AdventureWorks2019;

Select * from Sales.Store;

Select * from Sales.Customer;


SELECT * FROM Sales.SalesOrderHeader;

SELECT COUNT(*) as AvailableSaleOn1January2013
FROM Production.Product
WHERE SellStartDate <= '2013-01-01' AND (SellEndDate IS NULL OR SellEndDate > '2013-01-01');

SELECT COUNT(*) as AvailableSaleOn1January2013
FROM Production.Product
WHERE SellStartDate <= '2013-01-01' AND SellEndDate> '2013-01-01';

select SellStartDate from Production.Product;

SELECT TOP 5 CustomerID, SUM(TotalDue) AS MoneySpent
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2012-01-01' AND '2013-12-31'
GROUP BY CustomerID
ORDER BY MoneySpent DESC;

SELECT AVG(OrderQty) AS AvgNumItemsOrdered from Sales.SalesOrderDetail;

select * from Sales.SalesOrderDetail;



-- Find the order with the largest number of items
WITH LargestOrder AS (
    SELECT TOP 1 SalesOrderID, SUM(OrderQty) AS TotalItems
    FROM Sales.SalesOrderDetail
    GROUP BY SalesOrderID
    ORDER BY TotalItems DESC
),
RankedOrders AS (
    SELECT SalesOrderID, Freight, RANK() OVER (ORDER BY Freight DESC) AS FreightRank
    FROM Sales.SalesOrderHeader
)
SELECT r.SalesOrderID, r.Freight, r.FreightRank
FROM LargestOrder l
JOIN RankedOrders r ON l.SalesOrderID = r.SalesOrderID;

--in terms of Popularity
SELECT TOP 5 ProductID, COUNT(*) AS NumberOfOrders
FROM Sales.SalesOrderDetail
WHERE SalesOrderID IN (SELECT SalesOrderID FROM Sales.SalesOrderHeader WHERE OrderDate BETWEEN '2013-01-01' AND '2013-12-31')
GROUP BY ProductID
ORDER BY NumberOfOrders DESC;

--in terms of  Profitability 
SELECT TOP 5 ProductID, SUM(LineTotal) AS TotalSales
FROM Sales.SalesOrderDetail
WHERE SalesOrderID IN (SELECT SalesOrderID FROM Sales.SalesOrderHeader WHERE OrderDate BETWEEN '2013-01-01' AND '2013-12-31')
GROUP BY ProductID
ORDER BY TotalSales DESC;


 WITH LargestOrder AS (
    SELECT TOP 1 SalesOrderID, SUM(OrderQty) AS TotalItems
    FROM Sales.SalesOrderDetail
    GROUP BY SalesOrderID
    ORDER BY TotalItems DESC
)
SELECT r.SalesOrderID, l.TotalItems
FROM LargestOrder l
JOIN Sales.SalesOrderHeader r ON l.SalesOrderID = r.SalesOrderID; 

---Question 4

SELECT CurrencyCode, SUM(TotalDue) AS TotalSales, COUNT(*) AS NumberOfOrders
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2013-01-01' AND '2013-12-31'
GROUP BY CurrencyCode;

-- Check table columns to find the correct table and column
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'SalesOrderHeader';

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'CurrencyRate';
--uuu

-- Join SalesOrderHeader with CurrencyRate to get currency details
SELECT cr.ToCurrencyCode, SUM(soh.TotalDue) AS TotalSales, COUNT(*) AS NumberOfOrders
FROM Sales.SalesOrderHeader soh
JOIN Sales.CurrencyRate cr ON soh.CurrencyRateID = cr.CurrencyRateID
WHERE soh.OrderDate BETWEEN '2013-01-01' AND '2013-12-31'
GROUP BY cr.ToCurrencyCode;

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'CurrencyRate';