CREATE TABLE IF NOT EXISTS customers (
  customer_id INT NOT NULL,
  name text NOT NULL,
  segment TEXT,
  country TEXT,
  city TEXT,
  state TEXT,
  postal_code NUMERIC,
  region TEXT,
  PRIMARY KEY (customer_id)
);
CREATE TABLE IF NOT EXISTS orders (
  order_id INT NOT NULL,
  order_date DATE NOT NULL,
  ship_date DATE NOT NULL,
  ship_mode TEXT,
  customer_id INT REFERENCES customers (customer_id),
  PRIMARY KEY (order_id)
);

CREATE TABLE IF NOT EXISTS product (
  product_id INT NOT NULL,
  category TEXT NOT NULL,
  sub_category TEXT NOT NULL,
  product_name TEXT NOT NULL,
  sales NUMERIC NOT NULL,
  PRIMARY KEY (product_id)
);