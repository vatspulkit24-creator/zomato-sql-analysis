-- Zomato – SQL Data Analysis
-- Restaurant Business Analysis Using MySQL

-- 1 Total Restaurant Overview
-- Answer: This query identifies the total number of restaurants available in the Zomato dataset.
select count(*) as total_restaurants
from zomato_restaurant;

-- 2 City-wise Restaurant Distribution
-- Answer: This query identifies the number of restaurants in each city and finds which city has the highest restaurant count.
select city, count(*) as total_restaurants
from zomato_restaurant
group by city
order by total_restaurants desc;

-- 3 Top 10 Highest Rated Restaurants
-- Answer: This query identifies the top 10 restaurants with the highest customer ratings.
select `restaurant name`, city, `aggregate rating`
from zomato_restaurant
where `aggregate rating` > 0
order by `aggregate rating` desc
limit 10;

-- 4 Restaurant Rating Analysis
-- Answer: This query analyses the distribution of restaurants across different rating categories.
select `rating text`, count(*) as total_restaurants
from zomato_restaurant
group by `rating text`
order by total_restaurants desc;

-- 5 Average Restaurant Cost Analysis
-- Answer: This query calculates the average cost for two people across all restaurants.
select round(avg(`average cost for two`), 2) as average_cost
from zomato_restaurant;

-- 6 Price Range Distribution
-- Answer: This query identifies which price category contains the highest number of restaurants.
select `price range`, count(*) as total_restaurants
from zomato_restaurant
group by `price range`
order by total_restaurants desc;

-- 7 Top 10 Most Popular Cuisines
-- Answer: This query identifies the top 10 most popular cuisines based on the number of restaurants offering them.
select cuisines, count(*) as restaurant_count
from zomato_restaurant
where cuisines is not null
group by cuisines
order by restaurant_count desc
limit 10;

-- 8 Online Delivery Availability Analysis
-- Answer: Shows how many restaurants provide online delivery and how many do not.
select `has online delivery`, count(*) as total_restaurants
from zomato_restaurant
group by `has online delivery`;

-- 9 Table Booking Analysis
-- Answer: Identifies the number of restaurants that offer table booking and those that do not.
select `has table booking`, count(*) as total_restaurants
from zomato_restaurant
group by `has table booking`;

-- 10 City-wise Average Rating
-- Answer: Finds the average restaurant rating in each city and identifies cities with higher ratings.
select city, round(avg(`aggregate rating`), 2) as average_rating
from zomato_restaurant
where `aggregate rating` > 0
group by city
order by average_rating desc;

-- 11 Top 10 Most Voted Restaurants
-- Answer: Displays the top 10 restaurants with the highest number of customer votes.
select `restaurant name`, city, votes
from zomato_restaurant
order by votes desc
limit 10;

-- 12 Cost vs Rating Analysis
-- Answer: Compares average restaurant cost and average rating across different price categories.
select `price range`,
round(avg(`average cost for two`), 2) as average_cost,
round(avg(`aggregate rating`), 2) as average_rating
from zomato_restaurant
where `aggregate rating` > 0
group by `price range`
order by `price range`;

-- 13 