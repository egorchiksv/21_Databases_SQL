-- SET
SET @test := 5;
SELECT @test;

-- SELECT
SELECT @test_var := 50;

-- Запишем запрос короче, использую while:
DECLARE i INT DEFAULT 3;
	WHILE i>0 DO
		SELECT magazine_incoming.id_incoming, products.name, products.author, magazine_incoming.quantily
        FROM magazine_incoming.id_incoming, products
        WHERE magazine_incoming.id_products=products.id_products AND magazine_incoming.id_incoming=i;
        SET i=i-1;
	END WHILE;