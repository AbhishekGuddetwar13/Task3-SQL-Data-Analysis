CREATE DATABASE ecommerce_db;
USE ecommerce_db;

CREATE TABLE ecommerce_data (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID INT,
    Country VARCHAR(100)
);
select * from ecommerce_data;

#Total Revenue
SELECT SUM(Quantity * UnitPrice) AS TotalRevenue
FROM ecommerce_data;

#Top 10 Customers by Revenue
SELECT CustomerID,
       SUM(Quantity * UnitPrice) AS Revenue
FROM ecommerce_data
GROUP BY CustomerID
ORDER BY Revenue DESC
LIMIT 10;

#Average Revenue Per Customer
SELECT AVG(CustomerRevenue) AS AvgRevenuePerUser
FROM (
    SELECT CustomerID,
           SUM(Quantity * UnitPrice) AS CustomerRevenue
    FROM ecommerce_data
    GROUP BY CustomerID
) t;


#Orders from United Kingdom
SELECT *
FROM ecommerce_data
WHERE Country = 'United Kingdom';

#Create View
CREATE VIEW customer_sales AS
SELECT CustomerID,
       SUM(Quantity * UnitPrice) AS TotalSales
FROM ecommerce_data
GROUP BY CustomerID;


#Revenue by Country
SELECT Country,
       SUM(Quantity * UnitPrice) AS Revenue
FROM ecommerce_data
GROUP BY Country
ORDER BY Revenue DESC;

#Sales By Month
SELECT MONTH(InvoiceDate) AS MonthNo,
       SUM(Quantity * UnitPrice) AS Revenue
FROM ecommerce_data
GROUP BY MONTH(InvoiceDate)
ORDER BY MonthNo;

#Handal Null CustomersID
SELECT *
FROM ecommerce_data
WHERE CustomerID IS NULL;

