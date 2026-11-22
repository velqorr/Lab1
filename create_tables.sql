CREATE TABLE product_table (
    product_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    pieces_per_package INTEGER NOT NULL,
    color VARCHAR(50),
    characteristics TEXT,
    country_of_origin VARCHAR(100) NOT NULL,
    manufacturer VARCHAR(150) NOT NULL,
    expiration_date DATE,

    CONSTRAINT product_pieces_check
        CHECK (pieces_per_package > 0)
);


CREATE TABLE placement_table (
    placement_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    warehouse_number INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    package_quantity INTEGER NOT NULL,
    shipment_date DATE NOT NULL,
    weight NUMERIC(12, 3) NOT NULL,
    received BOOLEAN NOT NULL DEFAULT FALSE,

    CONSTRAINT placement_warehouse_check
        CHECK (warehouse_number > 0),

    CONSTRAINT placement_quantity_check
        CHECK (package_quantity > 0),

    CONSTRAINT placement_weight_check
        CHECK (weight >= 0),

    CONSTRAINT fk_product
        FOREIGN KEY (product_id)
        REFERENCES product_table(product_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);


CREATE INDEX idx_placement_product
    ON placement_table(product_id);

CREATE INDEX idx_placement_warehouse
    ON placement_table(warehouse_number);

CREATE INDEX idx_placement_shipment_date
    ON placement_table(shipment_date);

CREATE INDEX idx_placement_warehouse_date
    ON placement_table(warehouse_number, shipment_date);