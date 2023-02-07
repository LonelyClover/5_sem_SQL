-- That trigger checks that each planned visit in connected with zero or one actual visit

CREATE OR REPLACE FUNCTION single_actual_visit() RETURNS TRIGGER
AS $single_actual_visit$
    BEGIN
        IF NEW.planned_visit_id IS NULL THEN
            RETURN NEW;
        END IF;
        IF ((SELECT COUNT(planned_visit_id) FROM actual_visit 
            WHERE planned_visit_id = NEW.planned_visit_id) <> 0)
        AND
           ((SELECT COUNT(planned_visit_id) FROM actual_visit 
            WHERE planned_visit_id = NEW.planned_visit_id) <> 1)
        THEN
            RAISE EXCEPTION 'There cannot me more than one actual visit for each planned visit';
        END IF;
        RETURN NEW;
    END;
$single_actual_visit$ LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER single_actual_visit
    AFTER INSERT OR UPDATE ON actual_visit
    FOR EACH ROW
    EXECUTE FUNCTION single_actual_visit();
