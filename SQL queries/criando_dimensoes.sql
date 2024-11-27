-- Criação da dimensão local
CREATE TABLE dimensao_local (
  pk_local SERIAL PRIMARY KEY,
  cidade VARCHAR,
  regiao VARCHAR,
  pais VARCHAR
);

-- Criação da dimensão tempo
CREATE TABLE dimensao_tempo (
  pk_tempo SERIAL PRIMARY KEY,
  dia INT,
  mes INT,
  ano INT,
  datat DATE,
  dia_da_semana VARCHAR,
  dia_da_semana_por_extenso VARCHAR,
  semana_do_ano INT,
  quarter INT
);

-- Criação da dimensão produto
CREATE TABLE dimensao_produto (
  pk_produto SERIAL PRIMARY KEY,
  descricao VARCHAR,
  preco REAL,
  categoria SMALLINT
);


