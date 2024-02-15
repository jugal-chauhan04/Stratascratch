/*
Top 5 States With 5 Star Businesses

Find the top 5 states with the most 5 star businesses.
Output the state name along with the number of 5-star
businesses and order records by the number of 5-star businesses in descending order.
In case there are ties in the number of businesses, return all the unique states.
If two states have the same result, sort them in alphabetical order.

TABLE: yelp_business
  
business_id: varchar
name: varchar
neighborhood: varchar
address: varchar
city: varchar
state: varchar
postal_code: varchar
latitude: float
longitude: float
stars: float
review_count: int
is_open: int
categories: varchar

SOLUTION
*/

WITH cte1 AS
(SELECT 
  state, business, RANK() OVER (ORDER BY business DESC) AS new
FROM(
SELECT 
  state, count(state) as business
FROM yelp_business
WHERE stars = 5
GROUP BY state
) AS a1
)

SELECT 
  cte1.state, cte1.business
from cte1
WHERE new <=5
ORDER BY cte1.business desc, cte1.state asc
