Resumo – SQL: Data

O SQL oferece funções pré-definidas para manipular campos do tipo DATE, permitindo extrair dia (DAY), mês (MONTH) ou ano (YEAR). Isso é muito útil para filtros, cálculos e análises baseadas em datas.

Visão geral

Manipular partes específicas de um campo DATE é comum no dia a dia do desenvolvedor, principalmente para obter informações temporais relevantes a partir dos dados armazenados.

Estrutura usada nos exemplos

produto: armazena os produtos (id, nome, preço, categoria).

categoria_produto: armazena as categorias.

venda_produto: registra as vendas, incluindo valor e data.

Exemplo 1 – Total de vendas por produto em 2018

Objetivo: listar o total de vendas de cada produto no ano de 2018.

SELECT
P.nome as PRODUTO,
COUNT(V.id_produto) as TOTAL_VENDIDO
FROM
produto P, venda_produto V
WHERE P.id = V.id_produto AND
YEAR(V.data) = 2018
GROUP BY
P.id;


Dica: use YEAR(data) para filtrar registros por ano.
Resultado: mostra cada produto e quantas vezes foi vendido em 2018 (ex.: Bola = 3, Patinete = 2, Notebook = 2).

Sintaxe básica
SELECT
[ DAY | MONTH | YEAR (tabela.coluna), ... | * ]
FROM
[ tabela ]

Exemplo 2 – Dois meses mais lucrativos do ano

Objetivo: identificar os dois meses com maior faturamento.

SELECT
MONTH(V.data) as MES,
SUM(V.valor) as TOTAL_RECEBIDO
FROM
venda_produto V
GROUP BY
MES
ORDER BY
TOTAL_RECEBIDO DESC
LIMIT 0, 2;


Dicas:

MONTH(data) extrai o mês.

SUM(valor) calcula o total recebido.

ORDER BY DESC ordena do maior para o menor.

LIMIT restringe a quantidade de resultados.

Resultado: julho (7) como mês mais lucrativo, seguido de maio (5).

Exemplo 3 – Produtos vendidos em 15 de julho

Objetivo: listar os produtos vendidos em um dia específico.

SELECT
P.nome as PRODUTO
FROM
produto P, venda_produto V
WHERE
P.id = V.id_produto AND
DAY(V.data) = 15 AND
MONTH(V.data) = 7
GROUP BY
P.id;


Dica: combine DAY() e MONTH() para filtrar datas exatas.
Resultado: produtos como Bola, Patinete, Carrinho, O Diário de Anne Frank e O dia do Curinga.

Conclusão:
As funções DAY, MONTH e YEAR facilitam análises temporais no SQL, permitindo consultas claras e eficientes sem alterar a estrutura original dos dados.