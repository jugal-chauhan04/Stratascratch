/*
Find the highest target achieved by the employee or employees who works under the manager id 13.
Output the first name of the employee and target achieved.
The solution should show the highest target achieved under manager_id=13 and which employee(s) achieved it.

Table: salesforce_employees

id:int
first_name:varchar
last_name:varchar
age:int
sex:varchar
employee_title:varchar
department:varchar
salary:int
target:int
bonus:int
email:varchar
city:varchar
address:varchar
manager_id:int
*/

WITH target_achieved AS
(
SELECT 
      first_name,
      max(target) AS target
FROM
      salesforce_employees
WHERE
      manager_id = 13
GROUP BY
      first_name
ORDER BY
      target DESC
)
SELECT *
FROM
      target_achieved
LIMIT 3
