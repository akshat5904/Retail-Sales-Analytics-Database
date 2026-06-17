CREATE DATABASE RetailSalesDB;

USE RetailSalesDB;

CREATE TABLE Regions (
    Region_ID INT PRIMARY KEY,
    Region_Name VARCHAR(50)
);

CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Email VARCHAR(100),
    Gender VARCHAR(10),
    City VARCHAR(50),
    State VARCHAR(50)
);

CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);


SHOW TABLES;

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Region_ID INT,
    Order_Date DATE,

    FOREIGN KEY (Customer_ID)
    REFERENCES Customers(Customer_ID),

    FOREIGN KEY (Region_ID)
    REFERENCES Regions(Region_ID)
);



CREATE TABLE Order_Details (
    Detail_ID INT PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Quantity INT,
    Unit_Price DECIMAL(10,2),

    FOREIGN KEY (Order_ID)
    REFERENCES Orders(Order_ID),

    FOREIGN KEY (Product_ID)
    REFERENCES Products(Product_ID)
);



INSERT INTO Regions VALUES
(1,'North'),
(2,'South'),
(3,'East'),
(4,'West'),
(5,'Central'),
(6,'North-East'),
(7,'North-West'),
(8,'South-East'),
(9,'South-West'),
(10,'Metro');




