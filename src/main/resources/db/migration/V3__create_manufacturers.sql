CREATE TABLE IF NOT EXISTS manufacturers (
                                             id SERIAL PRIMARY KEY,
                                             name VARCHAR(255) NOT NULL,
                                             country VARCHAR(100) NOT NULL,
                                             legal_address TEXT,
                                             inn VARCHAR(50),
                                             ogrn VARCHAR(50),
                                             contact_phone VARCHAR(50),
                                             contact_email VARCHAR(100),
                                             website VARCHAR(255),
                                             created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                             updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);