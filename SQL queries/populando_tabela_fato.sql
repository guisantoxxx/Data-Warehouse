-- Populando a tabela fato
INSERT INTO fato_vendas(pk_produto, pk_tempo,pk_local, valor, quantidade)
SELECT pk_produto, pk_tempo, pk_local, order_price, quantity
FROM tabela_aux ta
JOIN  dimensao_produto dp ON ta.product_name = dp.descricao
JOIN dimensao_tempo dt ON ta.order_date = dt.datat
JOIN dimensao_local dl ON ta.city = dl.cidade;
