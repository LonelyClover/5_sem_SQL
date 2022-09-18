-- Amount of seats in each class on each airplane

WITH
business_class AS (
    SELECT
        aircraft_code,
        COUNT (*) AS business_seats
    FROM seats
    WHERE fare_conditions = 'Business'
    GROUP BY aircraft_code
),

comfort_class AS (
    SELECT
        aircraft_code,
        COUNT (*) AS comfort_seats
    FROM seats
    WHERE fare_conditions = 'Comfort'
    GROUP BY aircraft_code
),

economy_class AS (
    SELECT
        aircraft_code,
        COUNT (*) AS economy_seats
    FROM seats
    WHERE fare_conditions = 'Economy'
    GROUP BY aircraft_code
)

SELECT 
    aircraft_code,
    model,
    business_seats,
    comfort_seats,
    economy_seats
FROM 
    aircrafts 
    LEFT JOIN business_class USING (aircraft_code)
    LEFT JOIN comfort_class USING (aircraft_code)
    LEFT JOIN economy_class USING (aircraft_code)
ORDER BY economy_seats DESC;
