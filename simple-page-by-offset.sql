\set aoffset random(1, 2000000)

SELECT name, description, sku, on_back_order, in_stock, image_urls, discount_codes, categories, price, weight,
       length, width, height, is_available FROM products OFFSET :aoffset LIMIT 10;