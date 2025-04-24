-- Creating the Orders table
CREATE TABLE Orders (
    Order_id INT PRIMARY KEY,
    Customer_id VARCHAR(10),
    Product_name VARCHAR(100),
    Category VARCHAR(50),
    Quantity INT,
    Price_per_unit DECIMAL(10, 2),
    Order_date DATE,
    Status VARCHAR(20)
);

-- Inserting into Orders
INSERT INTO Orders (
    Order_id, Customer_id, Product_name, Category, Quantity, Price_per_unit, Order_date, Status
) VALUES
(1001, 'C001', 'Wireless Mouse', 'Electronics', 2, 20.00, '2024-12-10', 'Delivered'),
(1002, 'C002', 'Yoga Mat', 'Fitness', 1, 25.00, '2024-12-11', 'Cancelled'),
(1003, 'C003', 'Bluetooth Speaker', 'Electronics', 1, 50.00, '2024-12-12', 'Delivered'),
(1004, 'C004', 'Treadmill', 'Fitness', 1, 450.00, '2024-12-13', 'Shipped'),
(1005, 'C005', 'Coffee Maker', 'Home', 1, 80.00, '2024-12-14', 'Delivered'),
(1006, 'C006', 'Office Chair', 'Furniture', 1, 120.00, '2024-12-15', 'Returned'),
(1007, 'C007', 'Mosquito Bat', 'Home', 2, 170.00, '2024-12-16', 'Returned'),
(1008, 'C008', 'LED Monitor', 'Electronics', 2, 150.00, '2024-12-17', 'Delivered');

-- Creating the Customers table
CREATE TABLE Customers (
    Customer_id VARCHAR(10) PRIMARY KEY,
    Customer_name VARCHAR(100),
    Email VARCHAR(100)
);

-- Inserting into Customers
INSERT INTO Customers (Customer_id, Customer_name, Email) VALUES
('C001', 'Priya', 'priya@gmail.com'),
('C002', 'Siva', 'siva@gmail.com'),
('C003', 'Kartheekha', 'karthee@gmail.com'),
('C004', 'Rakshitha', 'raks@gmail.com'),
('C005', 'Karunya', 'karu@gmail.com'),
('C006', 'Diksha', 'diksha@gmail.com'),
('C007', 'Darshanya', 'dars@gmail.com'),
('C008', 'Bharathy', 'bharathy@gmail.com');

SELECT * FROM Orders WHERE Quantity>1 ORDER BY Customer_id DESC;
SELECT category, SUM(quantity * price_per_unit) AS total_revenue FROM orders WHERE status = 'Delivered' 
GROUP BY category;

SELECT DISTINCT c.Customer_name, c.Email FROM Orders o JOIN Customers c  ON o.Customer_id = c.Customer_id WHERE o.Category = 'Electronics';
SELECT * FROM Orders WHERE Price_per_unit > ( SELECT AVG(Price_per_unit) FROM Orders);
SELECT * FROM Orders WHERE Price_per_unit = (SELECT MAX(Price_per_unit) FROM Orders);
CREATE VIEW Order_Summary AS SELECT o.Order_id,o.Product_name,o.Category,o.Quantity,o.Price_per_unit,o.Status, o.Order_date, c.Customer_name, c.Email FROM Orders o JOIN Customers c ON o.Customer_id = c.Customer_id;


SELECT Order_id, Product_name, Category, Quantity, Price_per_unit, Status, Order_date, Customer_name FROM Order_Summary WHERE Status = 'Delivered';

CREATE INDEX idx_orders_customer_id ON Orders(Customer_id);
CREATE INDEX idx_orders_order_date ON Orders(Order_date);

SELECT * FROM Orders WHERE Order_date = '2024-12-17';
