-- Criando a extensão do dblink para poder inserir os dados do BD Nortwhind nas dimensões
CREATE EXTENSION dblink;

-- populando dimensao_produto
INSERT INTO dimensao_produto (descricao, categoria, preco)
SELECT product_name, category_id,unit_price 
FROM dblink('dbname=Northwind ',
                'SELECT product_name, category_id, unit_price FROM products')
				AS remote_table(product_name VARCHAR, category_id SMALLINT, unit_price REAL);

-- populando dimensao_local, tomando cuidado para nao repetir nada
INSERT INTO dimensao_local (cidade, regiao,pais)
SELECT ship_city, ship_region, ship_country
FROM dblink('dbname=Northwind ',
                'SELECT DISTINCT ship_city, ship_region, ship_country FROM orders')
				AS remote_table(ship_city VARCHAR, ship_region VARCHAR, ship_country VARCHAR);

-- populando dimensao_tempo, usando distinct para nao repetir as datas
INSERT INTO dimensao_tempo(dia, mes, ano, datat, dia_da_semana, dia_da_semana_por_extenso
						  ,semana_do_ano, quarter)
SELECT EXTRACT(DAY FROM order_date), EXTRACT(MONTH FROM order_date), 
EXTRACT(YEAR FROM order_date), order_date, EXTRACT(ISODOW FROM order_date),
TO_CHAR(order_date, 'day'),
EXTRACT(WEEK FROM order_date),
EXTRACT(QUARTER FROM order_date)
FROM dblink('dbname=Northwind ',
                'SELECT DISTINCT order_date FROM orders')
				AS remote_table(order_date DATE);