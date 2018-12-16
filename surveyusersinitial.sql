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

