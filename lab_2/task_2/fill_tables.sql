-- Countries

INSERT INTO country (country_name) VALUES ('Russia');
INSERT INTO country (country_name) VALUES ('Japan');
INSERT INTO country (country_name) VALUES ('China');
INSERT INTO country (country_name) VALUES ('Finland');
INSERT INTO country (country_name) VALUES ('Sweden');
INSERT INTO country (country_name) VALUES ('Norway');
INSERT INTO country (country_name) VALUES ('Denmark');
INSERT INTO country (country_name) VALUES ('Latvia');
INSERT INTO country (country_name) VALUES ('Lithuania');
INSERT INTO country (country_name) VALUES ('Estonia');

-- Ports

INSERT INTO port (port_name, coordinates, country_id, administration_adress)
VALUES (
    'Vladivostok',
    POINT(43.0648, -131.5308),
    (SELECT country_id FROM country WHERE country_name = 'Russia'),
    'Vladivosto, Nizhneportovaya street, 3G'
);
INSERT INTO port (port_name, coordinates, country_id, administration_adress)
VALUES (
    'Petropavlovsk-Kamchatskiy',
    POINT(53.0006, -158.3925),
    (SELECT country_id FROM country WHERE country_name = 'Russia'),
    'Petropavlovsk-Kamchatskiy, Schedrina street, 2'
);
INSERT INTO port (port_name, coordinates, country_id, administration_adress)
VALUES (
    'Vostochniy',
    POINT(42.4403, -133.0444),
    (SELECT country_id FROM country WHERE country_name = 'Russia'),
    'Nakhodka, Vnutriportovaya street, 47'
);
INSERT INTO port (port_name, coordinates, country_id, administration_adress)
VALUES (
    'Murmansk',
    POINT(68.5825, -33.0333),
    (SELECT country_id FROM country WHERE country_name = 'Russia'),
    'Murmansk, Portoviy street, 19'
);
INSERT INTO port (port_name, coordinates, country_id, administration_adress)
VALUES (
    'Arkhangelsk',
    POINT(64.3204, -40.3048),
    (SELECT country_id FROM country WHERE country_name = 'Russia'),
    'Arkhangelsk, Troitskiy avenue, 52'
);
INSERT INTO port (port_name, coordinates, country_id, administration_adress)
VALUES (
    'Kaliningrad',
    POINT(54.4008, -20.2414),
    (SELECT country_id FROM country WHERE country_name = 'Russia'),
    'Kaliningrad, Portovaya street, 24'
);
INSERT INTO port (port_name, coordinates, country_id, administration_adress)
VALUES (
    'Viborg',
    POINT(60.4243, 28.4346),
    (SELECT country_id FROM country WHERE country_name = 'Russia'),
    'Viborg, Yuzhniy Val street, 1'
);
INSERT INTO port (port_name, coordinates, country_id, administration_adress)
VALUES (
    'Magadan',
    POINT(59.3203, -150.4601),
    (SELECT country_id FROM country WHERE country_name = 'Russia'),
    'Magadan, Portovoe highway, 1'
);
INSERT INTO port (port_name, coordinates, country_id, administration_adress)
VALUES (
    'Sevastopol',
    POINT(44.3700, -33.3200),
    (SELECT country_id FROM country WHERE country_name = 'Russia'),
    'Sevastopol, Nakhimova square, 5'
);
INSERT INTO port (port_name, coordinates, country_id, administration_adress)
VALUES (
    'Sochi',
    POINT(43.2436, -39.5558),
    (SELECT country_id FROM country WHERE country_name = 'Russia'),
    'Sochi, Voikova street, 1'
);

-- Berths

INSERT INTO berth (berth_number, port_id)
VALUES (
    '1',
    (SELECT port_id FROM port WHERE port_name = 'Vladivostok')
);
INSERT INTO berth (berth_number, port_id)
VALUES (
    '2',
    (SELECT port_id FROM port WHERE port_name = 'Vladivostok')
);
INSERT INTO berth (berth_number, port_id)
VALUES (
    '3',
    (SELECT port_id FROM port WHERE port_name = 'Vladivostok')
);
INSERT INTO berth (berth_number, port_id)
VALUES (
    '4',
    (SELECT port_id FROM port WHERE port_name = 'Vladivostok')
);
INSERT INTO berth (berth_number, port_id)
VALUES (
    '5',
    (SELECT port_id FROM port WHERE port_name = 'Vladivostok')
);
INSERT INTO berth (berth_number, port_id)
VALUES (
    '1',
    (SELECT port_id FROM port WHERE port_name = 'Kaliningrad')
);
INSERT INTO berth (berth_number, port_id)
VALUES (
    '2',
    (SELECT port_id FROM port WHERE port_name = 'Kaliningrad')
);
INSERT INTO berth (berth_number, port_id)
VALUES (
    '6',
    (SELECT port_id FROM port WHERE port_name = 'Viborg')
);
INSERT INTO berth (berth_number, port_id)
VALUES (
    '5',
    (SELECT port_id FROM port WHERE port_name = 'Murmansk')
);
INSERT INTO berth (berth_number, port_id)
VALUES (
    '13',
    (SELECT port_id FROM port WHERE port_name = 'Vostochniy')
);

-- Types

INSERT INTO ship_type (type_name) VALUES ('Yacht');
INSERT INTO ship_type (type_name) VALUES ('Oil tanker');
INSERT INTO ship_type (type_name) VALUES ('Gas tanker');
INSERT INTO ship_type (type_name) VALUES ('Container ship');
INSERT INTO ship_type (type_name) VALUES ('Barge');
INSERT INTO ship_type (type_name) VALUES ('Cruise ship');
INSERT INTO ship_type (type_name) VALUES ('Icebreaker');
INSERT INTO ship_type (type_name) VALUES ('Tugboat');
INSERT INTO ship_type (type_name) VALUES ('Floating crane');
INSERT INTO ship_type (type_name) VALUES ('Floating dock');

-- Ships

INSERT INTO ship (ship_name, type_id, homeport_id, displacement, start_of_exploitation)
VALUES (
    'Alpha',
    (SELECT type_id FROM ship_type WHERE type_name = 'Gas tanker'),
    (SELECT port_id FROM port WHERE port_name = 'Kaliningrad'),
    15000,
    '2020-06-07'
);
        
INSERT INTO ship (ship_name, type_id, homeport_id, displacement, start_of_exploitation)
VALUES (
    'Beta',
    (SELECT type_id FROM ship_type WHERE type_name = 'Gas tanker'),
    (SELECT port_id FROM port WHERE port_name = 'Kaliningrad'),
    16000,
    '2020-06-08'
);
        
INSERT INTO ship (ship_name, type_id, homeport_id, displacement, start_of_exploitation)
VALUES (
    'Gamma',
    (SELECT type_id FROM ship_type WHERE type_name = 'Gas tanker'),
    (SELECT port_id FROM port WHERE port_name = 'Kaliningrad'),
    17000,
    '2020-06-09'
);
        
INSERT INTO ship (ship_name, type_id, homeport_id, displacement, start_of_exploitation)
VALUES (
    'Delta',
    (SELECT type_id FROM ship_type WHERE type_name = 'Gas tanker'),
    (SELECT port_id FROM port WHERE port_name = 'Kaliningrad'),
    18000,
    '2020-06-10'
);
        
INSERT INTO ship (ship_name, type_id, homeport_id, displacement, start_of_exploitation)
VALUES (
    'Omega',
    (SELECT type_id FROM ship_type WHERE type_name = 'Gas tanker'),
    (SELECT port_id FROM port WHERE port_name = 'Kaliningrad'),
    30000,
    '2020-06-11'
);
        
INSERT INTO ship (ship_name, type_id, homeport_id, displacement, start_of_exploitation)
VALUES (
    'Elizabeth',
    (SELECT type_id FROM ship_type WHERE type_name = 'Oil tanker'),
    (SELECT port_id FROM port WHERE port_name = 'Vladivostok'),
    50000,
    '2020-06-12'
);
        
INSERT INTO ship (ship_name, type_id, homeport_id, displacement, start_of_exploitation)
VALUES (
    'Anna',
    (SELECT type_id FROM ship_type WHERE type_name = 'Oil tanker'),
    (SELECT port_id FROM port WHERE port_name = 'Vladivostok'),
    60000,
    '2020-06-13'
);
        
INSERT INTO ship (ship_name, type_id, homeport_id, displacement, start_of_exploitation)
VALUES (
    'Mary',
    (SELECT type_id FROM ship_type WHERE type_name = 'Oil tanker'),
    (SELECT port_id FROM port WHERE port_name = 'Vladivostok'),
    70000,
    '2020-06-14'
);
        
INSERT INTO ship (ship_name, type_id, homeport_id, displacement, start_of_exploitation)
VALUES (
    'Lucy',
    (SELECT type_id FROM ship_type WHERE type_name = 'Oil tanker'),
    (SELECT port_id FROM port WHERE port_name = 'Vladivostok'),
    80000,
    '2020-06-15'
);
        
INSERT INTO ship (ship_name, type_id, homeport_id, displacement, start_of_exploitation)
VALUES (
    'Emily',
    (SELECT type_id FROM ship_type WHERE type_name = 'Oil tanker'),
    (SELECT port_id FROM port WHERE port_name = 'Vladivostok'),
    90000,
    '2020-06-16'
);

-- Planned_routes

INSERT INTO planned_route (route_number, ship_id)
VALUES (
    'KAL-VLD-0',
    (SELECT ship_id FROM ship WHERE ship_name = 'Alpha')
);
        
INSERT INTO planned_route (route_number, ship_id)
VALUES (
    'KAL-VLD-1',
    (SELECT ship_id FROM ship WHERE ship_name = 'Beta')
);
        
INSERT INTO planned_route (route_number, ship_id)
VALUES (
    'KAL-VLD-2',
    (SELECT ship_id FROM ship WHERE ship_name = 'Gamma')
);
        
INSERT INTO planned_route (route_number, ship_id)
VALUES (
    'KAL-VLD-3',
    (SELECT ship_id FROM ship WHERE ship_name = 'Delta')
);
        
INSERT INTO planned_route (route_number, ship_id)
VALUES (
    'KAL-VLD-4',
    (SELECT ship_id FROM ship WHERE ship_name = 'Omega')
);
        
INSERT INTO planned_route (route_number, ship_id)
VALUES (
    'KAL-VLD-5',
    (SELECT ship_id FROM ship WHERE ship_name = 'Elizabeth')
);
        
INSERT INTO planned_route (route_number, ship_id)
VALUES (
    'KAL-VLD-6',
    (SELECT ship_id FROM ship WHERE ship_name = 'Anna')
);
        
INSERT INTO planned_route (route_number, ship_id)
VALUES (
    'KAL-VLD-7',
    (SELECT ship_id FROM ship WHERE ship_name = 'Mary')
);
        
INSERT INTO planned_route (route_number, ship_id)
VALUES (
    'KAL-VLD-8',
    (SELECT ship_id FROM ship WHERE ship_name = 'Lucy')
);
        
INSERT INTO planned_route (route_number, ship_id)
VALUES (
    'KAL-VLD-9',
    (SELECT ship_id FROM ship WHERE ship_name = 'Emily')
);

-- Planned visits

INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-0'),
    (SELECT port_id FROM port WHERE port_name = 'Kaliningrad'),
    'Loading',
    '2021-08-11',
    '2021-08-21'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-1'),
    (SELECT port_id FROM port WHERE port_name = 'Kaliningrad'),
    'Loading',
    '2021-08-12',
    '2021-08-22'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-2'),
    (SELECT port_id FROM port WHERE port_name = 'Kaliningrad'),
    'Loading',
    '2021-08-13',
    '2021-08-23'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-3'),
    (SELECT port_id FROM port WHERE port_name = 'Kaliningrad'),
    'Loading',
    '2021-08-14',
    '2021-08-24'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-4'),
    (SELECT port_id FROM port WHERE port_name = 'Kaliningrad'),
    'Loading',
    '2021-08-15',
    '2021-08-25'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-5'),
    (SELECT port_id FROM port WHERE port_name = 'Kaliningrad'),
    'Loading',
    '2021-08-16',
    '2021-08-26'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-6'),
    (SELECT port_id FROM port WHERE port_name = 'Kaliningrad'),
    'Loading',
    '2021-08-17',
    '2021-08-27'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-7'),
    (SELECT port_id FROM port WHERE port_name = 'Kaliningrad'),
    'Loading',
    '2021-08-18',
    '2021-08-28'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-8'),
    (SELECT port_id FROM port WHERE port_name = 'Kaliningrad'),
    'Loading',
    '2021-08-19',
    '2021-08-29'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-9'),
    (SELECT port_id FROM port WHERE port_name = 'Kaliningrad'),
    'Loading',
    '2021-08-20',
    '2021-08-30'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-0'),
    (SELECT port_id FROM port WHERE port_name = 'Murmansk'),
    'Refueling',
    '2021-09-11',
    '2021-09-21'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-1'),
    (SELECT port_id FROM port WHERE port_name = 'Murmansk'),
    'Refueling',
    '2021-09-12',
    '2021-09-22'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-2'),
    (SELECT port_id FROM port WHERE port_name = 'Murmansk'),
    'Refueling',
    '2021-09-13',
    '2021-09-23'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-3'),
    (SELECT port_id FROM port WHERE port_name = 'Murmansk'),
    'Refueling',
    '2021-09-14',
    '2021-09-24'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-4'),
    (SELECT port_id FROM port WHERE port_name = 'Murmansk'),
    'Refueling',
    '2021-09-15',
    '2021-09-25'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-5'),
    (SELECT port_id FROM port WHERE port_name = 'Murmansk'),
    'Refueling',
    '2021-09-16',
    '2021-09-26'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-6'),
    (SELECT port_id FROM port WHERE port_name = 'Murmansk'),
    'Refueling',
    '2021-09-17',
    '2021-09-27'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-7'),
    (SELECT port_id FROM port WHERE port_name = 'Murmansk'),
    'Refueling',
    '2021-09-18',
    '2021-09-28'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-8'),
    (SELECT port_id FROM port WHERE port_name = 'Murmansk'),
    'Refueling',
    '2021-09-19',
    '2021-09-29'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-9'),
    (SELECT port_id FROM port WHERE port_name = 'Murmansk'),
    'Refueling',
    '2021-09-20',
    '2021-09-30'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-0'),
    (SELECT port_id FROM port WHERE port_name = 'Vladivostok'),
    'Unloading',
    '2021-10-11',
    '2021-10-21'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-1'),
    (SELECT port_id FROM port WHERE port_name = 'Vladivostok'),
    'Unloading',
    '2021-10-12',
    '2021-10-22'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-2'),
    (SELECT port_id FROM port WHERE port_name = 'Vladivostok'),
    'Unloading',
    '2021-10-13',
    '2021-10-23'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-3'),
    (SELECT port_id FROM port WHERE port_name = 'Vladivostok'),
    'Unloading',
    '2021-10-14',
    '2021-10-24'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-4'),
    (SELECT port_id FROM port WHERE port_name = 'Vladivostok'),
    'Unloading',
    '2021-10-15',
    '2021-10-25'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-5'),
    (SELECT port_id FROM port WHERE port_name = 'Vladivostok'),
    'Unloading',
    '2021-10-16',
    '2021-10-26'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-6'),
    (SELECT port_id FROM port WHERE port_name = 'Vladivostok'),
    'Unloading',
    '2021-10-17',
    '2021-10-27'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-7'),
    (SELECT port_id FROM port WHERE port_name = 'Vladivostok'),
    'Unloading',
    '2021-10-18',
    '2021-10-28'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-8'),
    (SELECT port_id FROM port WHERE port_name = 'Vladivostok'),
    'Unloading',
    '2021-10-19',
    '2021-10-29'
);
        
INSERT INTO planned_visit (route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-9'),
    (SELECT port_id FROM port WHERE port_name = 'Vladivostok'),
    'Unloading',
    '2021-10-20',
    '2021-10-30'
);

-- Actual visits

INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Alpha'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '1'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Kaliningrad')
    ),
    'Loading',
    '2021-08-11',
    '2021-08-21',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-08-11')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Beta'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '2'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Kaliningrad')
    ),
    'Loading',
    '2021-08-12',
    '2021-08-22',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-08-12')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Gamma'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '1'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Kaliningrad')
    ),
    'Loading',
    '2021-08-13',
    '2021-08-23',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-08-13')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Delta'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '2'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Kaliningrad')
    ),
    'Loading',
    '2021-08-14',
    '2021-08-24',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-08-14')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Omega'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '1'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Kaliningrad')
    ),
    'Loading',
    '2021-08-15',
    '2021-08-25',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-08-15')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Elizabeth'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '2'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Kaliningrad')
    ),
    'Loading',
    '2021-08-16',
    '2021-08-26',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-08-16')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Anna'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '1'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Kaliningrad')
    ),
    'Loading',
    '2021-08-17',
    '2021-08-27',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-08-17')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Mary'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '2'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Kaliningrad')
    ),
    'Loading',
    '2021-08-18',
    '2021-08-28',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-08-18')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Lucy'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '1'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Kaliningrad')
    ),
    'Loading',
    '2021-08-19',
    '2021-08-29',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-08-19')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Emily'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '2'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Kaliningrad')
    ),
    'Loading',
    '2021-08-20',
    '2021-08-30',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-08-20')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Alpha'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '5'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Murmansk')
    ),
    'Refueling',
    '2021-09-11',
    '2021-09-21',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-09-11')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Beta'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '5'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Murmansk')
    ),
    'Refueling',
    '2021-09-12',
    '2021-09-22',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-09-12')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Gamma'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '5'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Murmansk')
    ),
    'Refueling',
    '2021-09-13',
    '2021-09-23',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-09-13')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Delta'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '5'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Murmansk')
    ),
    'Refueling',
    '2021-09-14',
    '2021-09-24',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-09-14')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Omega'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '5'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Murmansk')
    ),
    'Refueling',
    '2021-09-15',
    '2021-09-25',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-09-15')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Elizabeth'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '5'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Murmansk')
    ),
    'Refueling',
    '2021-09-16',
    '2021-09-26',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-09-16')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Anna'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '5'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Murmansk')
    ),
    'Refueling',
    '2021-09-17',
    '2021-09-27',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-09-17')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Mary'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '5'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Murmansk')
    ),
    'Refueling',
    '2021-09-18',
    '2021-09-28',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-09-18')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Lucy'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '5'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Murmansk')
    ),
    'Refueling',
    '2021-09-20',
    '2021-09-29',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-09-19')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Emily'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '5'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Murmansk')
    ),
    'Refueling',
    '2021-09-20',
    '2021-09-30',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-09-20')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Alpha'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '1'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Vladivostok')
    ),
    'Unloading',
    '2021-10-11',
    '2021-10-21',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-10-11')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Beta'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '2'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Vladivostok')
    ),
    'Unloading',
    '2021-10-12',
    '2021-10-22',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-10-12')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Gamma'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '3'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Vladivostok')
    ),
    'Unloading',
    '2021-10-13',
    '2021-10-23',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-10-13')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Delta'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '4'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Vladivostok')
    ),
    'Unloading',
    '2021-10-14',
    '2021-10-24',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-10-14')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Omega'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '5'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Vladivostok')
    ),
    'Unloading',
    '2021-10-15',
    '2021-10-25',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-10-15')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Elizabeth'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '1'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Vladivostok')
    ),
    'Unloading',
    '2021-10-16',
    '2021-10-26',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-10-16')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Anna'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '2'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Vladivostok')
    ),
    'Unloading',
    '2021-10-17',
    '2021-10-27',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-10-17')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Mary'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '3'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Vladivostok')
    ),
    'Unloading',
    '2021-10-18',
    '2021-10-28',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-10-18')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Lucy'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '4'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Vladivostok')
    ),
    'Unloading',
    '2021-10-20',
    '2021-10-29',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-10-19')
);
            
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = 'Emily'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '5'
            AND port_id = (SELECT port_id FROM port WHERE port_name = 'Vladivostok')
    ),
    'Unloading',
    '2021-10-20',
    '2021-10-30',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '2021-10-20')
);
            
