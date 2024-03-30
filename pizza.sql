SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS avg_order_values
FROM pizza_sales

SELECT SUM(quantity) AS total_pizza_sold
FROM pizza_sales

SELECT COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales

SELECT CAST(SUM(quantity) / COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS average_pizza_orders
FROM pizza_sales

SELECT DAYNAME(str_to_date(order_date, '%d-%m-%Y %d/%m/%Y')) as Order_day, 
COUNT(DISTINCT order_id) AS Total_Orders from pizza_sales 
GROUP BY Order_day 
ORDER BY Total_Orders DESC

SELECT HOUR(order_time) as order_hours, 
COUNT(DISTINCT order_id) AS Total_Orders from pizza_sales 
GROUP BY order_hours
ORDER BY Total_Orders

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_sales, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS perc_total_sales
FROM pizza_sales
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_sales, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS perc_total_sales
FROM pizza_sales
GROUP BY 1
ORDER BY 2 DESC

SELECT pizza_category, SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY 1
SELECT pizza_name, SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

SELECT pizza_name, SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY 1
ORDER BY 2 
LIMIT 5
