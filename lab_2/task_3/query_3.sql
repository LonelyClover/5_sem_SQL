-- All delays in arrival for given route

WITH given_route AS (
    SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-8'
)
SELECT
    planned_arrival_date,
    actual_arrival_date,
    actual_arrival_date - planned_arrival_date AS delay
FROM
    planned_route
    INNER JOIN planned_visit USING (route_id)
    INNER JOIN actual_visit USING (planned_visit_id)
WHERE
    route_id = (SELECT * FROM given_route)
    AND actual_arrival_date > planned_arrival_date;    
