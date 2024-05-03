\set aoffset random(1, 1000)

SELECT p.*,
       array_to_string(array_agg(dc.name), ',') AS discount_codes
FROM products p
         JOIN
     categories c ON p.id = c.product_id
         JOIN
     inventory i ON p.id = i.product_id
         JOIN
     discount_codes dc ON p.id = dc.product_id
GROUP BY p.id, c.name
OFFSET :aoffset LIMIT 10;