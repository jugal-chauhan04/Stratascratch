/*
Find the most profitable company from the financial sector. Output the result along with the continent.

Table: forbes_global_2010_2014

company:varchar
sector:varchar
industry:varchar
continent:varchar
country:varchar
marketvalue:float
sales:float
profits:float
assets:float
rank:int
forbeswebpage:varchar
*/

SELECT 
      company,
      continent,
      sum(profits) AS profit
FROM 
      forbes_global_2010_2014
WHERE 
      sector = 'Financials'
GROUP BY 
      company, continent
ORDER BY
      profit desc
LIMIT 1
