--1 Total number of orders received.
SELECT COUNT(*) Total_orders
FROM orders

--2 Total revenue generated.
SELECT ROUND(SUM(p.price * od.quantity),2) [TotalRevenue]
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id

--3 Which pizza types are our highest and lowest priced pizza and how much do they cost?
-- 3a Highest priced
SELECT pt.pizza_type_id,pt.name, p.price [highest_priced]
FROM pizzas p
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
WHERE price = (SELECT MAX(price)
				FROM pizzas	
			)

-- 3b Lowest Priced
SELECT pt.pizza_type_id,pt.name, p.price [lowest_priced]
FROM pizzas p
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
WHERE price = (SELECT MIN(price)
				FROM pizzas	
			)

--4 Top 5 most ordered pizza types along with their name and  quantities.
SELECT TOP 5 pt.pizza_type_id, pt.name, COUNT(order_id) total_order, SUM(quantity) qty
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.pizza_type_id, pt.name
ORDER BY total_order DESC

--5 What does pizza orders look like by hour of the day?
SELECT DATEPART(HOUR, time) [Hours], COUNT(order_id) Total_Orders_Received
FROM orders
GROUP BY DATEPART(HOUR, time)
ORDER BY 1

--6 What is the average number of pizzas order quantity received per day?
SELECT AVG(qty) AvgQtyPerDay
FROM(SELECT o.date, SUM(od.quantity) AS qty
	FROM orders o
	JOIN order_details od ON o.order_id = od.order_id
	GROUP BY o.date
	) ordered_qty


-- CTE version 
WITH ordered_qty2 AS( 
SELECT o.date, SUM(od.quantity) AS qty
	FROM orders o
	JOIN order_details od ON o.order_id = od.order_id
	GROUP BY o.date
)
SELECT AVG(qty) AvgQtyPerDay2
FROM ordered_qty2


---7 What is the contribution of each pizza category to the total revenue?
SELECT pt.category, ROUND(SUM(p.price * od.quantity) /
				(SELECT SUM(p.price * od.quantity)
				FROM order_details od
				JOIN pizzas p ON od.pizza_id = p.pizza_id)* 100, 2) AS PercentContribution
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON pt.pizza_type_id = p.pizza_type_id
GROUP BY  pt.category
ORDER BY PercentContribution DESC


--8 What is the top 3 pizza types based on revenue for each pizza category?
WITH RankedCat AS (
	SELECT pt.category, pt.name, SUM(p.price * od.quantity) [Revenue],
	RANK() OVER (PARTITION BY pt.category ORDER BY SUM(p.price * od.quantity) DESC ) rank_no
	FROM order_details od
	JOIN pizzas p ON od.pizza_id = p.pizza_id
	JOIN pizza_types pt ON pt.pizza_type_id = p.pizza_type_id
	GROUP BY pt.category, pt.name
)
SELECT *
FROM RankedCat
WHERE rank_no <=3

--9 Which postcode area generated the highest pizza order.
-- Not possible