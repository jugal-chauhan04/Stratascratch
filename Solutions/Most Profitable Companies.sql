/*
Find the 3 most profitable companies in the entire world.
Output the result along with the corresponding company name.
Sort the result based on profits in descending order.

forbes_global_2010_2014

company: varchar
sector: varchar
industry: varchar
continent: varchar
country: varchar
marketvalue: float
sales: float
profits: float
assets: float
rank: int
forbeswebpage: varchar

*/

SELECT
      company, profits
FROM
      forbes_global_2010_2014
ORDER BY
      profits DESC
LIMIT 3
