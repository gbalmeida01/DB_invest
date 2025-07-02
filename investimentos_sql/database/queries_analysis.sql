SELECT
    u.nome,
    a.codigo,
    i.quantidade,
    c.preco_fechamento AS preco_atual,
    ROUND(i.quantidade * c.preco_fechamento, 2) AS valor_total_atual
FROM investimentos i
JOIN usuarios u ON i.usuario_id = u.id
JOIN ativos a ON i.ativo_id = a.id
JOIN cotacoes c ON a.id = c.ativo_id
WHERE c.data = '2025-07-01';

SELECT
    a.codigo,
    SUM(i.quantidade * c.preco_fechamento - i.quantidade * i.preco_unitario) AS lucro_prejuizo
FROM investimentos i
JOIN ativos a ON i.ativo_id = a.id
JOIN cotacoes c ON a.id = c.ativo_id
WHERE c.data = '2025-07-01'
GROUP BY a.codigo;

SELECT
    a.codigo,
    SUM(d.valor_total) AS total_dividendos
FROM dividendos d
JOIN ativos a ON d.ativo_id = a.id
GROUP BY a.codigo;
