--https://www.sqlprep.com/sc_dailychallenge/daily-challenge-3/
--Show the product name, product description, and product line for the product in each product line that has the highest volume of gross revenue

--make revenue column
SELECT
    (orderdetails.quantityOrdered * orderdetails.priceEach) 
    AS revenue
FROM orderdetails

--join revenue to product info
SELECT
    products.productName,
    products.productDescription,
    products.productLine,
    (orderdetails.quantityOrdered * orderdetails.priceEach) 
    AS revenue
FROM orderdetails
INNER JOIN products ON orderdetails.productCode = products.productCode 

--find max revenue from each product line
SELECT productLine, MAX(revenue) as maxrev
FROM
    (SELECT 
        products.productName,
        products.productLine, 
        products.productDescription,
        (orderdetails.quantityOrdered * orderdetails.priceEach) 
        AS revenue
    FROM orderdetails
    INNER JOIN products ON orderdetails.productCode = products.productCode) sub
GROUP BY productLine

--self join the results to the same table
SELECT 
    sub.productName,
    sub.productDescription,
    sub.productLine,
    x.maxrev
FROM (
    SELECT productLine, MAX(revenue) as maxrev
    FROM
        (SELECT 
            products.productName,
            products.productLine, 
            products.productDescription,
            (orderdetails.quantityOrdered * orderdetails.priceEach) 
            AS revenue
        FROM orderdetails
        INNER JOIN products ON orderdetails.productCode = products.productCode) sub
    GROUP BY productLine
) as x
INNER JOIN sub ON x.productLine = sub.productLine

--all the stuff you need
SELECT 
    products.productName,
    products.productDescription,
    products.productLine,
    (orderdetails.quantityOrdered*orderdetails.priceEach) as revenue
FROM
    products
INNER JOIN 
    orderdetails ON products.productCode=orderdetails.productCode

--correct answer:
--calculate revenue, associate with productCode and store as derived table cte1 using WITH
WITH cte1 AS (
    SELECT productCode
        , SUM(quantityOrdered*priceEach) as totalOrdered
    FROM orderdetails
    GROUP BY productCode
) 
--join needed info from products to cte1, store needed info in derived table p
SELECT productName
    , productDescription
    , productLine
FROM products p 
    JOIN cte1 ON p.productCode = cte1.productCode

--get only the products with max revenue, self join into final results derived table p2
WHERE cte1.totalOrdered = 
    (SELECT MAX(totalOrdered)
    FROM cte1 
    JOIN products p2 ON p2.productCode = cte1.productCode
    WHERE p2.productLine = p.productLine)