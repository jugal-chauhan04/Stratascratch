/*
Compare each employee's salary with the average salary of the corresponding department.
Output the department, first name, and salary of employees along with the average salary of that department.

Table: employee

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

SELECT department, 
       first_name, 
       salary, 
       AVG(salary) over (PARTITION BY department) as average,
       (salary - AVG(salary) over (PARTITION BY department)) as difference
FROM employee;