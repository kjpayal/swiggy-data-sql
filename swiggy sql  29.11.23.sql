use online_food;
show tables;

describe swiggy;

#Set ID column as a primary key
alter table swiggy
add primary key(ID);
describe swiggy;

#Find total rows in dataset.
select count(*) from swiggy;


#Find total number of unique restaurants in dataset.
select count(distinct(Restaurant))
from swiggy;

#Find how many unique cities are there.
 select count(distinct(City)) from swiggy;

#Find total restaurant in each city.
 select City, count(Restaurant) as total_hotels
 from swiggy
 group by City
 order by total_hotels desc;

select City, count(Restaurant) as total_hotels
from swiggy
group by City
having total_hotels>=1000
order by total_hotels desc;

#Find a Restaurant from Hyderabad which serves fast food or chinese or mughlai or indian food

select restaurant, food_type
from swiggy
where city = 'Hyderabad' and
food_type in  ('Fast Food','Chinese','Mughlai','Indian food');

# List top 3 restaurant having maximum number of orders

select restaurant, count(ID) as no_of_order
from swiggy
group by restaurant
order by no_of_order Desc limit 3;


select restaurant, count(ID) as orders,
dense_rank() over (order by count(ID) desc) as rankk
from swiggy
group by restaurant
limit 5;
#Getting restaurants having rank 3 in terms of orders
select*from(select restaurant, count(ID) as orders,
dense_rank() over (order by count(ID) desc) as rankk
from swiggy
group by restaurant) as order_rank
where rankk = 3;

#Find average delivery time
select avg(delivery_time)from swiggy;


