-- Delay all upcoming planned visits by three days

WITH now AS (VALUES (DATE '2021-09-22'))
UPDATE planned_visit
SET planned_departure_date = planned_departure_date + 3
WHERE planned_departure_date >= (SELECT * FROM now);

WITH now AS (VALUES (DATE '2021-09-22'))
UPDATE planned_visit
SET planned_arrival_date = planned_arrival_date + 3
WHERE planned_arrival_date >= (SELECT * FROM now);
