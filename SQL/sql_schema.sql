CREATE SCHEMA public;
CREATE TABLE IF NOT EXISTS customers (
  customer_id TEXT NOT NULL PRIMARY KEY,
  name text NOT NULL,
  segment TEXT
);
CREATE TABLE IF NOT EXISTS orders (
  order_id TEXT NOT NULL PRIMARY KEY,
  order_date DATE NOT NULL,
  ship_date DATE NOT NULL,
  ship_mode TEXT,
  country TEXT,
  city TEXT,
  state TEXT,
  postal_code NUMERIC,
  region TEXT,
  customer_id TEXT REFERENCES customers(customer_id)
);

CREATE TABLE IF NOT EXISTS product (
  product_id TEXT NOT NULL PRIMARY KEY,
  category TEXT NOT NULL,
  sub_category TEXT NOT NULL,
  product_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS order_items (
  order_items_id SERIAL PRIMARY KEY,
  order_id TEXT REFERENCES orders (order_id),
  product_id TEXT REFERENCES product (product_id),
  sales NUMERIC
);