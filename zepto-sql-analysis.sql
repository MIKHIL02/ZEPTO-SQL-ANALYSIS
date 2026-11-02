 USE analytics;

CREATE TABLE zepto (
    sku_id INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp DECIMAL(8,2),
    discountPercent DECIMAL(5,2),
    availableQuantity INT,
    discountedSellingPrice DECIMAL(8,2),
    weightInGms INT,
    outOfStock BOOLEAN,
    quantity INT
);

select * from zepto;

USE analytics;
SELECT COUNT(*) FROM zepto;
SELECT * FROM zepto LIMIT 10;

DROP TABLE zepto;
RENAME TABLE zepto_v2 TO zepto;

INSERT INTO zepto (category, name, mrp, discountPercent, availableQuantity,
                   discountedSellingPrice, weightInGms, outOfStock, quantity)
SELECT Category, name, mrp, discountPercent, availableQuantity,
       discountedSellingPrice, weightInGms, outOfStock, quantity
FROM zepto;

-- DATA EXPLATION 

-- count of rows
select count(*)from zepto;

-- sample data 
select * from zepto;

-- null values 
SELECT *
FROM zepto
WHERE name IS NULL
   OR Category IS NULL
   OR mrp IS NULL
   OR discountPercent IS NULL
   OR availableQuantity IS NULL
   OR discountedSellingPrice IS NULL
   OR weightInGms IS NULL
   OR outOfStock IS NULL
   OR quantity IS NULL;
   
-- different product categories
select distinct category  
from zepto order by category;

-- products in stock/ out of stock 
SELECT outOfStock, COUNT(*) AS total_items
FROM zepto
GROUP BY outOfStock;

-- products name present mulitiple times 

SELECT name, COUNT(*) AS times_listed
FROM zepto
GROUP BY name
HAVING COUNT(*) > 1
ORDER BY times_listed DESC;

-- DATA CLEANING 
-- products with price = 0

select * FROM ZEPTO 
WHERE mrp = 0 OR discountedSellingPrice=0;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM zepto WHERE mrp = 0;

SET SQL_SAFE_UPDATES = 1;

-- conveert paise into rupees 
set sql_safe_updates = 0;
Update zepto
set mrp=mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

select mrp, discountedSellingPrice from zepto;

-- Q1 Which product have the highest discount percentages

select distinct name, mrp,discountPercent
from zepto
order by discountPercent desc
limit 10;

-- Q2 WHAT ARE THE PRODUCTS OF HIGH MRP BUT OUT OF STOCK 
SELECT DISTINCT name,mrp
FROM ZEPTO 
WHERE 8 = TRUE AND MRP>300
ORDER BY mrp DESC;

-- q3 CALCULATE ESTIMATED REVENUE FOR EACH CATEGORY
select category,
sum(discountedSellingPrice * availableQuantity) 
as total_revenue
from zepto
group by category 
order by total_revenue;

-- 	q4 FIND ALL THE PRODUCTS WHERE MRP IS GREATER THAN 500 AND DISCOUNT IS LESS THAN 10%

select distinct name,mrp,discountPercent
from zepto
where mrp>500 and discountPercent <10
order by mrp desc,discountPercent;

-- q5 identify the top 5 categories offfering the highest average discount percentage.

SELECT category,
ROUND(AVG(discountPercent), 2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- find the price per gram for products above 100g and sort by best value.

select distinct name, weightInGms,discountedSellingPrice,
round(discountedSellingPrice/weightInGms,2) as price_per_gms
from  zepto
where weightInGms >=100
order by price_per_gms;


-- q7 GROUP THE PRODUUCTS INTPO CATEGORIES LIKE LOW, MEDIUM, BULK.alter

select distinct name,weightInGms,
case when weightInGms <1000 then 'low'
	when weightInGms <5000 then 'medium'
    else 'bulk'
    end as weight_category
from zepto;


-- Q8 WHAT IS THE TOTAL INVENTORY WIEGHT PER CATEGORY

SELECT category,
sum(weightInGms * availableQuantity) as total_weight
from zepto
group by category
order by total_weight;



