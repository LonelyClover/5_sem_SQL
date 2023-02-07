CREATE ROLE recent_visit_role;
GRANT SELECT (arrival_date, departure_date, purposes, report), UPDATE (arrival_date, departure_date, purposes, report) ON recent_visit_5 TO recent_visit_role;

CREATE USER view_test;
GRANT recent_visit_role TO view_test;
