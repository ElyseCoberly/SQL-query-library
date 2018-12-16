/* Number of bottles given pack and inner pack */
select category_name, item_description, pack * inner_pack as total_bottles
	from products;

/* square root of bottle size */
select item_description, round(sqrt(bottle_size)) 
	from products;

/* ratio of shelf price to bottle price, sorted highest to lowest */
select (cast(shelf_price as numeric)/cast(bottle_price as numeric)) as markup
	from products
	/* to avoid division by 0 error */
	where cast(bottle_price as numeric)> 0
	order by (cast(shelf_price as numeric)/cast(bottle_price as numeric)) desc;

/* which products have null case_costs? */
select item_description, case_cost
	FROM products
	where case_cost is null;
/* Calculate the difference between shelf price and bottle price for each product */
select item_description, (cast(shelf_price as numeric) - cast(bottle_price as numeric)) 
	as markup_difference
	from products;
/* Calculate the price (using bottle price) per mL (using bottle size) for each product */
select item_description, 
	(cast(bottle_price as numeric)/cast(bottle_size as numeric)) as price_per_mL
	from products
	where cast(bottle_size as numeric) > 0;
/* Which 5 products cost the most per mL? */
select *, 
	(cast(bottle_price as numeric)/cast(bottle_size as numeric)) as price_per_mL
	from products
	where cast(bottle_size as numeric) > 0
		and (cast(bottle_price as numeric)/cast(bottle_size as numeric)) is not null
	order by (cast(bottle_price as numeric)/cast(bottle_size as numeric)) desc
	limit 5;
/* What are the top 20 most marked up products based on the difference? 
	Do not include nulls in your answer and make sure to only return 20 rows */
select item_description, 
	cast((cast(shelf_price as numeric) - cast(bottle_price as numeric)) as money) 
		as markup_difference
	from products
	where cast((cast(shelf_price as numeric) - cast(bottle_price as numeric)) as money) is not null
	order by cast((cast(shelf_price as numeric) - cast(bottle_price as numeric)) as money) desc
	limit 20;
