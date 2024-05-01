\set aprice random(1, 100)
\set abackorder random(1, 100)
\set ainstock random(1, 100)
\set acost random(1, 100)
\set aweight random(1, 10)
\set alength random(1, 10)
\set awidth random(1, 10)
\set aheight random(1, 100)

BEGIN;

INSERT INTO products (name, description, sku, on_back_order, in_stock, image_urls, discount_codes, categories, price,
                      cost, weight, length, width, height, is_available)
VALUES ('This is a Product Name',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
        'sku-abu-2024-0001', :abackorder, :ainstock, 'https://example.com/img_1.png, https://example.com/img_2.png',
        'DISC2345,DISC2345', 'Category 1,Category 2', :aprice, :acost, :aweight, :alength, :awidth, :aheight, true);

COMMIT;