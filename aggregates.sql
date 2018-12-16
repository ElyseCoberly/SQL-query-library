select distinct item_description, bottle_size, pack from products 
	where bottle_size >= 1000 and pack <= 10;
/* aggregate function count() */
select count(*) from products;
select vendor_name, count(*) from products
	group by vendor_name;
select category_name, count(*) from products
	group by category_name;
/* to find # of products for each combo of category and vendor */
select category_name, vendor_name, count(*) from products
	group by category_name, vendor_name;
/* demonstrate order by */
select category_name, vendor_name, count(*) from products
	group by category_name, vendor_name
	order by category_name;
select category_name, vendor_name, count(*) from products
	group by category_name, vendor_name
	order by vendor_name;
/* What is the average bottle size per category name and item description? */
select category_name, item_description, avg(bottle_size) from products
	group by category_name, item_description
	order by category_name;
/* What is the minimum proof per category name and vendor name? */
select category_name, vendor_name, min(cast(proof as int))
	from products
	group by category_name, vendor_name
	order by category_name;
/* What is the maximum bottle size per category name?, What is the maximum bottle size in general? */
select category_name, max(bottle_size) from products
	group by category_name;
select max(bottle_size) from products;
/* How transactions occured per store? */
select store, count(date) from sales
	group by store
	order by store;
/* What are the total sales ($) per store (from the sales table) */
select store, sum(total) from sales
	group by store
	order by store;
/* What are the total bottles sold per store? Per store and per item? */
select store, sum(bottle_qty) from sales
	group by store
	order by store;
select store, item, sum(bottle_qty) from sales
	group by store, item
	order by store;
/* How many products are available per vendor? */
select vendor_name, count(item_no) from products
	group by vendor_name
	order by count(item_no);
/* How many products of each category are available per vendor? */
select vendor_name, category_name, count(item_no) from products
	group by vendor_name, category_name
	order by vendor_name;
/* HAVING filters based on function results */
select vendor_name, count(*) as num_products 
	from products 
	group by vendor_name 
	having count(*) > 10;
/* How many products does each category have? */
select category_name, count(item_no) from products
	group by category_name;
/* Which categories have more than 100 products? */
select category_name, count(item_no) as total_items from products
	group by category_name
	having count(item_no) > 100;
/* What is the average bottle size of each category? */
select category_name, avg(bottle_size) as avg_bottle_size
	from products
	group by category_name;
/* What is the average bottle size per category of whiskey? */
select category_name, avg(bottle_size) as avg_bottle_size
	from products
	where category_name like '%WHISK%'
	group by category_name;
/* What is the average bottle size per vendor of whiskey?*/
select vendor_name, avg(bottle_size) as avg_bottle_size
	from products
	where category_name like '%WHISK%'
	group by vendor_name
	order by vendor_name;
/* What is the average bottle size per category and vendor of whiskey?*/
select category_name, vendor_name, avg(bottle_size) as avg_bottle_size
	from products
	where category_name like '%WHISK%'
	group by category_name, vendor_name
	order by vendor_name;
/* Explain why the previous two questions do not yield the same results. */
	/* by vendor combines all categories of whiskey into one average */
/* What are the (unique) vendors that sell Tequilas? */
select distinct vendor_name, category_name
	from products
	where category_name = 'TEQUILA'
	order by vendor_name;
/* What are the (unique) vendors that sell Tequilas with bottle sizes over 1500? */
select distinct vendor_name, category_name, bottle_size
	from products
	where category_name = 'TEQUILA' and bottle_size > 1500
	order by vendor_name;
