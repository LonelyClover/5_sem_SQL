-- Reschedule all planned departures to 22 days earlier
-- Probably instead of 2 days due to typing error

WITH now AS (VALUES (DATE '2021-09-22'))
UPDATE planned_visit
SET planned_departure_date = planned_departure_date - 22
WHERE planned_departure_date > (SELECT * FROM now) - 22;
