from datetime import date, timedelta
from random import choice, randint, sample

N_SHIPS = 1000000
N_VISITS_PER_SHIP = 50

with open('src/female_names.txt', 'r') as f:
    female_names = [line.strip() for line in f.readlines()]

with open('src/ports.txt', 'r') as f:
    ports = [line.strip() for line in f.readlines()]

ship_types = ['Yacht', 'Oil tanker', 'Gas tanker', 'Container ship', 'Barge', 'Cruise ship', 'Icebreaker', 'Tugboat', 'Floating crane', 'Floating dock']

purpose_list = ['Refueling', 'Loading', 'Unloading', 'Repairing', 'Cleaning', 'Maintenance'] 
# purpose_samples = [sample(purpose_list, randint(1, len(purpose_list))) for _ in range(50)]

with open('src/reports.txt', 'r') as f:
    report_list = [line.strip() for line in f.readlines()]
# report_samples = [sample(report_list, randint(1, len(report_list))) for _ in range(50)]

start_date = date(2000, 1, 1)
def random_timedelta(a, b):
    return timedelta(days=randint(a, b))

t_port = open('src/port.csv', 'w')
t_ship = open('src/ship.csv', 'w')
t_visit = open('src/visit.csv', 'w')

for port_id, port_name in enumerate(ports):
    t_port.write(f'{port_id + 1}|"{port_name}"\n')

step = 0;
for ship_id in range(N_SHIPS):
    name_1 = female_names[ship_id % 100]
    name_2 = female_names[(ship_id // 100) % 100]
    name_3 = female_names[ship_id // 10000]
    ship_name = f'{name_1}-{name_2}-{name_3}'
	
    ship_type = choice(ship_types)
    homeport_id = randint(0, len(ports) - 1)
    displacement = randint(10000, 100000)

    t_ship.write(f'{ship_id + 1}|"{ship_name}"|"{ship_type}"|{homeport_id + 1}|{displacement}\n')

    current_date = start_date + random_timedelta(1, 100)
    for v in range(N_VISITS_PER_SHIP):
        visit_id = ship_id * N_VISITS_PER_SHIP + v
        port_id = randint(0, len(ports) - 1) 

        arrival_date = current_date
        current_date += random_timedelta(5, 30)
        departure_date = current_date
        current_date += random_timedelta(15, 90)

        purposes = sample(purpose_list, randint(1, len(purpose_list)))
        purposes_arr = '{' + ', '.join(map(lambda p: f'"{p}"', purposes)) + '}'
        purposes_str = ', '.join(purposes) + '.'
        
        report = ' '.join(sample(report_list, randint(1, len(report_list))))

        summary = '{' + f'"ship name": "{ship_name}", "port name": "{ports[port_id]}", "arrival date": "{arrival_date}", "departure date": "{departure_date}", "purposes": "{purposes_str}", "report": "{report}"' + '}'

        t_visit.write(f'{visit_id + 1}|{ship_id + 1}|{port_id + 1}|"{arrival_date}"|"{departure_date}"|{purposes_arr}|"{report}"|{summary}\n')
        
        step += 1
        if (step * 100) % (N_SHIPS * N_VISITS_PER_SHIP) == 0:
            print(f'{(step * 100) // (N_SHIPS * N_VISITS_PER_SHIP)}%')

t_port.close()
t_ship.close()
t_visit.close()
