/*
Find the Olympics with the highest number of athletes.
The Olympics game is a combination of the year and the season, and is found in the 'games' column.
Output the Olympics along with the corresponding number of athletes.

Table: olympics_athletes_events

olympics_athletes_events

id: int
name: varchar
sex: varchar
age: float
height: float
weight: datetime
team: varchar
noc: varchar
games:varchar
year: int
season: varchar
city: varchar
sport: varchar
event: varchar
medal: varchar
non_team: datetime

*/

SELECT
      games, COUNT(DISTINCT id) AS no_of_athletes  
FROM
      olympics_athletes_events
GROUP BY
      games
ORDER BY
      no_of_athletes DESC
LIMIT 1
