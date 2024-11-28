-- Criação da tabela fato
CREATE TABLE fato_vendas (
	pk_produto INT NOT NULL,
	pk_tempo INT NOT NULL,
	pk_local INT NOT NULL,
	valor REAL,
	quantidade INT,
	FOREIGN KEY(pk_produto) REFERENCES dimensao_produto(pk_produto)
	FOREIGN KEY(pk_local) REFERENCES dimensao_local(pk_local)
	FOREIGN KEY(pk_tempo) REFERENCES dimensao_tempo(pk_tempo)
);
