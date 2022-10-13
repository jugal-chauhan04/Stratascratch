/*
Find the customer with the highest daily total order cost between 2019-02-01 to 2019-05-01.
If customer had more than one order on a certain day, sum the order costs on daily basis.
Output customer's first name, total cost of their items, and the date.

For simplicity, you can assume that every first name in the dataset is unique.

Tables: customers, orders

customers
id: int
first_name: varchar
last_name: varchar
city: varchar
address: varchar
phone_number: varchar

orders
id: int
cust_id: int
order_date: datetime
order_details: varchar
total_order_cost: int
*/

WITH total_orders AS
(
SELECT
      cust_id,
      order_date,
      sum(total_order_cost) AS total_cost
FROM
      orders
WHERE 
      order_date BETWEEN '2019-02-01' AND '2019-05-01'
GROUP BY
      order_date, cust_id
ORDER BY
      total_cost DESC
LIMIT 1
)
SELECT
      c.first_name,
      t.total_cost,
      t.order_date
FROM 
      total_orders t
JOIN 
      customers c
ON t.cust_id = c.id
