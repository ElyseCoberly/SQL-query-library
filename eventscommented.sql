/* Gender of users - M: 3719, F: 257, Null: 105*/
select count(user_id), case
		when cast(q5 as integer) = 0 then 'Male'
		when cast (q5 as integer) = 1 then 'Female'
		else 'Null'
		end as gender
	from survey
	group by gender;

/*Age of Users */

select count(user_id), case
		when cast(q6 as integer) = 0 then 'under 18'
		when cast (q6 as integer) = 1 then '18-25'
		when cast(q6 as integer) = 2 then '26-35'
		when cast(q6 as integer) = 3 then '36-45'
		when cast(q6 as integer) = 4 then '46-55'
		when cast(q6 as integer) = 5 then '56+'
		else 'Null'
		end as age
	from survey
	group by age;

/* Browser use - Is the user dedicated to Firefox? */
select count(user_id), case
		when cast(q4 as integer) < 2 then 'Yes'
		when cast(q4 as integer) >= 2 then 'No'
		else 'Null'
		end as firefox_use
	from survey
	group by firefox_use;

/* Time spent online */
select count(user_id), case
		when cast(q7 as integer) = 0 then '0-1 hrs'
		when cast(q7 as numeric) = 1 then '1-2 hrs'
		when cast(q7 as integer) = 2 then '2-4 hrs'
		when cast(q7 as integer) = 3 then '4-6 hrs'
		when cast(q7 as integer) = 4 then '6-8 hrs'
		when cast(q7 as integer) = 5 then '8-10 hrs'
		when cast(q7 as integer) = 6 then '10+ hrs'
		else 'Null'
		end as time_online
	from survey
	group by time_online
	order by time_online;

/* Reasons to use the internet */
select count(q11) from survey where q11 like '%0%';
select count(q11) from survey where q11 like '%1%';
select count(q11) from survey where q11 like '%0%' or q11 like '%1%' or q11 like '%2%';

/* Length of time using Firefox */
select count(user_id), case
		when cast(q1 as integer) < 2 then 'New (less than 6mo)'
		when cast(q1 as integer) between 2 and 3 then 'Intermediate (6mo - 2yrs)'
		when cast(q1 as integer) > 3 then 'Experienced (2yrs+)'
		else 'Null'
		end as time_w_firefox
	from survey
	group by time_w_firefox;

/*Overall records */
select * from survey;
select count(*) from survey;
select distinct count(user_id) from users;
select distinct id from users;

/* Number of tabs in use, weighted by frequency - avg, 6.68; max, 1103; min, 0; median, 3 */
select avg(cast(replace(data2, 'tabs', '') as numeric))
	from events
	where event_code = 26;
select max(cast(replace(data2, 'tabs', '') as numeric))
	from events
	where event_code = 26;
select min(cast(replace(data2, 'tabs', '') as numeric))
	from events
	where event_code = 26;
select median(cast(replace(data2, 'tabs', '') as numeric))
	from events
	where event_code = 26;
	
/* Number of windows in use, weighted by frequency - avg, 1.21; min, 0; max, 27; median, 1 */
select avg(cast(replace(data1, 'windows', '') as numeric))
	from events
	where event_code = 26;
select min(cast(replace(data1, 'windows', '') as numeric))
	from events
	where event_code = 26;
select max(cast(replace(data1, 'windows', '') as numeric))
	from events
	where event_code = 26;
select median(cast(replace(data1, 'windows', '') as numeric))
	from events
	where event_code = 26;
		
/* Summary stats on total bookmarks - avg, 106.71; min, 0; max, 19883; med, 28 */
select avg(cast(replace(data1, 'total bookmarks', '') as numeric))
	from events
	where event_code = 8;
select max(cast(replace(data1, 'total bookmarks', '') as numeric))
	from events
	where event_code = 8;
select min(cast(replace(data1, 'total bookmarks', '') as numeric))
	from events
	where event_code = 8;
select median(cast(replace(data1, 'total bookmarks', '') as numeric))
	from events
	where event_code = 8;
	
/* Summary stats on folders - avg, 10.74; min, 0; max, 2870; med, 2 */
select avg(cast(replace(data2, 'folders', '') as numeric))
	from events
	where event_code = 8;
select min(cast(replace(data2, 'folders', '') as numeric))
	from events
	where event_code = 8;
select max(cast(replace(data2, 'folders', '') as numeric))
	from events
	where event_code = 8;
select median(cast(replace(data2, 'folders', '') as numeric))
	from events
	where event_code = 8;

/* Summary stats on folder depth - avg, 1.25; min, 0; max, 11; med, 1 */
select avg(cast(replace(data3, 'folder depth', '') as numeric))
	from events
	where event_code = 8;
select min(cast(replace(data3, 'folder depth', '') as numeric))
	from events
	where event_code = 8;
select max(cast(replace(data3, 'folder depth', '') as numeric))
	from events
	where event_code = 8;
select median(cast(replace(data3, 'folder depth', '') as numeric))
	from events
	where event_code = 8;

/* How many users created bookmarks? - 996 What fraction of users created bookmarks? 6.8% */
select count(distinct user_id)
from (select * from events
	where event_code = 9) as a;

select distinct b.user_id
from (select * from events
	where event_code != 9) as b;

select count(distinct user_id) from events;

/* How many launched a bookmark? - 6534 What fraction of users launched at 
least one bookmark during the sample week? - 44.4%*/
select a / b from
	(select count(distinct user_id)
		from 
		(select * from events
		where event_code = 10) as c) as a
	(select count(distinct user_id) from events) as b;

/* What's the distribution of how often bookmarks are used? 60635 times*/
select count(user_id), bookmark_choose_bin from
(select user_id, count(user_id), 
	case
		when count(user_id) >= 25 then 6
		when count(user_id) >= 20 then 5
		when count(user_id) >= 15 then 4
		when count(user_id) >= 10 then 3
		when count(user_id) >= 5 then 2
		else 1
		end as bookmark_choose_bin
	from events 
	where event_code = 10
	group by user_id) as a
	group by bookmark_choose_bin
	order by bookmark_choose_bin;


/* How does number of bookmarks correlate with how long the user has been using firefox?
 */
select a.q1, median(cast(replace(a.data1, 'total bookmarks', '') as numeric))
from
 (select distinct s.q1, s.user_id, e.data1
	from survey s inner join events e
		on s.user_id = e.user_id
	where e.event_code = 8) as a
	group by q1
	order by q1;

/* What's the distribution of maximum number of tabs? */

select count(distinct user_id), max_tab_bin
from (select user_id,
	max(cast(replace(data2, 'tabs', '') as numeric)),
	case
		when max(cast(replace(data2, 'tabs', '') as numeric)) >= 25 then 6
		when max(cast(replace(data2, 'tabs', '') as numeric)) >= 20 then 5
		when max(cast(replace(data2, 'tabs', '') as numeric)) >= 15 then 4
		when max(cast(replace(data2, 'tabs', '') as numeric)) >= 10 then 3
		when max(cast(replace(data2, 'tabs', '') as numeric)) >= 5 then 2
		when max(cast(replace(data2, 'tabs', '') as numeric)) >= 1 then 1
		else 0
		end as max_tab_bin 
	from events 
	where event_code = 26
	group by user_id) as a
	group by max_tab_bin
	order by max_tab_bin;
	
/* Are there users who regularly have more than 10 tabs open? - 1053 users */
select distinct user_id, count(data2) from events
	where event_code = 26 and cast(replace(data2, 'tabs', '') as numeric) > 10
	group by user_id
	having count(data2) > 5
	order by user_id;

/* What fraction of user have ever had more than 5 tabs open? A
What fraction of users have ever had more than 10 tabs open? B
What fraction of users have had more than 15 tabs open? C

From distribution table - A, 41.4%; B, 13.2%; C, 5.7%*/

/* Is there a correlation between a large number of tabs and experiencing crashes? - 529 of 1053 users - 50.2%*/
/* Non-high-tab users who have experienced a session restore or restarted Firefox - 9718 of 13665 - 71.1% */
select distinct user_id from events
	where event_code = 3 or event_code = 20;

select distinct e.user_id, e.event_code from events e
	inner join
		(select distinct user_id, count(data2) from events
			where event_code = 26 and cast(replace(data2, 'tabs', '') as numeric) > 10
			group by user_id
			having count(data2) > 5
			order by user_id) as a
		on e.user_id = a.user_id
	where e.event_code = 3 or e.event_code = 20;

