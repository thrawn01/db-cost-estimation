\set aoffset random(1, 1000000)
\set alimit random(1, 100)

SELECT
    p.*,
    c.name AS category_name,
    array_to_string(array_agg(pi.image_url), ',') AS image_urls,
    (
        SELECT SUM(i.in_stock)
        FROM inventory i
        WHERE i.product_id = p.id
    ) AS in_stock,
    (
        SELECT s.back_order_count
        FROM suppliers s
        WHERE s.id = (
            SELECT i.supplier_id
            FROM inventory i
            WHERE i.product_id = p.id
            LIMIT 1
        )
    ) AS back_order_count,
    array_to_string(array_agg(dc.name), ',') AS discount_codes
FROM
    products p
        JOIN
    categories c ON p.id = c.product_id
        JOIN
    product_images pi ON p.id = pi.product_id
        JOIN
    inventory i ON p.id = i.product_id
        JOIN
    discount_codes dc ON p.id = dc.product_id
GROUP BY
    p.id, c.name
OFFSET :aoffset
    LIMIT :alimit;