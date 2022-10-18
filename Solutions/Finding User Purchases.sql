/*
Write a query that'll identify returning active users. 
A returning active user is a user that has made a second purchase within 7 days of any other of their purchases.
Output a list of user_ids of these returning active users.

Table: amazon_transactions

amazon_transactions

id:int
user_id:int
item:varchar
created_at:datetime
revenue:int
*/

SELECT DISTINCT
      first_user.user_id
FROM 
      amazon_transactions first_user
INNER JOIN
      amazon_transactions active_user
ON 
      first_user.user_id = active_user.user_id
      AND first_user.id <> active_user.id
      AND (first_user.created_at - active_user.created_at) BETWEEN 0 AND 7
ORDER BY
      first_user.user_id ASC
