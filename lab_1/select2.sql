-- Flights from Moscow to Ulyanovsk, that are availible to register on, ordered by amount of free seats

WITH nearest_flights AS (
	SELECT * FROM flights_v
	WHERE (
		status IN ('On Time', 'Delayed')
		AND departure_city = 'Moscow'
		AND arrival_city = 'Ulyanovsk'	
	)
)

SELECT flight_no, scheduled_departure, scheduled_arrival, departure_airport, arrival_airport, SUM(NUM_NULLS(boarding_no)) AS free_seats
FROM (
	nearest_flights 
	INNER JOIN seats USING (aircraft_code) 
	LEFT JOIN boarding_passes USING (flight_id, seat_no)
)
GROUP BY flight_no, scheduled_departure, scheduled_arrival, departure_airport, arrival_airport
ORDER BY free_seats DESC;
