names = ['Alpha', 'Beta', 'Gamma', 'Delta', 'Omega', 'Elizabeth', 'Anna', 'Mary', 'Lucy', 'Emily']
types = ['Gas tanker'] * 5 + ['Oil tanker'] * 5
ports = ['Kaliningrad'] * 5 + ['Vladivostok'] * 5
disps = [15000, 16000, 17000, 18000, 30000, 50000, 60000, 70000, 80000, 90000]
soes = ['2020-06-07', '2020-06-08', '2020-06-09', '2020-06-10', '2020-06-11', '2020-06-12', '2020-06-13', '2020-06-14', '2020-06-15', '2020-06-16']

with open('out_ships.txt', 'w') as f:
    for name, typ, port, disp, soe in zip(names, types, ports, disps, soes):
        f.write(
        f"""
INSERT INTO ship (ship_name, type_id, homeport_id, displacement, start_of_exploitation)
VALUES (
    '{name}',
    (SELECT type_id FROM ship_type WHERE type_name = '{typ}'),
    (SELECT port_id FROM port WHERE port_name = '{port}'),
    {disp},
    '{soe}'
);
        """
        )
