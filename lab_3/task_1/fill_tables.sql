BEGIN;

SET CONSTRAINTS ALL DEFERRED;

COPY port
    FROM '/home/lonely_clover/Programming/5_sem_SQL/lab_3/task_1/src/port.csv' WITH (FORMAT TEXT, DELIMITER '|');

COPY ship
    FROM '/home/lonely_clover/Programming/5_sem_SQL/lab_3/task_1/src/ship.csv' WITH (FORMAT TEXT, DELIMITER '|');

COPY visit
    FROM '/home/lonely_clover/Programming/5_sem_SQL/lab_3/task_1/src/visit.csv' WITH (FORMAT TEXT, DELIMITER '|');

COMMIT;
