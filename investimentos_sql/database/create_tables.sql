CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro DATE DEFAULT CURRENT_DATE
);

CREATE TABLE ativos (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(10) UNIQUE NOT NULL,
    nome VARCHAR(100),
    tipo VARCHAR(50) CHECK (tipo IN ('Ação', 'FII', 'Cripto', 'Renda Fixa'))
);

CREATE TABLE investimentos (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER REFERENCES usuarios(id),
    ativo_id INTEGER REFERENCES ativos(id),
    data_compra DATE NOT NULL,
    quantidade NUMERIC(10,2),
    preco_unitario NUMERIC(10,2)
);

CREATE TABLE cotacoes (
    id SERIAL PRIMARY KEY,
    ativo_id INTEGER REFERENCES ativos(id),
    data DATE NOT NULL,
    preco_fechamento NUMERIC(10,2)
);

CREATE TABLE dividendos (
    id SERIAL PRIMARY KEY,
    ativo_id INTEGER REFERENCES ativos(id),
    data_pagamento DATE,
    valor_total NUMERIC(10,2)
);
