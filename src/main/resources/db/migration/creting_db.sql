-- =====================================================
-- 1. Справочник статусов продукции
-- =====================================================
CREATE TABLE product_statuses (
                                  id SERIAL PRIMARY KEY,
                                  status_name VARCHAR(50) NOT NULL UNIQUE,
                                  description TEXT
);

-- =====================================================
-- 2. Справочник типов продукции
-- =====================================================
CREATE TABLE product_types (
                               id SERIAL PRIMARY KEY,
                               type_name VARCHAR(100) NOT NULL UNIQUE,
                               description TEXT
);

-- =====================================================
-- 3. Производители
-- =====================================================
CREATE TABLE manufacturers (
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

-- =====================================================
-- 4. Основная таблица - Карточка номенклатуры
-- =====================================================
CREATE TABLE products (
                          id SERIAL PRIMARY KEY,
                          product_name VARCHAR(255) NOT NULL,
                          product_type_id INTEGER NOT NULL REFERENCES product_types(id),
                          tn_ved_code VARCHAR(50),
                          e_number VARCHAR(20),
                          release_form VARCHAR(100),
                          sgr_number VARCHAR(100),
                          sgr_registration_date DATE,
                          shelf_life_months INTEGER CHECK (shelf_life_months > 0),
                          storage_conditions TEXT,
                          status_id INTEGER NOT NULL REFERENCES product_statuses(id),
                          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- 5. Связующая таблица (Many-to-Many: продукты и производители)
-- =====================================================
CREATE TABLE product_manufacturer (
                                      product_id INTEGER NOT NULL REFERENCES products(id) ON DELETE CASCADE,
                                      manufacturer_id INTEGER NOT NULL REFERENCES manufacturers(id) ON DELETE CASCADE,
                                      PRIMARY KEY (product_id, manufacturer_id)
);

-- =====================================================
-- Индексы
-- =====================================================
CREATE INDEX idx_products_name ON products(product_name);
CREATE INDEX idx_products_tn_ved ON products(tn_ved_code);
CREATE INDEX idx_products_e_number ON products(e_number);
CREATE INDEX idx_products_sgr ON products(sgr_number);
CREATE INDEX idx_products_status ON products(status_id);
CREATE INDEX idx_products_type ON products(product_type_id);
CREATE INDEX idx_manufacturer_name ON manufacturers(name);
CREATE INDEX idx_manufacturer_country ON manufacturers(country);
CREATE INDEX idx_product_manufacturer_product ON product_manufacturer(product_id);
CREATE INDEX idx_product_manufacturer_manufacturer ON product_manufacturer(manufacturer_id);

-- =====================================================
-- Функция обновления updated_at
-- =====================================================
CREATE OR REPLACE FUNCTION update_updated_at_column()
    RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

-- =====================================================
-- Триггеры для автоматического обновления updated_at
-- =====================================================
CREATE TRIGGER update_products_updated_at
    BEFORE UPDATE ON products
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_manufacturers_updated_at
    BEFORE UPDATE ON manufacturers
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- =====================================================
-- Начальные данные
-- =====================================================

-- Статусы
INSERT INTO product_statuses (status_name, description) VALUES
                                                            ('действует', 'Продукт разрешен к использованию'),
                                                            ('на регистрации', 'Продукт проходит процедуру регистрации'),
                                                            ('отозван', 'Продукт запрещен или изъят из оборота');

-- Типы продукции
INSERT INTO product_types (type_name, description) VALUES
                                                       ('Пищевая добавка', 'Вещества, добавляемые в пищевые продукты для придания определенных свойств'),
                                                       ('БАД', 'Биологически активные добавки к пище');








INSERT INTO product_types (type_name, description) VALUES
                                                       ('Пищевая добавка', 'Вещества, добавляемые в пищевые продукты для придания определенных свойств'),
                                                       ('БАД', 'Биологически активные добавки к пище');


SELECT * FROM product_manufacturer;