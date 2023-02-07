names = ['Alpha', 'Beta', 'Gamma', 'Delta', 'Omega', 'Elizabeth', 'Anna', 'Mary', 'Lucy', 'Emily']

with open('out_routes.txt', 'w') as f:
    for name, i in zip(names, range(10)):
        f.write(
        f"""
INSERT INTO route (route_number, ship_id)
VALUES (
    'KAL-VLD-{i}',
    (SELECT ship_id FROM ship WHERE ship_name = '{name}')
);
        """
        )
