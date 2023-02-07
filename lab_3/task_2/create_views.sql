CREATE VIEW recent_visit_5 AS
    SELECT * FROM visit 
    WHERE date '2010-01-01' - arrival_date BETWEEN 0 AND 365 * 5;

CREATE VIEW recent_visit_10 AS
    SELECT * FROM visit
    WHERE date '2010-01-01' - arrival_date BETWEEN 0 AND 365 * 10;

GRANT SELECT ON recent_visit_5 TO test;
