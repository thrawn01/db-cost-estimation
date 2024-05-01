\set aprice random(1, 100)
\set acost random(1, 100)
\set aweight random(1, 10)
\set alength random(1, 10)
\set awidth random(1, 10)
\set aheight random(1, 100)

BEGIN;

INSERT INTO products (name, description, sku, price, cost, weight, length, width, height, is_available)
VALUES ('This is a Product Name', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', 'sku-abu-2024-0001', :aprice, :acost, :aweight, :alength, :awidth, :aheight, true) RETURNING id \gset product_

INSERT INTO categories (name, description, product_id) VALUES ('Category 1', 'This is a category description', :product_id);
INSERT INTO categories (name, description, product_id) VALUES ('Category 2', 'This is a category description', :product_id);
INSERT INTO categories (name, description, product_id) VALUES ('Category 3', 'This is a category description', :product_id);
INSERT INTO categories (name, description, product_id) VALUES ('Category 4', 'This is a category description', :product_id);

INSERT INTO product_images (product_id, image_url) VALUES (:product_id, 'https://example.com/image_1.jpg');
INSERT INTO product_images (product_id, image_url) VALUES (:product_id, 'https://example.com/image_2.jpg');

INSERT INTO suppliers (name, description, address, phone, email, back_order_count) VALUES ('Supplier 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet nulla auctor, vestibulum magna sed, convallis ex. Cum sociis natoque penatibus et', '11 HalloWood, 90210', '435-867-5309', 'rick@morty.tv', :aheight) RETURNING id \gset supplier_one_

INSERT INTO inventory (product_id, in_stock, supplier_id) VALUES (:product_id, :acost, :supplier_one_id);
INSERT INTO inventory (product_id, in_stock, supplier_id) VALUES (:product_id, :acost, :supplier_one_id);

INSERT INTO suppliers (name, description, address, phone, email, back_order_count) VALUES ('Supplier 2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet nulla auctor, vestibulum magna sed, convallis ex. Cum sociis natoque penatibus et', '11 HalloWood, 90210', '435-867-5309', 'jerry@morty.tv', :aheight) RETURNING id \gset supplier_two_

INSERT INTO inventory (product_id, in_stock, supplier_id) VALUES (:product_id, :acost, :supplier_two_id);
INSERT INTO inventory (product_id, in_stock, supplier_id) VALUES (:product_id, :acost, :supplier_two_id);

INSERT INTO discount_codes (name, product_id, discount) VALUES ('DISC2345', :product_id, :acost);
INSERT INTO discount_codes (name, product_id, discount) VALUES ('DISC5474', :product_id, :acost);
INSERT INTO discount_codes (name, product_id, discount) VALUES ('NBCP2387', :product_id, :acost);
INSERT INTO discount_codes (name, product_id, discount) VALUES ('NBCX2387', :product_id, :acost);
INSERT INTO discount_codes (name, product_id, discount) VALUES ('NBCZ2387', :product_id, :acost);
INSERT INTO discount_codes (name, product_id, discount) VALUES ('NBCZ2387', :product_id, :acost + 10);

COMMIT;