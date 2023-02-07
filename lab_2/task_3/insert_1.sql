-- Insert new planned route with 2 planned visits for given ship

WITH given_ship_id AS (
    SELECT ship_id FROM ship WHERE ship_name = 'Beta'
)
INSERT INTO planned_route (route_number, ship_id)
VALUES (
    'VLD-SEV-1',
    (SELECT * FROM given_ship_id)
);

WITH new_route AS (
    SELECT route_id FROM planned_route WHERE route_number = 'VLD-SEV-1'
),
port_magadan AS (
    SELECT port_id FROM port WHERE port_name = 'Magadan'
),
port_sevastopol AS (
    SELECT port_id FROM port WHERE port_name = 'Sevastopol'
)
INSERT INTO planned_visit (
    route_id,
    port_id,
    planned_purpose,
    planned_arrival_date,
    planned_departure_date
)
VALUES (
    (SELECT * FROM new_route),
    (SELECT * FROM port_magadan),
    'Refueling',
    '2021-11-07',
    '2021-11-18'
), (
    (SELECT * FROM new_route),
    (SELECT * FROM port_sevastopol),
    'Unloading',
    '2021-12-08',
    NULL
);
