--SQL Challenge #2
--https://www.sqlprep.com/sc_dailychallenge/daily-challenge-2/
--Show the product code, product name, and quantity in stock of all products that have a purchase price greater than the average.

SELECT
productCode,
productName,
quantityInStock
FROM
products
WHERE 
--use a subquery to calculate the average and compare that to the buyPrice
    (SELECT
        AVG(buyPrice)
    FROM products)
    < buyPrice