-- All ships that are currently in port

WITH now AS (VALUES (DATE '2021-10-23'))
SELECT
    ship_name, 
    port_name,
    actual_arrival_date AS arrival_date,
    actual_purpose AS purpose
FROM
    actual_visit
    INNER JOIN ship USING (ship_id)
    INNER JOIN berth USING (berth_id)
    INNER JOIN port USING (port_id)
WHERE
    actual_arrival_date <= (SELECT * FROM now)
    AND (
        actual_departure_date > (SELECT * FROM now)
        OR actual_departure_date IS NULL
    );
