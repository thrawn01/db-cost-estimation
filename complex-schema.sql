DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS product_images;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS discount_codes;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS product_reviews;

CREATE TABLE products
(
    id           SERIAL PRIMARY KEY,
    name         VARCHAR(255)   NOT NULL,
    description  VARCHAR(500)   NOT NULL,
    sku          VARCHAR(50)    NOT NULL,
    price        DECIMAL(10, 2) NOT NULL,
    cost         DECIMAL(10, 2) NOT NULL,
    weight       DECIMAL(10, 2),
    length       DECIMAL(10, 2),
    width        DECIMAL(10, 2),
    height       DECIMAL(10, 2),
    is_available BOOLEAN        NOT NULL DEFAULT FALSE,
    created_at   TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at   TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories
(
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    description VARCHAR(500) NOT NULL,
    product_id  INTEGER      NOT NULL,
    created_at  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE product_images
(
    id         SERIAL PRIMARY KEY,
    product_id INTEGER      NOT NULL,
    image_url  VARCHAR(255) NOT NULL,
    created_at TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE inventory
(
    id          SERIAL PRIMARY KEY,
    product_id  INTEGER   NOT NULL,
    supplier_id INTEGER   NOT NULL,
    in_stock    INTEGER   NOT NULL,
    created_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE discount_codes
(
    id         SERIAL PRIMARY KEY,
    name       VARCHAR(100) NOT NULL,
    product_id INTEGER      NOT NULL,
    discount   INTEGER      NOT NULL,
    created_at TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE suppliers
(
    id               SERIAL PRIMARY KEY,
    name             VARCHAR(100) NOT NULL,
    description      VARCHAR(500) NOT NULL,
    back_order_count INTEGER      NOT NULL,
    address          VARCHAR(255),
    phone            VARCHAR(20),
    email            VARCHAR(100),
    created_at       TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at       TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_discount_codes_product_id ON discount_codes (product_id);
CREATE INDEX idx_inventory_product_id ON inventory (product_id);
CREATE INDEX idx_inventory_supplier_id ON inventory (supplier_id);
CREATE INDEX idx_product_images_product_id ON product_images (product_id);
CREATE INDEX idx_product_categories_product_id ON categories (product_id);