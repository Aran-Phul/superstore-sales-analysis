TRUNCATE TABLE customers;
TRUNCATE TABLE orders;
TRUNCATE TABLE product;
CREATE TEMP TABLE t (
    Row_ID INT,
    Order_ID TEXT,
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode TEXT,
    Customer_ID TEXT,
    Customer_Name TEXT,
    Segment TEXT,
    Country TEXT,
    City TEXT,
    State TEXT,
    Postal_Code NUMERIC,
    Region TEXT,
    Product_ID TEXT,
    Category TEXT,
    Sub_Category TEXT,
    Product_Name TEXT,
    Sales NUMERIC
);

\copy t FROM 'train.csv' WITH (FORMAT csv, HEADER true, ENCODING 'utf-8');

INSERT INTO customers (customer_id, Name, segment)
SELECT DISTINCT Customer_ID, Customer_Name, Segment
FROM t;

INSERT INTO orders (order_id, order_date, ship_date,ship_mode,country, city, state, postal_code, region,Customer_ID)
SELECT Order_ID, Order_Date, Ship_Date,Ship_Mode, Country,City,State,Postal_Code,Region,Customer_ID
FROM t;

INSERT INTO product (product_id,category,sub_category,product_name,sales)
SELECT Product_ID, Category, Sub_Category, Product_Name, Sales
FROM t;