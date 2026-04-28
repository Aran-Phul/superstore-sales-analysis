# Superstore Sales Analysis Dashboard

##  Overview

This project is an end-to-end data analysis of a retail dataset, designed to simulate real-world business reporting. The goal was to analyse sales performance, customer behaviour, and profitability, and present insights through an interactive dashboard.

---

##  Objectives

* Analyse overall sales and profit trends over time
* Identify top-performing products and categories
* Evaluate regional performance
* Understand customer purchasing behaviour
* Highlight opportunities to improve profitability

---

## Tools Used

* Python (Pandas) – data cleaning and preprocessing
* SQL (PostgreSQL) – data storage and querying
* Power BI – data visualisation and dashboard creation

---

##  Project Workflow

### 1. Data Collection

* Imported retail sales dataset (Superstore dataset)

### 2. Data Cleaning (Python)

* Handled missing values
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

* Technology category generated the highest revenue but had lower profit margins
* Sales peak during November–December, indicating strong seasonal demand
* Certain regions consistently outperform others in both revenue and profitability
* High revenue does not always correlate with high profit

---

## Dashboard Preview

*(Add screenshots here once your dashboard is complete)*

---

##  Project Structure

* `train.py` – data loading and cleaning
* `data/` – dataset files
* `sql/` – SQL queries
* `dashboard/` – Power BI file (.pbix)

---

##  What I Learned

* How to clean and prepare real-world datasets
* Writing SQL queries for business analysis
* Designing dashboards to communicate insights effectively
* Translating raw data into actionable business insights

---

##  Contact

If you’d like to connect or discuss this project, feel free to reach out via LinkedIn.
