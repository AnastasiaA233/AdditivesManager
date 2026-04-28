INSERT INTO product_statuses (status_name, description, sort_order) VALUES
                                                                        ('действует', 'Продукт разрешен к использованию', 1),
                                                                        ('на регистрации', 'Продукт проходит процедуру регистрации', 2),
                                                                        ('отозван', 'Продукт запрещен или изъят из оборота', 3)
ON CONFLICT (status_name) DO NOTHING;

INSERT INTO product_types (type_name, description) VALUES
                                                       ('Пищевая добавка', 'Вещества, добавляемые в пищевые продукты'),
                                                       ('БАД', 'Биологически активные добавки к пище')
ON CONFLICT (type_name) DO NOTHING;