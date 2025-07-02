INSERT INTO usuarios (nome, email) VALUES
('Gabriel Almeida', 'gabriel@email.com');

INSERT INTO ativos (codigo, nome, tipo) VALUES
('ITSA4', 'Itaúsa', 'Ação'),
('KNRI11', 'Kinea Renda Imobiliária', 'FII'),
('BTC', 'Bitcoin', 'Cripto');

INSERT INTO investimentos (usuario_id, ativo_id, data_compra, quantidade, preco_unitario) VALUES
(1, 1, '2024-01-10', 100, 9.50),
(1, 2, '2024-02-20', 10, 120.00),
(1, 3, '2024-03-15', 0.005, 200000.00);

INSERT INTO cotacoes (ativo_id, data, preco_fechamento) VALUES
(1, '2025-07-01', 10.25),
(2, '2025-07-01', 135.00),
(3, '2025-07-01', 295000.00);

INSERT INTO dividendos (ativo_id, data_pagamento, valor_total) VALUES
(1, '2025-06-30', 50.00),
(2, '2025-06-30', 75.00);
