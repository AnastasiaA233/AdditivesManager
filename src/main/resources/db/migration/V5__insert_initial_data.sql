INSERT INTO product_statuses (status_name, description) VALUES
                                                                        ('действует', 'Продукт разрешен к использованию'),
                                                                        ('на регистрации', 'Продукт проходит процедуру регистрации'),
                                                                        ('отозван', 'Продукт запрещен или изъят из оборота')
ON CONFLICT (status_name) DO NOTHING;

INSERT INTO product_types (type_name, description) VALUES
                                                       ('Пищевая добавка', 'Вещества, добавляемые в пищевые продукты'),
                                                       ('БАД', 'Биологически активные добавки к пище')
ON CONFLICT (type_name) DO NOTHING;