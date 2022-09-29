/*
Find the date with the highest total energy consumption from the Meta/Facebook data centers.
Output the date along with the total energy consumption across all data centers.

Tables: fb_eu_energy, fb_asia_energy, fb_na_energy

fb_eu_energy
date: datetime
consumption: int

fb_asia_energy
date: datetime
consumption: int

fb_na_energy
date: datetime
consumption: int

*/

WITH total_consumption AS
(
    SELECT date, consumption
    FROM fb_eu_energy
    UNION ALL
    SELECT date, consumption
    FROM fb_asia_energy
    UNION ALL
    SELECT date, consumption
    FROM fb_na_energy
),
sum_consumption AS
(
    SELECT date, sum(consumption) AS total
    FROM total_consumption
    GROUP BY date
)
SELECT s.date, max(s.total) AS highest
FROM sum_consumption s
GROUP BY s.date
ORDER BY highest DESC
LIMIT 1

