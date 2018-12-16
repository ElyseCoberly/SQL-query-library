select * from events
	where event_code = 26;
select *, replace(data1, 'windows', '')
	cast(replace as numeric)
	from events
	where event_code = 26
	;
select avg(cast(replace(data1, 'windows', '') as numeric))
	from events
	where event_code = 26;
select avg(cast(replace(data2, 'tabs', '') as numeric))
	from events
	where event_code = 26;
select avg(cast(replace(data1, 'windows', '') as numeric))
	from events
	where event_code = 26;
select * from events
	where event_code = 8;
select avg(cast(replace(data1, 'total bookmarks', '') as numeric))
	from events
	where event_code = 8;
select max(cast(replace(data1, 'total bookmarks', '') as numeric))
	from events
	where event_code = 8;
select avg(cast(replace(data2, 'folders', '') as numeric))
	from events
	where event_code = 8;
select min(cast(replace(data2, 'folders', '') as numeric))
	from events
	where event_code = 8;
select max(cast(replace(data2, 'folders', '') as numeric))
	from events
	where event_code = 8;
select avg(cast(replace(data3, 'folder depth', '') as numeric))
	from events
	where event_code = 8;
select min(cast(replace(data3, 'folder depth', '') as numeric))
	from events
	where event_code = 8;
select max(cast(replace(data3, 'folder depth', '') as numeric))
	from events
	where event_code = 8;

select * from events
	where event_code = 10;
select user_id, count(*) from events
	where event_code = 10
	group by user_id;
select * from events
	where event_code = 8;
select * from events
	where event_code = 9 or event_code= 11;
select user_id, count(user_id) from events
	where event_code = 9 or event_code= 11
	group by user_id
	order by user_id;


