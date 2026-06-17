SELECT
SUM(Quantity * Unit_Price) AS Total_Revenue
FROM Order_Details;

SELECT
p.Product_Name,
SUM(od.Quantity) AS Total_Sold
FROM Products p
JOIN Order_Details od
ON p.Product_ID = od.Product_ID
GROUP BY p.Product_Name
ORDER BY Total_Sold DESC
LIMIT 10;

SELECT
c.Customer_Name,
SUM(od.Quantity * od.Unit_Price) AS Total_Spent
FROM Customers c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID
JOIN Order_Details od
ON o.Order_ID = od.Order_ID
GROUP BY c.Customer_Name
ORDER BY Total_Spent DESC
LIMIT 10;

SELECT
    r.Region_Name,
    SUM(od.Quantity * od.Unit_Price) AS Revenue
FROM Regions r
JOIN Orders o
    ON r.Region_ID = o.Region_ID
JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
GROUP BY r.Region_Name
ORDER BY Revenue DESC;

SELECT
    YEAR(o.Order_Date) AS Year,
    MONTH(o.Order_Date) AS Month,
    SUM(od.Quantity * od.Unit_Price) AS Revenue
FROM Orders o
JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
GROUP BY YEAR(o.Order_Date),
         MONTH(o.Order_Date)
ORDER BY Year, Month;

SELECT
    p.Category,
    SUM(od.Quantity * od.Unit_Price) AS Revenue
FROM Products p
JOIN Order_Details od
    ON p.Product_ID = od.Product_ID
GROUP BY p.Category
ORDER BY Revenue DESC;

CREATE VIEW Sales_Summary AS
SELECT
    o.Order_ID,
    c.Customer_Name,
    p.Product_Name,
    od.Quantity,
    od.Unit_Price,
    (od.Quantity * od.Unit_Price) AS Revenue
FROM Orders o
JOIN Customers c
    ON o.Customer_ID = c.Customer_ID
JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
JOIN Products p
    ON od.Product_ID = p.Product_ID;
    
SELECT * FROM Sales_Summary LIMIT 20;


show tables;