-- Top 5 most popular flights

SELECT flight_no, 
	departure_airport, 
	arrival_airport, 
	COUNT(ticket_no) 
FROM bookings.flights LEFT JOIN bookings.ticket_flights USING(flight_id) 
GROUP BY flight_no, departure_airport, arrival_airport 
ORDER BY count DESC 
LIMIT 5;

