Resumo – SQL: LIMIT

A cláusula LIMIT define quantas linhas devem ser retornadas em uma consulta.
Alternativas em outros SGBDs:

TOP (SQL Server)

ROWNUM (Oracle)

FIRST (Firebird)

Pode ser usada com ORDER BY e opcionalmente com OFFSET para pular registros iniciais.

Exemplo base (tabela aluno)

Para retornar 3 alunos a partir do índice 0:

SELECT
  *
FROM
  alunos
LIMIT
  0, 3;

Sintaxe
Forma 1
SELECT colunas
FROM tabela
LIMIT valor
OFFSET valor;

Forma 2 (mais comum no MySQL)
SELECT colunas
FROM tabela
LIMIT índice_inicial, quantidade;

Na prática
Exemplo 1 — LIMIT + ORDER BY

Ordena por nome (ASC) e retorna apenas 3 registros:

SELECT
  *
FROM
  alunos
ORDER BY
  nome ASC
LIMIT
  0, 3;

Exemplo 2 — LIMIT + OFFSET

O OFFSET omite registros antes de aplicar o LIMIT:

SELECT
  *
FROM
  alunos
ORDER BY
  nome ASC
LIMIT 3
OFFSET 1;


Retorna 3 registros, mas pula o primeiro.

Exemplo 3 — LIMIT em consulta com GROUP BY, SUM e ORDER BY

Listar os 3 produtos com maior receita:

SELECT
   P.nome,
   SUM(VN.valor) as TOTAL
FROM
   produto P, venda_produto VN
WHERE
   P.id = VN.id_produto
GROUP BY
   P.id
ORDER BY
   TOTAL DESC
LIMIT 0, 3;


SUM(valor) soma o total vendido por produto

WHERE relaciona produto ↔ venda

GROUP BY agrupa por produto

ORDER BY DESC ordena pela maior receita

LIMIT reduz para os 3 maiores resultados