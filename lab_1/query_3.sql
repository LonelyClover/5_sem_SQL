-- The fastest routes from Novosibirsk to Ulyanovsk, and their nearest first flights

WITH 
suitable_straight_routes AS (
    SELECT * FROM routes
    WHERE
        departure_city = 'Novosibirsk'
        AND arrival_city = 'Ulyanovsk'
),

fastest_straight_routes AS (
    SELECT 
        flight_no AS first_flight_no, 
        NULL AS second_flight_no, 
        duration 
    FROM suitable_straight_routes
    WHERE duration = (SELECT MIN(duration) FROM suitable_straight_routes)
    ORDER BY duration ASC
),

first_routes AS (
    SELECT 
        flight_no AS first_flight_no,
        duration AS first_route_duration,
        arrival_airport
    FROM routes
    WHERE departure_city = 'Novosibirsk'
),
    
second_routes AS (
    SELECT 
        flight_no AS second_flight_no,
        duration AS second_route_duration,
        departure_airport
    FROM routes
    WHERE arrival_city = 'Ulyanovsk'
),

suitable_transfer_routes AS (
    SELECT 
        first_flight_no,
        second_flight_no,
        first_route_duration,
        second_route_duration
    FROM first_routes INNER JOIN second_routes
    ON arrival_airport = departure_airport
),

fastest_transfer_routes AS (
    SELECT 
        first_flight_no,
        second_flight_no,
        (first_route_duration + second_route_duration) AS duration
    FROM suitable_transfer_routes
    WHERE 
        first_route_duration + second_route_duration = 
        (SELECT MIN(first_route_duration) FROM suitable_transfer_routes)
        + (SELECT MIN(second_route_duration) FROM suitable_transfer_routes)
),

fastest_routes_union AS (
    SELECT * FROM fastest_straight_routes
    UNION
    SELECT * FROM fastest_transfer_routes
),

fastest_routes AS (
    SELECT * FROM fastest_routes_union
    WHERE duration = (SELECT MIN(duration) FROM fastest_routes_union)
)

SELECT 
    flight_no AS first_flight_no, 
    MIN(scheduled_departure) AS scheduled_departure, 
    departure_airport AS first_departure_airport, 
    arrival_airport AS first_arrival_airport,
    second_flight_no,
    second_departure_airport,
    second_arrival_airport,
    duration
FROM 
    flights
    INNER JOIN fastest_routes ON first_flight_no = flight_no
    LEFT JOIN (
        SELECT 
            flight_no AS second_flight_no,
            departure_airport AS second_departure_airport,
            arrival_airport AS second_arrival_airport
        FROM flights
    ) AS second_flights USING (second_flight_no)
WHERE status IN ('Scheduled', 'On Time', 'Delayed')
GROUP BY
    flight_no, 
    departure_airport, 
    arrival_airport,
    second_flight_no,
    second_departure_airport,
    second_arrival_airport,
    duration
ORDER BY scheduled_departure ASC;
