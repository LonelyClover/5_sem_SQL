-- Ports

CREATE TABLE country (
    country_id serial
        PRIMARY KEY,
    country_name varchar
        UNIQUE
        NOT NULL
);

CREATE TABLE port (
    port_id serial
        PRIMARY KEY,
    port_name varchar
        NOT NULL,
    coordinates point
        NOT NULL,
    country_id serial 
        NOT NULL
        REFERENCES country
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    administration_adress varchar
        NOT NULL
);

CREATE TABLE berth (
    berth_id serial
        PRIMARY KEY,
    berth_number varchar
        NOT NULL,
    port_id serial
        NOT NULL
        REFERENCES port
            ON DELETE CASCADE
            ON UPDATE CASCADE 
);

-- Ships

CREATE TABLE ship_type (
    type_id serial
        PRIMARY KEY,
    type_name varchar
        UNIQUE
        NOT NULL
);

CREATE TABLE ship (
    ship_id serial 
        PRIMARY KEY,
    ship_name varchar
        NOT NULL,
    type_id serial
        NOT NULL
        REFERENCES ship_type
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    homeport_id serial
        NOT NULL
        REFERENCES port
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    displacement integer
        NOT NULL
        CONSTRAINT positive_displacement
            CHECK (displacement > 0),
    start_of_exploitation date
        NOT NULL
        DEFAULT CURRENT_DATE,
    end_of_exploitation date,


    CONSTRAINT valid_exploitation_dates
        CHECK (start_of_exploitation <= end_of_exploitation OR end_of_exploitation IS NULL)
);

-- Planning

CREATE TABLE planned_route (
    route_id bigserial
        PRIMARY KEY,
    route_number varchar
        NOT NULL,
    ship_id serial
        NOT NULL
        REFERENCES ship
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE planned_visit (
    planned_visit_id bigserial
        PRIMARY KEY,
    route_id bigserial
        NOT NULL
        REFERENCES planned_route
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    port_id serial
        NOT NULL
        REFERENCES port
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    planned_purpose varchar
        NOT NULL,
    planned_arrival_date date
        NOT NULL,
    planned_departure_date date,

    CONSTRAINT valid_planned_visit_dates
        CHECK (planned_arrival_date <= planned_departure_date OR planned_departure_date IS NULL)
);

-- Actual visits

CREATE TABLE actual_visit (
    actual_visit_id bigserial
        PRIMARY KEY,
    ship_id serial
        NOT NULL
        REFERENCES ship
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    berth_id serial
        NOT NULL
        REFERENCES berth
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    actual_purpose varchar
        NOT NULL,
    actual_arrival_date date
        NOT NULL
        DEFAULT CURRENT_DATE,
    actual_departure_date date,
    planned_visit_id bigserial
        REFERENCES planned_visit
            ON DELETE SET NULL
            ON UPDATE CASCADE,

    CONSTRAINT valid_actual_visit_dates
        CHECK (actual_arrival_date <= actual_departure_date OR actual_departure_date IS NULL)
);

