select * from counties
	order by population;

/* use case statement to categorize counties into three population levels */
select county, population,
	case 
	when population >= 400000 then 'Large'
	when population >=100000 then 'Medium'
	else 'Small'
	end as county_size
from counties;

/* classify all types of whiskies as whiskey */
select *, 
	case when (category_name) like '%WHISK%' then 1
	else 0
	end as whiskey_flag
	from products
	limit 100; 
/* identify which are high proof >= 100 or low proof < 100 products */
select *, 
	case when cast(proof as numeric) >= 100 then 'high proof'
	else 'low proof'
	end as proof_category
	from products
	limit 100;
	
/* write a case statement to group products into 3 categories based on their proof */
select item_description, proof, case
	when (cast(proof as numeric)) >200 then 'Invalid'
	when (cast(proof as numeric)) >= 150 then 'Extreme'
	when (cast(proof as numeric)) >= 20 then 'High'
	else 'Low'
	end as proof_level
	from products
	order by proof_level;

/* write a case statement to group stores into tiers based on their total sales amount */

/* write a single case statement to categorize products as high-proof whiskies, 
low-proof whiskies, or other (any comparison operator can be used in the case statement)*/
select *, case
	when (cast(proof as numeric)) >= 100 and category_name like '%WHISK%'
		then 'high-proof whiskey'
	when (cast(proof as numeric)) < 100 and category_name like '%WHISK%'
		then 'low-proof whiskey'
	else 'other'
	end as whiskey_type
	from products;
/* determine percentage of products that are whiskey */
select avg(
	case
		when (category_name) like '%WHISK%' then 1
		else 0
	end as whiskey_flag	
	from products);
