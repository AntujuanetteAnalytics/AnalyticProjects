--Total Revenue--

SELECT SUM(total_price) AS Total_Revenue FROM pizza_sale

--Average order value--

SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS Avg_Order_Value FROM pizza_sales

--Total pizzas sold--

SELECT SUM(quantity) AS Total_Pizzas_Sold FROM pizza_sales

--Total orders--

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales

--Average pizzas per order--

SELECT CAST(CAST(SUM(quantity) AS DECIMAL (10,2)) /

CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL (10,2)) AS Average_Pizzas_Per_Order FROM pizza_sales

--Daily trend--

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales

GROUP BY DATENAME(DW, order_date)

--Hourly trend--

SELECT DATEPART(HOUR, order_time) AS Order_Hours, COUNT(DISTINCT order_id) AS Total_Orders

FROM pizza_sales

GROUP BY DATEPART(HOUR, order_time)

ORDER BY DATEPART(HOUR, order_time)

--Percentage of sales--

SELECT pizza_category, SUM(total_price) AS Total_Sales, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS Percentage_Of_Sales

FROM pizza_sales

GROUP BY pizza_category

NOTES

WHEN A SPECIFIC MONTH IS NEEDED USE: WHERE MONTH(COLUMN NAME) = 1(JAN), 2(APRIL), ETC

WHEN A SPECIFIC QUARTER IS NEEDED USE: WHERE DATEPART(QUARTER, COLUMN NAME) = 1(QUARTER 1), 2(QUARTER 2) ETC.

SELECT pizza_category, SUM(total_price) AS Total_Sales, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1) AS Percentage_Of_Sales

FROM pizza_sales

WHERE MONTH(order_date) = 1

GROUP BY pizza_category

E. Percentage Of Sales Per Size

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales, CAST(SUM(total_price) * 100 /

(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS Percentage_Of_Sale_Per_Size

FROM pizza_sales

GROUP BY pizza_size

ORDER BY Percentage_Of_Sale_Per_Size DESC

F. Total Number Of Sales Per Category

SELECT pizza_category, SUM(quantity) AS Total_Pizzas_Sold_Per_Category

FROM pizza_sales

GROUP BY pizza_category

ORDER BY Total_Pizzas_Sold_Per_Category DESC

G. Top 5

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Sold

FROM pizza_sales

GROUP BY pizza_name

ORDER BY Total_Sold DESC

H. Bottom 5

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Sold

FROM pizza_sales

GROUP BY pizza_name

ORDER BY Total_Sold ASC
