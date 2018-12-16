/* Intro to subqueries */


/* Classify the amount of mL per product (bottle_size * product * inner_pack from products) 
	into three categories: high volume, med volume, and low volume */ 
select item_description, volume,
	case when a.volume >= 50000 then 'high volume'
	when a.volume >= 7500 then 'med volume'
	else 'low volume'
	end as volume_category
from(select item_description, (bottle_size * pack * inner_pack) as volume from products) as a;

/* Subquery as a quasi-filter */
/* What are all of the sales that occurred in a county with fewer than 100,000 people? */

select * from sales s
	where s.county in (select c.county from counties c where c.population < 100000);

/* count how many counties fit into each category of large, medium, or small */
select size, count(county) 
from (select county, 
	case 
		when population >= 400000 then 'Large'
		when population >= 100000 then 'Medium'
		else 'Small'
		end as size
		from counties) a
	group by size;

/* which stores are in counties with more than 400,000 residents? */

/* inner query - counties with >= 400000; outer query - stores in those counties */
select distinct b.store from sales b
	where b.county in (select a.county
	from counties a
	where population >= 400000);
/* use subquery as data source for a join */
select distinct b.store from sales b
	inner join (select
		a.county, b.population
		from counties a 
		where population >= 400000) as c
	b.county = c.county;

/* how many stores are in counties... */
select count(distinct b.store) from sales b
	where b.county in (select a.county
	from counties a
	where population >= 400000);

/* what percent of sales were over $100? */
select avg(case
	when total > 100 then 1
	else 0
	end)
	from sales;

/* which counties have the highest sale of whiskey or vodka products? */
select county, count(*) from 
		(select county from sales b
			where category_name like '%WHISK%' or category_name like '%VODKA%') a
	group by a.county
	order by count(*) desc;
	
/* Which counties have the highest sale of items over 80 proof? (incomplete) */
select county, count(*) from
	inner join
		(select item_no from products p
			where cast(proof as numeric) > 80) a
	group by a.county
	order by count(*) desc;
	
/* What are top 5 counties in terms of mL per capita? 
How do they compare to the counties you recommend for the pilot program? */
/* What percentage of sales per county are over $100? What are the top 5 counties? */
/* What were the top 5 categories of liquor sold (based on number of sales) 
in the five most populous counties? */
