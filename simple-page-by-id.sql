\set aoffset random(1, 2000000)

SELECT p.* FROM products p WHERE id > :aoffset ORDER by id LIMIT 10;