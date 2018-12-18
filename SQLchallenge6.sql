--SQL Challenge #6
--We want to display information about customers from France and the USA. Show the customer name, the contact first and last name (in the same column), and the country for all of these customers

SELECT DISTINCT
customerName,
CONCAT(contactFirstName, ' ', contactLastName) AS contact,
country
FROM customers
WHERE country IN ('France', 'USA')