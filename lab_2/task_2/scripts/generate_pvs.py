ports = ['Kaliningrad'] * 10 + ['Murmansk'] * 10 + ['Vladivostok'] * 10
nums = list(range(1, 11)) * 3
purposes = ['Loading'] * 10 + ['Refueling'] * 10 + ['Unloading'] * 10
days = list(range(11, 21)) * 3
months = ['2021-08-'] * 10 + ['2021-09-'] * 10 + ['2021-10-'] * 10

with open('out_pvs.txt', 'w') as f:
     for port, i, purpose, day, month in zip(ports, nums, purposes, days, months):
         f.write(
         f"""
INSERT INTO planned_visit (planned_route_id, port_id, planned_purpose, planned_arrival_date, planned_departure_date)
VALUES (
    (SELECT route_id FROM planned_route WHERE route_number = 'KAL-VLD-{i-1}'),
    (SELECT port_id FROM port WHERE port_name = '{port}'),
    '{purpose}',
    '{month}{day}',
    '{month}{day+10}'
);
        """
        )

