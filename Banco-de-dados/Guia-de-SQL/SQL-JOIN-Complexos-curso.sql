SQL: JOINs Complexos – Resumo
O que são JOINs Complexos?

JOINs complexos são consultas SQL que combinam:

múltiplas tabelas

funções de agregação (COUNT, SUM)

filtros por data

GROUP BY, HAVING, ORDER BY

subconsultas (subqueries)

São muito usados em relatórios, análises e regras de negócio.

Exemplo 1 – Tópicos com mais curtidas em julho
Objetivo

Listar tópicos que tiveram 2 ou mais curtidas no mês de julho.

SELECT t.titulo, COUNT(l.id_like) AS total
FROM likes l, topico t
WHERE l.id_topico = t.id_topico
AND MONTH(l.data_criacao) = 7
GROUP BY l.id_topico
HAVING COUNT(l.id_like) >= 2;

Conceitos usados

JOIN entre tabelas

Filtro por mês

COUNT + GROUP BY

HAVING para filtrar agregações

💡 Dica:
Use HAVING quando precisar filtrar resultados gerados por funções agregadas.

Exemplo 2 – Dias com mais curtidas
Objetivo

Buscar os 3 dias com mais curtidas em julho.

SELECT DAY(l.data_criacao) AS dia, COUNT(l.id_like) AS total
FROM likes l, topico t
WHERE l.id_topico = t.id_topico
AND MONTH(l.data_criacao) = 7
GROUP BY dia
ORDER BY total DESC
LIMIT 3;

Conceitos usados

Função de data (DAY)

Ordenação (ORDER BY)

Limitação de resultados (LIMIT)

💡 Dica:
Sempre use ORDER BY antes do LIMIT para garantir resultados corretos.

Exemplo 3 – Tópicos mais curtidos do mês
Objetivo

Listar os 3 tópicos mais curtidos em julho.

SELECT t.titulo, COUNT(l.id_like) AS total
FROM likes l, topico t
WHERE l.id_topico = t.id_topico
AND MONTH(l.data_criacao) = 7
GROUP BY l.id_topico
ORDER BY total DESC
LIMIT 3;


📌 Diferença para o exemplo anterior:

Aqui o agrupamento é por tópico, não por dia.

Exemplo 4 – Vendas totalmente pagas
Objetivo

Encontrar vendas que não possuem parcelas em aberto.

SELECT V.ID, V.DATA, V.VALOR
FROM VENDAS V
WHERE V.ID NOT IN (
  SELECT P.ID_VENDA
  FROM VENDAS_PARCELAS P
  WHERE P.DATA_PAGAMENTO IS NULL
)
AND MONTH(V.DATA) = 5;

Conceitos usados

Subquery

NOT IN

Verificação de NULL

💡 Dica:
Subconsultas são ótimas para excluir registros com pendências.

Exemplo 5 – Comissão por venda
Objetivo

Calcular comissão apenas para vendas cuja 1ª parcela foi paga.

SELECT
  V.ID,
  V.VALOR,
  (V.VALOR * 0.10) AS VALOR_COMISSAO
FROM VENDAS V, VENDAS_PARCELAS P
WHERE V.ID = P.ID_VENDA
AND P.NUMERO_PARCELA = 1
AND P.DATA_PAGAMENTO IS NOT NULL;

Conceitos usados

JOIN entre tabelas

Regra de negócio

Coluna calculada

💡 Dica:
Colunas calculadas são muito úteis em relatórios financeiros.

Boas práticas em JOINs complexos

Use aliases para melhorar a leitura

Separe filtros entre WHERE e HAVING

Cuidado com GROUP BY para evitar dados duplicados

Prefira JOIN explícito (INNER JOIN, LEFT JOIN)

Monte a query passo a passo

📌 Regra de ouro:

Comece simples, teste os resultados e vá adicionando complexidade gradualmente.