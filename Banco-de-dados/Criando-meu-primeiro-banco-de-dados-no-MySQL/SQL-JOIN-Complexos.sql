SQL: JOINs Complexos – Resumo
O que são JOINs Complexos?

JOINs complexos surgem quando a consulta:

envolve múltiplas tabelas

utiliza funções de agregação (COUNT, SUM, etc.)

aplica filtros por data

usa GROUP BY, HAVING, ORDER BY

combina subconsultas (subqueries)

👉 São consultas comuns em relatórios, dashboards e regras de negócio.

Exemplo 1 – Tópicos com mais curtidas em um mês
Objetivo

Listar tópicos que tiveram mais de 2 curtidas em julho.

SELECT
  t.titulo,
  COUNT(l.id_like) AS total
FROM likes l, topico t
WHERE l.id_topico = t.id_topico
AND MONTH(l.data_criacao) = 7
GROUP BY l.id_topico
HAVING COUNT(l.id_like) >= 2;

Conceitos usados

✔ JOIN entre tabelas
✔ Filtro por mês
✔ COUNT + GROUP BY
✔ HAVING para filtrar agregações

✅ Dica:

Use HAVING quando o filtro depender de funções agregadas.

Exemplo 2 – Dias com mais curtidas
Objetivo

Encontrar os 3 dias com mais curtidas em julho.

SELECT
  DAY(l.data_criacao) AS Dia,
  COUNT(l.id_like) AS total
FROM likes l, topico t
WHERE l.id_topico = t.id_topico
AND MONTH(l.data_criacao) = 7
GROUP BY Dia
ORDER BY total DESC
LIMIT 3;

Conceitos usados

✔ Função de data (DAY)
✔ Ordenação decrescente
✔ Limite de resultados

✅ Dica:

Sempre use ORDER BY antes do LIMIT.

Exemplo 3 – Tópicos mais curtidos
Objetivo

Listar os 3 tópicos mais curtidos em julho.

SELECT
  t.titulo,
  COUNT(l.id_like) AS total
FROM likes l, topico t
WHERE l.id_topico = t.id_topico
AND MONTH(l.data_criacao) = 7
GROUP BY l.id_topico
ORDER BY total DESC
LIMIT 3;


📌 Diferença do exemplo anterior:

Aqui o agrupamento é por tópico, não por dia.

Exemplo 4 – Vendas totalmente pagas
Objetivo

Listar vendas que não possuem parcelas em aberto.

SELECT
  V.ID,
  V.DATA,
  V.VALOR
FROM VENDAS V
WHERE V.ID NOT IN (
  SELECT P.ID_VENDA
  FROM VENDAS_PARCELAS P
  WHERE P.DATA_PAGAMENTO IS NULL
)
AND MONTH(V.DATA) = 5;

Conceitos usados

✔ Subquery
✔ NOT IN
✔ Verificação de NULL

✅ Dica:

Subqueries são úteis para excluir registros indesejados.

Exemplo 5 – Comissão por venda paga
Objetivo

Calcular comissão somente para vendas cuja 1ª parcela foi paga.

SELECT
  V.ID,
  V.VALOR,
  P.DATA_PAGAMENTO,
  (V.VALOR * 0.10) AS VALOR_COMISSAO
FROM VENDAS V, VENDAS_PARCELAS P
WHERE V.ID = P.ID_VENDA
AND P.NUMERO_PARCELA = 1
AND P.DATA_PAGAMENTO IS NOT NULL;

Conceitos usados

✔ JOIN entre tabelas
✔ Regra de negócio
✔ Coluna calculada

✅ Dica:

Use colunas calculadas para regras financeiras e relatórios.

Boas práticas para JOINs complexos

✔ Use aliases para melhorar a leitura
✔ Separe filtros entre WHERE e HAVING
✔ Agrupe corretamente para evitar resultados duplicados
✔ Prefira JOIN explícito (INNER JOIN, LEFT JOIN) em vez de vírgulas
✔ Teste a query por partes

Quando usar JOINs complexos?

Relatórios avançados

Análises estatísticas

Regras de negócio

Dashboards

Consultas de auditoria

📌 Regra de ouro:

Comece simples e evolua a query aos poucos, validando cada etapa.