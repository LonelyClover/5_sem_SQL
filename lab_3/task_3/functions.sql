CREATE OR REPLACE PROCEDURE update_summary(current_visit_id bigint) AS
$$
DECLARE
    current_visit visit%ROWTYPE;
    current_ship_name varchar;
    current_port_name varchar;
    new_summary jsonb;
BEGIN
    SELECT * INTO current_visit FROM visit WHERE visit_id = current_visit_id;
    SELECT ship_name INTO current_ship_name FROM ship WHERE ship_id = current_visit.ship_id;
    SELECT port_name INTO current_port_name FROM port WHERE port_id = current_visit.port_id;

    new_summary := jsonb_build_object(
        'ship name', current_ship_name,
        'port name', current_port_name,
        'arrival date', current_visit.arrival_date,
        'departure date', current_visit.departure_date,
        'purposes', current_visit.purposes
    );

    IF current_visit.report IS NOT NULL THEN
        new_summary := new_summary || jsonb_build_object('report', current_visit.report);
    END IF;

    UPDATE visit SET summary = new_summary WHERE visit_id = current_visit_id;

    EXCEPTION
        WHEN SQLSTATE '42501' THEN 
            BEGIN
            RAISE NOTICE 'Not enough priveleges!';
            END;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_port_statistics(current_ship_id bigint)
RETURNS TABLE (name varchar, count bigint) AS
$$
DECLARE
	n integer;
    port_statistics integer[];
	stat integer;
	i integer;
	visit_c CURSOR FOR SELECT port_id FROM visit WHERE ship_id = current_ship_id;
BEGIN
	SELECT count(*) INTO n FROM port;
	port_statistics = array_fill(0, ARRAY[n]);

	FOR current_visit IN visit_c LOOP
		i := current_visit.port_id;
		port_statistics[i] := port_statistics[i] + 1;
	END LOOP;
	
	i := 1;
	FOREACH stat IN ARRAY port_statistics LOOP
		SELECT port_name INTO name FROM port WHERE port_id = i;
		count := stat;
		i := i + 1;
		RETURN NEXT;
	END LOOP;
	
    EXCEPTION
        WHEN SQLSTATE '42501' THEN 
            BEGIN
            RAISE NOTICE 'Not enough priveleges!';
            END;
END;
$$
LANGUAGE plpgsql;
-- 07:32

CREATE OR REPLACE FUNCTION get_port_statistics_2(current_ship_id bigint)
RETURNS TABLE (name varchar, count bigint) AS
$$
BEGIN	
	RETURN QUERY
	SELECT port_name, count(port_id) 
	FROM visit JOIN port USING (port_id)
	WHERE ship_id = current_ship_id 
	GROUP BY port_name;
	
    EXCEPTION
        WHEN SQLSTATE '42501' THEN 
            BEGIN
            RAISE NOTICE 'Not enough priveleges!';
            END;
END;
$$
LANGUAGE plpgsql;
-- 05:16