create database sql_project_2;
use sql_project_2;

create table nyc_1(
id int,
name varchar(250),
host_id int,
host_name varchar(25),
neighbourhood_group varchar(25),
neighbourhood varchar(25),
room_type varchar(25));

select * from nyc_1;

create table nyc_2(
id int,
price int,
minimum_nights int,
number_of_reviews int,
reviews_per_month float,	
calculated_host_listings_count int,
availability_365 int);

select * from nyc_2;

update nyc_2 
set reviews_per_month = 0 where reviews_per_month is null;

-- 1. write query to show name from NYC_1

select name from nyc_1;

-- 2. write query to show count of id in nyc_1

select count(id) from nyc_1;

-- 3. write query to show count of id in nyc_2

select count(id) from nyc_2;

-- 4. write query to show host id in nyc_1

select host_id from nyc_1;

-- 5. write query to show all unique host id from nyc_1

select distinct host_id from nyc_1;

-- 6. write query to show all unique neighbourhood_group from 
-- nyc_1

select distinct(neighbourhood_group) from nyc_1;

-- 7. write query to show all unique neighbourhood from nyc_1

select distinct(neighbourhood) from nyc_1;

-- 8. write query to show room_type from nyc_1

select room_type from nyc_1;

-- 9. write query to show all values of Brooklyn & Manhattan from 
-- nyc_1

select * from nyc_1 where neighbourhood_group in ("Brooklyn","Manhattan");

-- 10. write query to show unique value of room type from nyc_1

select distinct(room_type) from nyc_1;

-- 11. write query to show maximum price from nyc_2

select max(price) from nyc_2;

-- 12.write query to show maximum price from nyc_2

select max(price) from nyc_2;

-- 13. write query to show average price from nyc_2

select AVG(Price) from nyc_2;

-- 14.write query to show minimum value of minimum_nights from 
-- nyc_2

select min(minimum_nights) from nyc_2;

-- 15.write query to show maximum value of minimum_nights from 
-- nyc_2

select max(minimum_nights) from nyc_2;

-- 16. write query to show average availability_365

select avg(availability_365) from nyc_2;

-- 17.write query to show id , availability_365 and all availability_365 
-- value is greater than 300

select id,availability_365 from nyc_2 
where availability_365 > 300;

-- 18. write query to show count of id where price is in between 300 to 
-- 400

select count(id) from nyc_2 where price between 300 and 400;

-- 19. write query to show count of id where minimum_nights spend 
-- is less than 5

select count(id) from nyc_2 where minimum_nights < 5;

-- 20.write query to show count where minimum_nights spend is 
-- greater than 100

select count(id) from nyc_2 where minimum_nights > 100;

-- 21. write query to show all data of nyc_1 & nyc_2

select * from nyc_1 join nyc_2
on nyc_1.id = nyc_2.id;

-- 22. write query to show host name and price

select distinct n1.host_name,n2.price from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id;

-- 23. write query to show room_type and price

select distinct n1.id,n1.room_type, n2.price from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id;

-- 24. write query to show neighbourhood_group&minimum_nights 
-- spend

select distinct n1.neighbourhood_group,n2.minimum_nights from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id;

-- 25. write query to show neighbourhood & availability_365

select distinct n1.neighbourhood,n2.availability_365 from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id;

-- 26.write query to show total price by neighbourhood_group

select n1.neighbourhood_group,sum(n2.price) as total_price 
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
group by n1.neighbourhood_group;

-- 27.write query to show maximum price by neighbourhood_group

select n1.neighbourhood_group, max(n2.price)
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id 
group by n1.neighbourhood_group;

-- 28.write query to show maximum night spend by 
-- neighbourhood_group

select n1.neighbourhood_group, max(n2.minimum_nights)
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
group by n1.neighbourhood_group;

-- 29.write query to show maximum reviews_per_month spend by 
-- neighbourhood

select n1.neighbourhood, max(n2.reviews_per_month)
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
group by n1.neighbourhood;

-- 30.write query to show maximum price by room type

select n1.room_type,max(n2.price)
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
group by n1.room_type;

-- 31.write query to show average number_of_reviews by room_type

select n1.room_type, avg(n2.number_of_reviews) 
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
group by n1.room_type;

-- 32.write query to show average price by room type

select n1.room_type, avg(n2.price) 
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
group by n1.room_type;

-- 33.write query to show average night spend by room type

select n1.room_type, avg(n2.minimum_nights)
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
group by n1.room_type;

-- 34.write query to show average price by room type but average 
-- price is less than 100

select n1.room_type,avg(n2.price)
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
group by n1.room_type;

-- 35.write query to show average night by neighbourhood and 
-- average_nights is greater than 5

select n1.neighbourhood, avg(n2.minimum_nights) as average_nights
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id 
group by n1.neighbourhood having average_nights > 5;

-- 36. write query to show all data from nyc_1 and price is greater 
-- than 200 using sub-query

select * from nyc_1 where id in (select id from nyc_2 where price > 200);

-- 37. write query to show all values from nyc_2 table and host id is 
-- 314941

select * from nyc_2 where id in (select id from nyc_1 where host_id = 314941);

-- 38. Find all pairs of id having the same host id, each pair coming 
-- once only.

select distinct n.id , n.host_id from nyc_1 n, nyc_1 n1 
where  n.host_id =  n1.host_id 
and n.id != n1.id  
order by host_id asc;

-- 39.write sql query to show fetch all records that have the term cozy 
-- in name

select * from nyc_1 where name like '%cozy%';

-- 40. write query to show price host id neighbourhood_group of 
-- manhattan neighbourhood_group

select distinct  n2.price,n1.host_id 
from nyc_1 n1 join nyc_2 n2
on n1.id = n2.id 
where neighbourhood_group = 'manhattan';

-- 41.write query to show id , host name, neighbourhood and price 
-- but only for Upper West Side & Williamsburg neighbourhood 
-- also price is greater than 100

select distinct n1.id,n1.host_name,n1.neighbourhood,n2.price
from nyc_1 n1 join nyc_2 n2
on n1.id = n2.id 
where n1.neighbourhood in ('Upper West Side','Williamsburg')
and n2.price > 100;

-- 42.write query to show id , host name, neighbourhood and price for 
-- host name Elise and neighbourhood is Bedford-Stuyvesant

select distinct n1.id,n1.host_name,n1.neighbourhood,n2.price
from nyc_1 n1 join nyc_2 n2
on n1.id = n2.id 
where n1.host_name = 'elise' and n1.neighbourhood is 'Bedford-Stuyvesant'

-- 43. write query to show 
-- host_name,availability_365,minimum_nights only for 100+ 
-- availability_365 and minimum_nights

select n1.host_name,n2.availability_365,n2.minimum_nights 
from nyc_1 n1 join nyc_2 n2
on n1.id = n2.id 
where availability_365 > 100 and minimum_nights > 100;

-- 44. write query to show to fetch id ,host_name , number_of_reviews, 
-- and reviews_per_month but show only that records where 
-- number of reviews are 500+ and review per month is 5+

select n1.id,n1.host_name,n2.number_of_reviews,n2.reviews_per_month
from nyc_1 n1 join nyc_2 n2
on n1.id = n2.id
where `number_of_reviews` > 500 and reviews_per_month > 5

-- 45. write query to show neighbourhood_group which have most 
-- total number of review

select n1.neighbourhood_group,sum(n2.number_of_reviews) 
from nyc_1 n1 join nyc_2 n2
on n1.id = n2.id 
group by n1.neighbourhood_group order by sum(n2.number_of_reviews) desc limit 1;

-- 46. write query to show host name which have most cheaper total 
-- price

select n1.host_name,sum(n2.price) 
from nyc_1 n1 join nyc_2 n2
on n1.id = n2.id 
group by n1.host_name 
order by sum(n2.price) asc 
limit 1;

-- 47. write query to show host name which have most costly total price

select n1.host_name,sum(n2.price) 
from nyc_1 n1 join nyc_2 n2
on n1.id = n2.id 
group by n1.host_name 
order by sum(n2.price) desc 
limit 1;

-- 48. write query to show host name which have max price using subquery

select host_name from nyc_1 
where id in (select id from nyc_2 where price = (select max(price) from nyc_2));

select n1.host_name,n2.price
from nyc_1 n1 join nyc_2 n2
on n1.id = n2.id
where n2.price in (select max(price) from nyc_2);

-- 49. write query to show neighbourhood_group which price are less 
-- than 100

select distinct n1.neighbourhood_group,n2.price
from nyc_1 n1 join nyc_2 n2
on n1.id = n2.id
where price < 100;

-- 50. write query to find max price, average availability_365 for each 
-- room type and order in ascending by maximum price

select n1.room_type,max(n2.price),avg(n2.availability_365)
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
group by n1.room_type
order by max(n2.price) asc;