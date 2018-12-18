--SQL Daily Challenge #1
--Show the customer name for all customers who have ever made a payment over $100,000.
--https://www.sqlprep.com/sc_dailychallenge/daily-challenge-1/

--distinct returns each unique customer name, instead of the customer name from each payment over $100000

SELECT DISTINCT customerName
FROM customers
    INNER JOIN payments 
    ON customers.customerNumber=payments.customerNumber
WHERE amount>100000