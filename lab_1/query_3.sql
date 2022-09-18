-- The fastest routes from Moscow to Ulyanovsk, and their nearest flights

WITH 
suitable_routes AS (
    SELECT * FROM routes
    WHERE
        departure_city = 'Moscow'
        AND arrival_city = 'Ulyanovsk'
),

fastest_routes AS (
    SELECT flight_no, duration FROM suitable_routes
    WHERE duration = (SELECT MIN(duration) FROM suitable_routes)
    ORDER BY duration ASC
)

SELECT 
    flight_no, 
    MIN(scheduled_departure) AS scheduled_departure, 
    MIN(scheduled_arrival) AS scheduled_arrival, 
    departure_airport, 
    arrival_airport,
    duration
FROM flights INNER JOIN fastest_routes USING (flight_no)
WHERE status IN ('Scheduled', 'On Time', 'Delayed')
GROUP BY
    flight_no, 
    departure_airport, 
    arrival_airport,
    duration
ORDER BY scheduled_departure ASC;
