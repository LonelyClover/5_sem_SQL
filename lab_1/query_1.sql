-- Top 5 most popular flights

SELECT 
    flight_no, 
	departure_airport, 
	arrival_airport, 
	COUNT(ticket_no) AS amount_of_tickets
FROM 
    flights 
    LEFT JOIN ticket_flights USING(flight_id) 
GROUP BY 
    flight_no, 
    departure_airport, 
    arrival_airport 
ORDER BY amount_of_tickets DESC 
LIMIT 5;
