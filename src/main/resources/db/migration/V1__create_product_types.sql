CREATE TABLE IF NOT EXISTS product_types (
                                             id SERIAL PRIMARY KEY,
                                             type_name VARCHAR(100) NOT NULL UNIQUE,
                                             description TEXT
);