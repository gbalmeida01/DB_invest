SELECT 
    u.nome,
    ROUND(SUM(i.quantidade * c.preco_fechamento), 2) AS patrimonio_atual
FROM investimentos i
JOIN usuarios u ON i.usuario_id = u.id
JOIN cotacoes c ON c.ativo_id = i.ativo_id AND c.data = '2025-07-01'
GROUP BY u.nome;

SELECT 
    a.codigo,
    a.tipo,
    SUM(i.quantidade * i.preco_unitario) AS valor_investido,
    SUM(i.quantidade * c.preco_fechamento) AS valor_atual,
    ROUND(SUM(i.quantidade * c.preco_fechamento - i.quantidade * i.preco_unitario), 2) AS lucro_prejuizo,
    ROUND(((SUM(i.quantidade * c.preco_fechamento) - SUM(i.quantidade * i.preco_unitario)) / 
           SUM(i.quantidade * i.preco_unitario)) * 100, 2) AS rentabilidade_percentual
FROM investimentos i
JOIN ativos a ON a.id = i.ativo_id
JOIN cotacoes c ON c.ativo_id = i.ativo_id AND c.data = '2025-07-01'
GROUP BY a.codigo, a.tipo;

SELECT 
    a.tipo,
    ROUND(SUM(i.quantidade * i.preco_unitario), 2) AS total_investido
FROM investimentos i
JOIN ativos a ON a.id = i.ativo_id
GROUP BY a.tipo;

SELECT 
    a.codigo,
    SUM(d.valor_total) AS dividendos_recebidos
FROM dividendos d
JOIN ativos a ON a.id = d.ativo_id
GROUP BY a.codigo;

WITH carteira AS (
    SELECT 
        a.codigo,
        i.quantidade * c.preco_fechamento AS valor_total
    FROM investimentos i
    JOIN ativos a ON a.id = i.ativo_id
    JOIN cotacoes c ON c.ativo_id = a.id AND c.data = '2025-07-01'
)
SELECT 
    codigo,
    ROUND(valor_total, 2) AS valor_total,
    ROUND((valor_total / (SELECT SUM(valor_total) FROM carteira)) * 100, 2) AS percentual_carteira
FROM carteira
ORDER BY percentual_carteira DESC;

SELECT 
    c.data,
    ROUND(SUM(i.quantidade * c.preco_fechamento), 2) AS patrimonio_no_dia
FROM investimentos i
JOIN cotacoes c ON c.ativo_id = i.ativo_id
GROUP BY c.data
ORDER BY c.data;
