Use superstore_sales;

SELECT SUM(sales) AS total_sales,
SUM(quantity) AS total_quantity,
SUM(profit) AS total_profit FROM sales;

SELECT category, SUM(sales) AS total_sales, SUM(quantity) AS total_quantity, SUM(profit) AS total_profit
FROM sales GROUP BY category ORDER BY total_sales DESC;

SELECT category, SUM(sales) AS total_sales, SUM(profit) AS total_profit, ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM sales GROUP BY category ORDER BY profit_margin DESC;

SELECT sub_category, SUM(sales) AS total_sales, SUM(quantity) AS total_quantity, SUM(profit) AS total_profit,
ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM sales GROUP BY sub_category ORDER BY total_profit DESC;

SELECT region, SUM(sales) AS total_sales, SUM(quantity) AS total_quantity, SUM(profit) AS total_profit,
ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin 
FROM sales GROUP BY region ORDER BY total_profit DESC;

SELECT state, SUM(sales) AS total_sales, SUM(quantity) AS total_quantity, SUM(profit) AS total_profit,
ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM sales GROUP BY state ORDER BY total_profit DESC;

SELECT product_name, SUM(sales) AS total_sales, SUM(quantity) AS total_quantity, SUM(profit) AS total_profit,
ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM sales GROUP BY product_name ORDER BY total_sales DESC
LIMIT 10;

SELECT product_name, SUM(sales) AS total_sales, SUM(quantity) AS total_quantity, SUM(profit) AS total_profit,
ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM sales GROUP BY product_name ORDER BY total_profit DESC
LIMIT 10;

SELECT product_name, SUM(sales) AS total_sales, SUM(quantity) AS total_quantity, SUM(profit) AS total_profit,
ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM sales GROUP BY product_name HAVING SUM(profit) < 0 ORDER BY total_profit ASC;

SELECT discount, COUNT(*) AS number_of_orders, SUM(sales) AS total_sales, SUM(profit) AS total_profit,
ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM sales GROUP BY discount ORDER BY discount;

SELECT YEAR(order_date) AS year, MONTH(order_date) AS month, SUM(sales) as total_sales, SUM(profit) AS total_profit
FROM sales GROUP BY YEAR(order_date), MONTH(order_date) ORDER BY year, month;

SELECT YEAR(order_date) AS year, SUM(sales) AS total_sales, SUM(quantity) AS total_quantity, SUM(profit) AS total_profit,
ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM sales GROUP BY YEAR(order_date) ORDER BY year;

SELECT 
    customer_id, customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM sales
GROUP BY customer_id, customer_name
ORDER BY total_sales DESC
LIMIT 10;

SELECT 
    customer_id, customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2)AS avg_order_value
FROM sales
GROUP BY customer_id, customer_name
ORDER BY total_orders DESC, total_sales DESC
LIMIT 10;

SELECT COUNT(DISTINCT order_id) AS total_orders, ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS avg_order_value,
ROUND(SUM(profit) / COUNT(DISTINCT order_id), 2) AS avg_profit_per_order,
ROUND(SUM(quantity) / COUNT(DISTINCT order_id), 2) AS avg_items_per_order
FROM sales;

SELECT ship_mode, COUNT(DISTINCT order_id) AS total_orders,
SUM(sales) AS total_sales,
SUM(profit) AS total_profit,
ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin,
ROUND(AVG(DATEDIFF(ship_date, order_date)), 2) AS avg_shipping_days
FROM sales
GROUP BY ship_mode
ORDER BY total_orders DESC;

SELECT category, discount,
SUM(sales) AS total_sales, SUM(profit) AS total_profit, 
ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM sales
GROUP BY category, discount
ORDER BY category, discount;

SELECT region, category,
		SUM(sales) AS total_sales,
        SUM(profit) AS total_profit,
        ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM sales
GROUP BY region, category
ORDER BY region, total_profit DESC;

SELECT sub_category, discount,
		SUM(sales) AS total_sales,
        SUM(profit) AS total_profit,
        ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM sales
GROUP BY sub_category, discount
ORDER BY sub_category, discount;

SELECT DATE_FORMAT(order_date, '%Y-%m')
AS month,
		SUM(sales) AS total_sales,
        SUM(profit) AS total_profit,
        ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin,
        SUM(quantity) AS total_quantity
FROM sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;

SELECT customer_id, customer_name,
COUNT(DISTINCT order_id) AS total_orders,
ROUND(SUM(sales), 2) AS total_sales,
ROUND(SUM(profit), 2) AS total_profit,
ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM sales GROUP BY customer_id, customer_name ORDER BY total_profit DESC
LIMIT 10;

SELECT customer_id, customer_name,
COUNT(DISTINCT order_id) AS total_orders,
ROUND(SUM(sales), 2) AS total_sales,
ROUND(SUM(profit), 2) AS total_profit,
ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS avg_order_value,
ROUND(SUM(quantity) / COUNT(DISTINCT order_id), 2) AS avg_items_per_order
FROM sales GROUP BY customer_id, customer_name ORDER BY total_orders DESC, total_sales DESC
LIMIT 10;

SELECT state, category,
ROUND(sum(sales), 2) AS total_sales,
ROUND(SUM(profit), 2) AS total_profit,
ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM sales GROUP BY state, category ORDER BY state, total_profit DESC;

SELECT discount,
COUNT(DISTINCT order_id) AS total_orders,
ROUND(SUM(sales), 2) AS total_sales,
ROUND(SUM(profit), 2) AS total_profit,
ROUND(AVG(profit), 2) AS avg_profit_per_row,
ROUND(SUM(profit) / SUM(sales)*100, 2) AS profit_margin
FROM sales GROUP BY discount ORDER BY discount;

SELECT ROUND(AVG(DATEDIFF(ship_date, order_date)), 2) AS avg_shipping_days,
MIN(DATEDIFF(ship_date, order_date)) AS fastest_shipping_days,
MAX(DATEDIFF(ship_date, order_date)) AS slowest_shipping_days
FROM sales;

SELECT
	COUNT(DISTINCT order_id) AS total_orders,
	COUNT(DISTINCT customer_id) AS total_customer,
	SUM(quantity) AS total_quantity,
    ROUND(SUM(sales), 2) AS total_sales,
	ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin,
    ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS avg_order_value,
	ROUND(SUM(profit) / COUNT(DISTINCT order_id), 2) AS avg_profit_per_order
FROM sales;

CREATE OR REPLACE VIEW powerbi_sales AS SELECT
	row_id,
    order_id,
    order_date,
    ship_date,
    ship_mode,
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region,
    product_id,
    category,
    sub_category,
    product_name,
    sales,
    quantity,
    discount,
    profit,
    DATEDIFF(ship_date, order_date)
AS shipping_days FROM sales;

SELECT * FROM powerbi_sales LIMIT 10;

select user(), current_user();
Alter user 'root'@'localhost' identified by 'sakshi06';