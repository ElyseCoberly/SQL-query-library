--SQL Challenge #7
--We want to dig into customer order history. Show each customer name, along with date of their intial order and their most recent order. Call the initial order ‘first_order’ and the last one ‘last_order’. Also include any customers who have never made an order.

--this one doesn't return null values
SELECT
	customerName,
	MIN(orderDate) AS 'first_order',
	MAX(orderDate) AS 'last_order'
FROM customers
	INNER JOIN orders ON customers.customerNumber=orders.customerNumber
GROUP BY customerName

--I tried this with CASE - WHEN; ISNULL doesn't work with aggregate functions

--correct answer
--using a LEFT JOIN includes everything in the first group (customers) that don't have anything in the second group
SELECT customerName
, MIN(orderDate) AS first_order
, MAX(orderDate) AS last_order
FROM customers AS c 
LEFT JOIN orders AS o
ON c.customerNumber = o.customerNumber
GROUP BY customerName