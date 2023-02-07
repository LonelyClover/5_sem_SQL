-- READ UNCOMMITTED

SELECT * FROM ship WHERE ship_name = 'Omega';

-- 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

-- 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

-- 1
UPDATE ship
SET displacement = displacement + 1000
WHERE ship_name = 'Omega';

-- 2
UPDATE ship
SET displacement = displacement + 2000
WHERE ship_name = 'Omega';

-- 1
ROLLBACK;

-- 2
COMMIT;

SELECT * FROM ship WHERE ship_name = 'Omega';
-- Аномалия потерянных изменений отсутствует

-- -- --

-- 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

-- 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

-- 1
SELECT * FROM planned_visit
WHERE route_id = (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-1');

-- 2
UPDATE planned_visit
SET planned_purpose = 'Refueling and loading' 
WHERE route_id = (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-1' AND planned_purpose = 'Refueling');

-- 1
SELECT * FROM planned_visit
WHERE route_id = (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-1');
-- -- Аномалия грязных чтений отсутствует в pg_sql

-- 2
COMMIT;

-- 1
SELECT * FROM planned_visit
WHERE route_id = (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-1');
COMMIT;
-- -- Аномалия неповторяемоых чтений присутствует

UPDATE planned_visit
SET planned_purpose = 'Refueling' 
WHERE route_id = (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-1' AND planned_purpose = 'Refueling and loading');


-- READ COMMITTED

-- 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- 1
SELECT * FROM planned_visit
WHERE route_id = (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-1');

-- 2
UPDATE planned_visit
SET planned_purpose = 'Refueling and loading' 
WHERE route_id = (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-1' AND planned_purpose = 'Refueling');

-- 1
SELECT * FROM planned_visit
WHERE route_id = (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-1');
-- -- Аномалия грязных чтений отсутствует

-- 2
COMMIT;

-- 1
SELECT * FROM planned_visit
WHERE route_id = (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-1');
COMMIT;
-- -- Аномалия неповторяемых чтений присутствует

UPDATE planned_visit
SET planned_purpose = 'Refueling' 
WHERE route_id = (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-1' AND planned_purpose = 'Refueling and loading');

-- REPEATABLE READ

-- 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- 1
SELECT * FROM planned_visit
WHERE route_id = (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-1');

-- 2
UPDATE planned_visit
SET planned_purpose = 'Refueling and loading' 
WHERE route_id = (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-1') 
AND planned_purpose = 'Refueling';
COMMIT;

-- 1
SELECT * FROM planned_visit
WHERE route_id = (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-1');
COMMIT;
-- -- Аномалия неповторяемых чтений отсутствует

UPDATE planned_visit
SET planned_purpose = 'Refueling' 
WHERE route_id = (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-1') 
AND planned_purpose = 'Refueling and loading';

-- -- --

-- 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- 1
SELECT * FROM planned_visit
WHERE route_id = (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-1');

-- 2 
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date)
VALUES (
  (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-1'),
  (SELECT port_id FROM port WHERE port_name = 'Magadan'),
  'Repairing',
  '2021-11-03');
COMMIT;

-- 1
SELECT * FROM planned_visit
WHERE route_id = (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-1');
COMMIT;
-- -- Аномалия фантомнов отсутствует в pg_sql

DELETE FROM planned_visit WHERE planned_purpose = 'Repairing';

-- SERIALIZABLE

-- 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- 1
SELECT * FROM planned_visit
WHERE route_id = (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-1');

-- 2 
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date)
VALUES (
  (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-1'),
  (SELECT port_id FROM port WHERE port_name = 'Magadan'),
  'Repairing',
  '2021-11-03');
COMMIT;

-- 1
SELECT * FROM planned_visit
WHERE route_id = (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-1');
COMMIT;
-- -- Аномалия фантомнов отсутствует

DELETE FROM planned_visit WHERE planned_purpose = 'Repairing';

-- -- -- --

-- 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

-- 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

-- 1
SELECT country_id WHERE country_name = 'Japan'; -- 2

-- 2
SELECT country_id WHERE country_name = 'Japan'; -- 2

-- 1
UPDATE country
SET country_name = 'Japoniya' WHERE country_id = 2;

-- 2
UPDATE country
SET country_name = 'Yaponiya' WHERE country_id = 2;

-- 1;
COMMIT;

-- 2
COMMIT;

