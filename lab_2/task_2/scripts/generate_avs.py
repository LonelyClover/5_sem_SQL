names = ['Alpha', 'Beta', 'Gamma', 'Delta', 'Omega', 'Elizabeth', 'Anna', 'Mary', 'Lucy', 'Emily'] * 3
ports = ['Kaliningrad'] * 10 + ['Murmansk'] * 10 + ['Vladivostok'] * 10
berths = [1, 2] * 5 + [5] * 10 + [1, 2, 3, 4, 5] * 2
purposes = ['Loading'] * 10 + ['Refueling'] * 10 + ['Unloading'] * 10
days = list(range(11, 21)) * 3
months = ['2021-08-'] * 10 + ['2021-09-'] * 10 + ['2021-10-'] * 10

with open('out_avs.txt', 'w') as f:
     for name, port, berth, purpose, day, month in zip(names, ports, berths, purposes, days, months):
         f.write( 
            f"""
INSERT INTO actual_visit (ship_id, berth_id, actual_purpose, actual_arrival_date, actual_departure_date, planned_visit_id)
VALUES (
    (SELECT ship_id FROM ship WHERE ship_name = '{name}'),
    (SELECT berth_id FROM berth 
        WHERE
            berth_number = '{berth}'
            AND port_id = (SELECT port_id FROM port WHERE port_name = '{port}')
    ),
    '{purpose}',
    '{month}{day}',
    '{month}{day+10}',
    (SELECT planned_visit_id FROM planned_visit WHERE planned_arrival_date = '{month}{day}')
);
            """
        )
