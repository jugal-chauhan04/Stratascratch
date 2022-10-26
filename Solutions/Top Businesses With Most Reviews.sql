/*
Find the top 5 businesses with most reviews.
Assume that each row has a unique business_id such that the total reviews for each business is listed on each row.
Output the business name along with the total number of reviews and order your results by the total reviews in descending order.

Table: yelp_business

business_id:varchar
name:varchar
neighborhood:varchar
address:varchar
city:varchar
state:varchar
postal_code:varchar
latitude:float
longitude:float
stars:float
review_count:int
is_open:int
categories:varchar
*/

SELECT
      name,
      sum(review_count) AS review_count
FROM 
      yelp_business
GROUP BY 
      name
ORDER BY 
      sum(review_count) DESC
LIMIT 5

