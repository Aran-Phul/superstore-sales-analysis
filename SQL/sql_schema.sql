CREATE SCHEMA public;
CREATE TABLE IF NOT EXISTS customers (
  customer_id TEXT NOT NULL,
  name text NOT NULL,
  segment TEXT
);
CREATE TABLE IF NOT EXISTS orders (
  order_id TEXT NOT NULL,
  order_date DATE NOT NULL,
  ship_date DATE NOT NULL,
  ship_mode TEXT,
  country TEXT,
  city TEXT,
  state TEXT,
  postal_code NUMERIC,
  region TEXT,
  customer_id TEXT
);

CREATE TABLE IF NOT EXISTS product (
  product_id TEXT NOT NULL,
  category TEXT NOT NULL,
  sub_category TEXT NOT NULL,
  product_name TEXT NOT NULL,
  sales NUMERIC NOT NULL
);