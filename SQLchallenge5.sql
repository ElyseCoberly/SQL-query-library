--SQL Challenge #5
--https://www.sqlprep.com/sc_dailychallenge/daily-challenge-5/
--We need to get some feedback from all of the employees who have sold Harley Davidson Motorcycles. Get a report of the employee first names and emails for all employees who have ever sold a Harley.


SELECT DISTINCT firstName, email
FROM employees
--multiple joins to access product name information

LEFT JOIN customers 
    ON employees.employeeNumber=customers.salesRepEmployeeNumber
INNER JOIN orders
    ON customers.customerNumber=orders.customerNumber
INNER JOIN orderdetails
    ON orders.orderNumber=orderdetails.orderNumber
RIGHT JOIN products
    ON orderdetails.productCode=products.productCode

--find product name that contains Harley anywhere in the string
WHERE productName LIKE '%Harley%'