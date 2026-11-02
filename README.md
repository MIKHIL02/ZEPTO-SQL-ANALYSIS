# Zepto Inventory Analysis (MySQL)

## Overview
SQL data cleaning and analysis of Zepto product listings to answer
business questions about pricing, discounts, stock, and inventory.

## Dataset
Zepto product listings (source: Kaggle). Columns include name,
category, MRP, discount percent, available quantity, weight,
and stock status.

## Tools Used
- MySQL
- MySQL Workbench

## Steps
1. **Data exploration:** checked row count, null values, and duplicate product names.
2. **Data cleaning:** removed rows with MRP = 0 and converted prices from paise to rupees.
3. **Analysis:** answered business questions using aggregations and grouping.

## Business Questions Answered
1. Which products have the highest discount percentages?
2. Which high-MRP products (above ₹300) are out of stock?
3. What is the estimated revenue for each category?
4. Which products have an MRP above ₹500 but a discount below 10%?
5. Which 5 categories offer the highest average discount?
6. What is the price per gram for products of 100g or more (best value first)?
7. How can products be grouped into low, medium, and bulk weight categories?
8. What is the total inventory weight per category?

## Key Findings
## Key Findings
- The cleaned dataset contains [X] product listings across [X] categories after removing rows with MRP = 0.
- [X]% of listings ([X] items) are out of stock.
- [Category] has the highest average discount at [X]%.
- [Category] generates the highest estimated revenue (₹[X]).
- [X] high-value products (MRP above ₹300) are out of stock, which suggests possible lost sales.
- Meats, Fish & Eggs has the lowest total inventory weight (about 144 kg), while [category] has the highest ([X] kg).

## Files
- `zepto-sql-analysis.sql`: all queries used in the project
