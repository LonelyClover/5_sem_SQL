-- Travel history of a given ship

WITH given_ship_id AS (
    SELECT ship_id FROM ship WHERE ship_name = 'Omega'
)
SELECT 
    port_name, 
    berth_number, 
    actual_purpose AS purpose, 
    actual_arrival_date AS arrival_date, 
    actual_departure_date AS departure_date
FROM
    actual_visit
    INNER JOIN berth USING (berth_id)
    INNER JOIN port USING (port_id)
    INNER JOIN ship USING (ship_id)
WHERE ship_id = (SELECT * FROM given_ship_id)
ORDER BY arrival_date ASC;

