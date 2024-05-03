DROP TABLE IF EXISTS products;

CREATE TABLE products
(
    id             SERIAL PRIMARY KEY,
    name           VARCHAR(255)   NOT NULL,
    description    TEXT,
    sku            VARCHAR(50)    NOT NULL,
    on_back_order  DECIMAL(10, 2) NOT NULL,
    in_stock       DECIMAL(10, 2) NOT NULL,
    image_urls     VARCHAR(500)   NOT NULL,
    discount_codes VARCHAR(356)   NOT NULL,
    categories     VARCHAR(356)   NOT NULL,
    price          DECIMAL(10, 2) NOT NULL,
    cost           DECIMAL(10, 2) NOT NULL,
    weight         DECIMAL(10, 2),
    length         DECIMAL(10, 2),
    width          DECIMAL(10, 2),
    height         DECIMAL(10, 2),
    is_available   BOOLEAN        NOT NULL DEFAULT FALSE,
    created_at     TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at     TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP
);