/* 
                   ---- Advanced SQL Assignment ----     
                        
Q1. What is a Common Table Expression (CTE), and how does it improve SQL query readability?
   -- A CTE is a temporary result set defined using the WITH clause.
      It improves readability by breaking complex queries into smaller, logical parts.
   
Q2. Why are some views updatable while others are read-only? Explain with an example.
   -- Simple views based on a single table are usually updatable.
       Views with joins, aggregations, or DISTINCT are often read-only because updates become ambiguous.
   
   Q3. What advantages do stored procedures offer compared to writing raw SQL queries repeatedly?
   -- Stored procedures improve performance through precompilation and provide better security.
      They promote code reuse and centralize business logic.
   
Q4. What is the purpose of triggers in a database? Mention one use case where a trigger is essential.
   -- Triggers automatically execute actions in response to INSERT, UPDATE, or DELETE events
      Example: Maintaining audit logs for tracking data changes
      
Q5. Explain the need for data modelling and normalization when designing a database.
   -- Data modelling defines the database structure and relationships.
      Normalization reduces redundancy and ensures data consistency and integrity.

*/

-- Dataset (Use for Q6–Q9)
-- 1. Create Products Table

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO Products VALUES
(1, 'Keyboard', 'Electronics', 1200),
(2, 'Mouse', 'Electronics', 800),
(3, 'Chair', 'Furniture', 2500),
(4, 'Desk', 'Furniture', 5500);

-- 2. Create Sales Table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
);

INSERT INTO Sales VALUES
(1, 1, 4, '2024-01-05'),
(2, 2, 10, '2024-01-06'),
(3, 3, 2, '2024-01-10'),
(4, 4, 1, '2024-01-11');

-- Q6. Write a CTE to calculate the total revenue for each product (Revenues = Price × Quantity), and return only products where  revenue > 3000.
WITH ProductRevenue AS (
    SELECT 
        p.ProductName,
        (p.Price * s.Quantity) AS TotalRevenue
    FROM Products p
    JOIN Sales s ON p.ProductID = s.ProductID
)
SELECT ProductName, TotalRevenue 
FROM ProductRevenue
WHERE TotalRevenue > 3000;


-- Q7. Create a view named vw_CategorySummary that shows:  Category, TotalProducts, AveragePrice.
CREATE VIEW vw_CategorySummary AS
SELECT 
    Category,
    COUNT(ProductID) AS TotalProducts,
    AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category;


-- Q8. Create an updatable view containing ProductID, ProductName, and Price. Then update the price of ProductID = 1 using the view .
CREATE VIEW vw_ProductDetails AS
SELECT ProductID, ProductName, Price 
FROM Products;

UPDATE vw_ProductDetails
SET Price = 1500
WHERE ProductID = 1;


-- Q9. Create a stored procedure that accepts a category name and returns all products belonging to that category.
DELIMITER //
CREATE PROCEDURE GetProductsByCategory(IN categoryInput VARCHAR(50))
BEGIN
    SELECT * FROM Products 
    WHERE Category = categoryInput;
END //
DELIMITER ;


-- Q10. Create an AFTER DELETE trigger on the Products table that archives deleted product rows into a new table ProductArchive . 
-- The archive should store ProductID, ProductName, Category, Price, and DeletedAt timestamp.
-- 1. Create Archive Table
CREATE TABLE ProductArchive (
    ArchiveID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    DeletedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Create the Trigger
DELIMITER //
CREATE TRIGGER trg_AfterDeleteProduct
AFTER DELETE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO ProductArchive (ProductID, ProductName, Category, Price, DeletedAt)
    VALUES (OLD.ProductID, OLD.ProductName, OLD.Category, OLD.Price, NOW());
END //
DELIMITER ;






