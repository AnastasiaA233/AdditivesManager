CREATE TABLE IF NOT EXISTS products (
                                        id SERIAL PRIMARY KEY,
                                        product_name VARCHAR(255) NOT NULL,
                                        product_type_id INTEGER NOT NULL REFERENCES product_types(id),
                                        tn_ved_code VARCHAR(50),
                                        e_number VARCHAR(20),
                                        release_form VARCHAR(100),
                                        manufacturer_id INTEGER NOT NULL REFERENCES manufacturers(id),
                                        sgr_number VARCHAR(100),
                                        sgr_registration_date DATE,
                                        shelf_life_months INTEGER CHECK (shelf_life_months > 0),
                                        storage_conditions TEXT,
                                        status_id INTEGER NOT NULL REFERENCES product_statuses(id),
                                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_products_name ON products(product_name);
CREATE INDEX idx_products_e_number ON products(e_number);