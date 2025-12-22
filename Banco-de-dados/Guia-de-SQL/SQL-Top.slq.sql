Resumo – SQL: TOP

A cláusula TOP limita a quantidade de linhas retornadas em uma consulta SQL.
Nem todos os SGBDs suportam TOP; alternativas incluem:

LIMIT (MySQL)

ROWNUM (Oracle)

FIRST (Firebird)

TOP é frequentemente usada com ORDER BY para obter os maiores ou menores valores.

Exemplo base (tabela aluno)

Para retornar apenas os 3 primeiros registros:

SELECT
  TOP 3
  *
FROM
  aluno;

Sintaxe
SELECT
  TOP N
  [ coluna1, coluna2, ... | * ]
FROM
  tabela;


N = número de linhas desejadas.

Na prática
Exemplo 1 — TOP + ORDER BY

Ordenando por nome em ordem crescente e trazendo apenas 3 registros:

SELECT
  TOP 3
  *
FROM
  aluno
ORDER BY
  nome ASC;

Exemplo 2 — TOP com funções agregadoras

Tabelas: produto e venda_produto.
Objetivo: 3 produtos com maior receita.

SELECT TOP 3
   P.nome,
   SUM(VN.valor) as TOTAL
FROM
   produto P, venda_produto VN
WHERE
   P.id = VN.id_produto
GROUP BY
   P.id
ORDER BY
   TOTAL DESC;


A consulta:

soma os valores de venda (SUM)

relaciona produto ↔ venda_produto (WHERE)

agrupa por produto (GROUP BY)

ordena do maior para o menor (ORDER BY DESC)

retorna só os 3 maiores (TOP 3)