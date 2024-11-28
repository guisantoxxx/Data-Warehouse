-- Criando e populando a tabela temporária na origem para poder usar no DW
CREATE TABLE tabela_temp (
	temp_id SERIAL PRIMARY KEY,
	cidade VARCHAR,
	nome VARCHAR,
	data_t DATE,
	preco_total REAL,
	qtd BIGINT
);

INSERT INTO tabela_temp(cidade, nome, data_t, preco_total, qtd)
SELECT 
    o.ship_city,
    p.product_name, 
    o.order_date, 
    SUM(od.quantity * od.unit_price * (1 - od.discount)) AS total_price,
    SUM(od.quantity) AS total_quantity
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
JOIN products p ON p.product_id = od.product_id
GROUP BY p.product_name, o.order_date, o.ship_country, o.ship_city;
