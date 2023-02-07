-- Add new ship with invalid displacement
-- Probably due to error in calculations

WITH given_homeport AS (
    SELECT port_id FROM port WHERE port_name = 'Viborg'
),
given_type AS (
    SELECT type_id FROM ship_type WHERE type_name = 'Yacht'
)
INSERT INTO ship (
    ship_name,
    type_id,
    homeport_id,
    displacement,
    start_of_exploitation
)
VALUES (
    'Problemo',
    (SELECT * FROM given_type),
    (SELECT * FROM given_homeport),
    (50*2 - 25 - 15*3 - 10 - 7*4),
    DEFAULT
);

