/*
Calculate each user's average session time.
A session is defined as the time difference between a page_load and page_exit.
For simplicity, assume a user has only 1 session per day and if there are multiple of the same events on that day,
consider only the latest page_load and earliest page_exit.
Output the user_id and their average session time.

Table: facebook_web_log

user_id: int
timestamp: datetime
action: varchar
*/

WITH page_load AS
(
SELECT
      user_id, date(timestamp), max(timestamp) as max_timestamp
FROM
      facebook_web_log
WHERE
      action = 'page_load'
GROUP BY
      user_id, date(timestamp)
),
page_exit AS
(
SELECT
      user_id, date(timestamp), min(timestamp) as min_timestamp
FROM
      facebook_web_log
WHERE
      action = 'page_exit'
GROUP BY
      user_id, date(timestamp)
)
SELECT
      pe.user_id, avg(pe.min_timestamp - pl.max_timestamp)
FROM
      page_load pl
JOIN
      page_exit pe
ON
      pl.user_id = pe.user_id
GROUP BY
      pe.user_id
