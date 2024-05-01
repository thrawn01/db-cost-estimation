\set aoffset random(1, 2000000)

SELECT p.* FROM products p OFFSET :aoffset LIMIT 10;