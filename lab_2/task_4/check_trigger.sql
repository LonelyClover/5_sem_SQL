-- Prepataion

INSERT INTO planned_route (ship_id, route_number)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Delta'),
    'VLD-VIB-1'
);

INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'VLD-VIB-1'),
    (SELECT port_id FROM port WHERE port_name = 'Viborg'),
    'Repairing',
    '2021-11-17'
);

-- First try - OK

INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Delta'),
    (SELECT berth_id FROM berth LEFT JOIN port USING (port_id)
     WHERE port_name = 'Viborg' AND berth_number = '6'),
    'Repairing',
    '2021-11-18',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-11-17')
);

-- Second try - ERROR

INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Delta'),
    (SELECT berth_id FROM berth LEFT JOIN port USING (port_id)
     WHERE port_name = 'Viborg' AND berth_number = '6'),
    'Repairing',
    '2021-11-19',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-11-17')
);

-- Within transaction -- ERROR

BEGIN;
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Delta'),
    (SELECT berth_id FROM berth LEFT JOIN port USING (port_id)
     WHERE port_name = 'Viborg' AND berth_number = '6'),
    'Repairing',
    '2021-11-19',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-11-17')
);
ROLLBACK;

-- Cleaning

DELETE FROM actual_visit where actual_arrival_date = '2021-11-18';
DELETE FROM planned_route WHERE route_number = 'VLD-VIB-1';
