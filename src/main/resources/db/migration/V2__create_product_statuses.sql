CREATE TABLE IF NOT EXISTS product_statuses (
                                                id SERIAL PRIMARY KEY,
                                                status_name VARCHAR(50) NOT NULL UNIQUE,
                                                description TEXT,
                                                sort_order INTEGER DEFAULT 0
);