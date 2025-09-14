/*KPI requirements */
SELECT SUM(total_price) AS total_revenue FROM pizza_sales;

SELECT SUM(total_price)/COUNT(DISTINCT(order_id)) AS avg_order_val FROM pizza_sales;

 SELECT SUM(quantity) AS total_pizza_sold FROM pizza_sales;

SELECT count(DISTINCT(order_id)) AS Total_orders_placed FROM  pizza_sales;

SELECT CAST(SUM(quantity)/ count(DISTINCT(order_id)) AS DECIMAL(10,3)) AS Avg_pizza_perorder FROM pizza_sales;

/*chart req*/

SELECT DATENAME(DW,order_date) as order_day, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(DW,order_date) ;

SELECT DATENAME(MONTH, order_id) AS order_date, COUNT (DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_id)
ORDER BY Total_orders DESC;

SELECT * FROM pizza_sales

SELECT pizza_category,SUM(total_price)AS total_salesPerCate, SUM(total_price)*100 / (SELECT SUM(total_price) FROM
pizza_sales) AS Percentage_sales FROM pizza_sales
GROUP BY pizza_category;


SELECT pizza_category,SUM(total_price)AS total_salesPerCate, SUM(total_price)*100 / (SELECT SUM(total_price) FROM
pizza_sales WHERE MONTH(order_date)=1) 
AS Percentage_sales FROM pizza_sales
WHERE MONTH(order_date)=1
GROUP BY pizza_category;

SELECT pizza_size,SUM(total_price)AS total_salesPerSize, CAST(SUM(total_price)*100 / (SELECT SUM(total_price) FROM
pizza_sales)AS DECIMAL(10,2)) 
AS Percentage_sales FROM pizza_sales
GROUP BY pizza_size
ORDER BY Percentage_sales DESC ;

SELECT pizza_size,SUM(total_price)AS total_salesPerSize, CAST(SUM(total_price)*100 / (SELECT SUM(total_price) FROM
pizza_sales WHERE DATEPART(quarter, order_date) =1)AS DECIMAL(10,2)) 
AS Percentage_sales FROM pizza_sales
WHERE DATEPART(quarter, order_date) =1
GROUP BY pizza_size
ORDER BY Percentage_sales DESC ;

SELECT TOP 5 pizza_name_id, SUM(total_price) AS Total_revenue
FROM pizza_sales
GROUP BY pizza_name_id
ORDER BY Total_revenue DESC   /*bestsellers top 5*/

SELECT TOP 5 pizza_name_id, SUM(total_price) AS Total_revenue
FROM pizza_sales
GROUP BY pizza_name_id
ORDER BY Total_revenue       /*worstsellers top 5 by pizzatype*/

SELECT TOP 5 pizza_name_id, SUM(quantity) AS Total_quan
FROM pizza_sales
GROUP BY pizza_name_id
ORDER BY Total_quan DESC		/*bestsellers top 5 by quantity*/

SELECT TOP 5 pizza_name_id, SUM(quantity) AS Total_quan
FROM pizza_sales
GROUP BY pizza_name_id
ORDER BY Total_quan 