-- Criação e inserção dos valores na tabela temp			
CREATE TABLE tabela_aux (
	aux_id SERIAL PRIMARY KEY,
	city VARCHAR,
	product_name VARCHAR,
	order_date date,
	order_price REAL,
	quantity BIGINT
);


INSERT INTO tabela_aux(city,product_name,order_date,order_price, quantity)
SELECT cidade, nome, data_t, preco_total, qtd
FROM dblink('dbname=Northwind ',
                'SELECT  cidade, nome, data_t, preco_total, qtd FROM tabela_temp')
				AS remote_table(cidade VARCHAR, nome VARCHAR, data_t DATE, preco_total REAL,
							   qtd BIGINT);
