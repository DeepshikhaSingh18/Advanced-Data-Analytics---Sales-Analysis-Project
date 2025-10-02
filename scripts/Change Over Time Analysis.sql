/* Change Over Time Analysis

Analyze sales performance year
*/
SELECT YEAR(order_date) AS order_year,
SUM(sales_amount) AS total_sales,
COUNT(DISTINCT customer_key) as total_customers,
SUM(quantity) as total_quantity
FROM gold.fact_sales
WHERE YEAR(order_date) IS NOT NULL
GROUP BY YEAR(order_date)
ORDER BY YEAR(order_date)

/* Change Over Time Analysis

Analyze sales performance over months
*/
SELECT MONTH(order_date) AS order_month,
SUM(sales_amount) AS total_sales,
COUNT(DISTINCT customer_key) as total_customers,
SUM(quantity) as total_quantity
FROM gold.fact_sales
WHERE MONTH(order_date) IS NOT NULL
GROUP BY MONTH(order_date)
ORDER BY MONTH(order_date)

--Analyze sales performance over months and year--

SELECT 
YEAR(order_date) AS order_year,
MONTH(order_date) AS order_month,
SUM(sales_amount) AS total_sales,
COUNT(DISTINCT customer_key) as total_customers,
SUM(quantity) as total_quantity
FROM gold.fact_sales
WHERE MONTH(order_date) IS NOT NULL
GROUP BY YEAR(order_date) ,MONTH(order_date)
ORDER BY YEAR(order_date)

/* To have month and year in same column we can use datetrunc function
SELECT 
datetrunc(month,order_date) AS order_date,
SUM(sales_amount) AS total_sales,
COUNT(DISTINCT customer_key) as total_customers,
SUM(quantity) as total_quantity
FROM gold.fact_sales
WHERE MONTH(order_date) IS NOT NULL
GROUP BY datetrunc(month,order_date)
ORDER BY datetrunc(month,order_date)
*/
