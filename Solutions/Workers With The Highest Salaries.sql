Find the titles of workers that earn the highest salary.
Output the highest-paid title or multiple titles that share the highest salary.

Table 1 : worker
worker_id: int
first_name: varchar
last_name: varchar
salary: int
joining_date: datetime
department: varchar

Table 2: title
worker_ref_id: int
worker_title: varchar
affected_from: datetime


SELECT
      t.worker_title
FROM
      title t
JOIN
      worker w
ON
      t.worker_ref_id = w.worker_id
WHERE
      w.salary IN (select max(salary) from worker)
ORDER BY
      t.worker_title
      
OUTPUT

worker_title

Asst. Manager
Manager
