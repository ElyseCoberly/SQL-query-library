select distinct * from products where case_cost < 100;
select * from products where category_name = 'TEQUILA';
SELECT item_description from products where category_name = 'TEQUILA' and case_cost > 100;
SELECT item_description from products 
where category_name = 'TEQUILA' or 'SCOTCH WHISKIES';
select * from products
	where shelf_price between 4 and 10;
select item_description from products
	where category_name in ('SCOTCH WHISKIES','TEQUILA') AND case_cost > 100;
select item_description from products
	where category_name in ('SCOTCH WHISKIES','TEQUILA') and case_cost between 100 and 120;
select item_description from products
	where category_name like '%WHISKIES%' and case_cost > 100;
select item_description from products
	where category_name like '%WHISKIES%' and case_cost between 100 and 150;
select item_description from products
	where category_name not like '%TEQUILA%' and case_cost between 100 and 120;
select a.store, b.category_name
	from sales a inner join products b
		on a.description = b.item_description
	where b.category_name = 'TEQUILA';
select s1.store, s1.date, s2.name, s2.store_status
	from sales s1
	left outer join stores s2
		on s1.store = s2.store
	where s1.date = '2014-11-13';
/* Were there any sales in the database completed at an inactive store? */
select sa.store, sa.date, st.name, st.store_status
	from sales sa
	left outer join stores st
		on sa.store = st.store
	where st.store_status = 'I';
/* Which sales included tequila products? */
select sa.date, p.item_description
	from sales sa
	inner join products p
		on sa.description = p.item_description
	where p.category_name = 'TEQUILA'
	limit 100;
/* Which Tequila products were not sold? */
select p.item_description
	from sales sa
	right outer join products p
		on sa.description = p.item_description
	where sa.description is null
	and p.category_name = 'TEQUILA';
/* Which distinct products were sold in Mason City IA? - 3 table join*/
select p.item_description
	from products p
	inner join sales sa
		on p.item_no = sa.item
	inner join stores st
		on sa.store = st.store
	where ...
/* List all products and the stores they were sold at 
(or use the default of 'no sale' if the product was not sold) */
/* Were there any sales of products that are not listed in the product table? */
/* Were there any sales occurring at a store that does not exist? */
