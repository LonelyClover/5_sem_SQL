INSERT INTO visit (visit_id, ship_id, port_id, arrival_date, departure_date, purposes, report, summary)
VALUES (
    200000005,
    3,
    3,
    date '2022-12-11',
    date '2022-12-13',
    '{Loading, Refueling}',
	'It was nice!',
    jsonb_build_object('aaa', 'bbb')
);
SELECT * FROM visit WHERE visit_id = 200000005;
CALL update_summary(200000005);
SELECT * FROM visit WHERE visit_id = 200000005;
