CREATE USER test;
GRANT SELECT ON port TO test;
GRANT SELECT (ship_name), UPDATE (ship_name) ON ship TO test;
GRANT SELECT, INSERT, UPDATE ON visit TO test; 
