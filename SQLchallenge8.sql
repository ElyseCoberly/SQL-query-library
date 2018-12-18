--SQL Challenge #8
--Show each office city, and the average number of orders per employee per office (without displaying the individual employee average). For example, say office ABC has 2 employees. Employee #1 was responsible for 2 orders, and employee #2 was responsible for 6 orders. Then your result set should show “ABC” for the first column (city), and “4” for the second column (avg orders per employee per office: (2+6)/2).

--employees total orders
SELECT employeeNumber, COUNT(orderNumber)
FROM employees
LEFT JOIN customers
    ON customers.salesRepEmployeeNumber=employees.employeeNumber
INNER JOIN orders
    ON orders.customerNumber=customers.customerNumber
GROUP BY employeeNumber

--everything but the average
SELECT offices.city, employeeNumber, COUNT(orderNumber)
FROM offices
INNER JOIN employees
    ON offices.officeCode=employees.officeCode
LEFT JOIN customers
    ON customers.salesRepEmployeeNumber=employees.employeeNumber
LEFT JOIN orders
    ON customers.customerNumber=orders.customerNumber
GROUP BY offices.city, employeeNumber
ORDER BY offices.city

--total orders per city
SELECT offices.city, COUNT(orderNumber)
FROM offices
INNER JOIN employees
    ON offices.officeCode=employees.officeCode
LEFT JOIN customers
    ON customers.salesRepEmployeeNumber=employees.employeeNumber
LEFT JOIN orders
    ON customers.customerNumber=orders.customerNumber
GROUP BY offices.city
ORDER BY offices.city

--total employees per city
SELECT city, COUNT(employeeNumber)
FROM offices
INNER JOIN employees
    ON employees.officeCode=offices.officeCode
GROUP BY city

--GOT IT!
SELECT offices.city, (COUNT(orderNumber)/emps) as avg_orders
FROM offices
INNER JOIN employees
    ON offices.officeCode=employees.officeCode
LEFT JOIN customers
    ON customers.salesRepEmployeeNumber=employees.employeeNumber
LEFT JOIN orders
    ON customers.customerNumber=orders.customerNumber
INNER JOIN  
    (SELECT offices.city, COUNT(employeeNumber) as emps
    FROM offices
    INNER JOIN employees
        ON employees.officeCode=offices.officeCode
    GROUP BY offices.city) as x
    ON offices.city=x.city
GROUP BY offices.city, emps