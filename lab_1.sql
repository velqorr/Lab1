CREATE TABLE product (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    qty_pack integer NOT NULL,
    color character varying(30),
    specs text,
    country character varying(50),
    maker character varying(50),
    exp_date integer,
    CONSTRAINT product_pkey PRIMARY KEY (id)
);

CREATE TABLE placement (
    warehouse integer NOT NULL,
    product_id integer NOT NULL,
    packs integer NOT NULL,
    ship_date date,
    weight numeric(10,2),
    is_received boolean,
    CONSTRAINT placement_pkey PRIMARY KEY (warehouse, product_id)
);