/*
Find matching hosts and guests pairs in a way that they are both of the same gender and nationality.
Output the host id and the guest id of matched pair.

Tables: airbnb_hosts, airbnb_guests

airbnb_hosts

host_id:int
nationality:varchar
gender:varchar
age:int

airbnb_guests

guest_id:int
nationality:varchar
gender:varchar
age:int
*/

SELECT DISTINCT 
      host.host_id, 
      guest.guest_id
FROM 
      airbnb_hosts host
JOIN 
      airbnb_guests guest
USING(nationality, gender)
