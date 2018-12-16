SELECT * from sales limit 100;
select item_no, item_description from public.products limit 100;
select distinct category_name, vendor from sales limit 100;
select distinct vendor from sales;
select distinct category_name from sales;
select distinct vendor_name from products where category_name = 'SCOTCH WHISKIES';
select distinct item_description from products where pack >12;
select distinct item_description from products where case_cost <70;
select distinct item_description from products where pack >12 AND case_cost <70;
select * from products where proof >= '85';
select distinct item_description from products where category_name = 'SCOTCH WHISKIES' OR proof >= '85';
select distinct category_name from products where category_name > 'TEQUILA';
SELECT * from products where category_name > 'SCOTCH WHISKIES' AND 
category_name < 'TEQUILA';
SELECT * FROM products WHERE category_name = 'SCOTCH WHISKIES' GROUP BY products.item_no, item_description;
SELECT sum(bottle_qty) from sales;
select sum(total) from sales;
select * from products where category_name = 'CANADIAN WHISKIES';