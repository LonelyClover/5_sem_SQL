CREATE TABLE port (
    port_id serial
        PRIMARY KEY,
    port_name varchar
        NOT NULL
);

CREATE TABLE ship (
    ship_id bigserial
        PRIMARY KEY,
    ship_name varchar
        NOT NULL,
    ship_type varchar
        NOT NULL,
    homeport_id integer
        REFERENCES port
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    displacement integer
        NOT NULL
        CONSTRAINT positive_displacement
            CHECK (displacement > 0)
);

CREATE TABLE visit (
    visit_id bigserial
        PRIMARY KEY,
    ship_id bigint
        NOT NULL
        REFERENCES ship
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    port_id integer
        NOT NULL
        REFERENCES port
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    arrival_date date
        NOT NULL,
    departure_date date
        NOT NULL,
    purposes varchar[]
        NOT NULL,
    report varchar,
    summary jsonb
        NOT NULL,

    CONSTRAINT valid_dates
        CHECK (arrival_date <= departure_date)
);

