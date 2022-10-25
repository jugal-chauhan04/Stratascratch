/*
Find the top business categories based on the total number of reviews.
Output the category along with the total number of reviews.
Order by total reviews in descending order.

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

WITH Unnested AS
(
SELECT
    business_id,
    unnest(string_to_array("categories", ';')) AS Categories,
    review_count
FROM
    yelp_business
)
SELECT
    Categories,
    SUM(review_count) AS total_review
FROM 
    Unnested
GROUP BY 
    Categories
ORDER BY 
    total_review DESC
