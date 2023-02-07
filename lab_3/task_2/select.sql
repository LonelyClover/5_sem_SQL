SET ROLE test;

SELECT * FROM visit LIMIT 10; -- OK
SELECT * FROM ship LIMIT 10; -- NOT OK
SELECT ship_name FROM ship LIMIT 10; -- OK
SELECT * FROM port LIMIT 10; -- OK
SELECT * FROM recent_visit_5 LIMIT 10; -- OK
SELECT * FROM recent_visit_10 LIMIT 10; -- NOT OK
