SET ROLE test;

UPDATE port SET port_name to 'Meh' WHERE port_name = 'Singapore'; -- NOT OK
UPDATE ship SET displacement = displacement + 1; -- NOT OK
UPDATE ship SET ship_name = 'Luna' WHERE ship_name = 'Luna-Luna-Luna'; -- OK
UPDATE visit SET departure_date - departure_date + 1
WHERE ship_name = 'Olivia-Olivia-Olivia' AND port_name = 'Singapore'; -- OK
UPDATE recent_visit_5 SET departure_date - departure_date + 1
WHERE ship_name = 'Olivia-Olivia-Olivia' AND port_name = 'Singapore'; -- NOT OK

SET ROLE view_test;

UPDATE recent_visit_5 SET departure_date - departure_date + 1
WHERE extract(year from departure_date) = 2008; -- OK
UPDATE recent_visit_10 SET departure_date - departure_date + 1
WHERE extract(year from departure_date) = 2008; -- NOT OK


