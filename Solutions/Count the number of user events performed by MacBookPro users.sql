/*
Count the number of user events performed by MacBookPro users.
Output the result along with the event name.
Sort the result based on the event count in the descending order.

Table: playbook_events

user_id:int
occurred_at:datetime
event_type:varchar
event_name:varchar
location:varchar
device:varchar
*/

SELECT 
      event_name, 
      COUNT(*) AS number_of_user_event
FROM 
      playbook_events
WHERE 
      device = 'macbook pro'
GROUP BY
      event_name
ORDER BY 
      number_of_user_event DESC
