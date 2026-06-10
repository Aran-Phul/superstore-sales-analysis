# Superstore Sales Analysis Dashboard

##  Overview

This project analyzes four years of retail sales data from a global superstore.

My objectives were to:

- Identify key sales trends
- Analyze customer and product performance
- Evaluate shipping behaviour
- Forecast future revenue using time-series models
- Build an interactive Power BI dashboard

---

##  Objectives

* Analyse overall sales and profit trends over time
* Identify top-performing products and categories
* Evaluate regional performance
* Understand customer purchasing behaviour
* Highlight opportunities to improve profitability

---

## Tools Used

- PostgreSQL
- scikit-learn
- Python
- statsforecast
- Pandas
- Prophet
- ARIMA
- SARIMA
- Power BI

---

## Database Design

The raw dataset was normalized into:

- Customers
- Orders
- Products
- Order Items

---

##  Project Workflow

### 1. Data Collection

* Imported retail sales dataset (Superstore dataset)

### 2. Data Cleaning (Python)

* Converted data into correct formatting for 
* Standardised date formats
* Converted data types (sales, profit, dates)
* Created new features:

  * Profit Margin
  * Order Year / Month

### 3. Data Storage (SQL)

* Designed relational table structure
* Loaded cleaned data into PostgreSQL
* Wrote queries to analyse:

  * Revenue by category
  * Monthly sales trends
  * Regional performance

### 4. Data Visualisation (Power BI)

Built an interactive dashboard including:

* KPI cards (Revenue, Profit, Profit Margin, Orders)
* Sales trends over time
* Revenue by category and region
* Top-performing products
* Profitability analysis
* Interactive filters (date, region, category)

---

##  Key Insights

* Technology category generated the highest revenue seemingly due to seasonal purchasing habits (black friday)
* Sales peak during November–December, indicating strong seasonal demand
- Standard Class represented nearly 60% of all shipments
- Top 10 products contributed disproportionately to revenue
- Q4 consistently produced the highest sales

---
## Forecasting Results

| Model | MAE |
|---------|---------:|
| Prophet | 20540 |
| ARIMA | 28540 |
| SARIMA | 20600 |

---

## Dashboard Preview

### Executive Overview

![Page1](<Dashboard/Page 1 Overview.png>)

### Customer Analysis

![Page2](<Dashboard/Page 2 Product & Customer Analysis.png>)

### Forecasting

![Page3](<Dashboard/Page 3 Forecasting.png>)

---

##  Project Structure

* `train.py` – data loading and cleaning
* `EDA.py` – time series forecasting with predictive model analysis
* `sql/` – SQL queries
* `Dashboard/` – Power BI file (.pbix)

---

##  What I Learned

* How to clean and prepare real-world datasets
* Writing SQL queries for business analysis
* Designing dashboards to communicate insights effectively
* Translating raw data into actionable business insights
* My first experience using predicitve modelling in analysis

---
## MESSY DATA UNCOVERED SO FAR 

Data Quality Issues Encountered
duplicate product IDs with inconsistent product names
inconsistent encoding
duplicate customer locations


##  Contact

If you’d like to connect or discuss this project, feel free to reach out via LinkedIn.
