Resumo – SQL: HAVING

A cláusula HAVING é utilizada para filtrar resultados, de forma semelhante ao WHERE, porém com uma diferença fundamental: ela permite o uso de funções de agregação. Por isso, é aplicada após o GROUP BY, filtrando resultados já agrupados.

Visão geral

O HAVING é muito usado para:

Filtrar resultados que utilizam SUM, COUNT, AVG, etc.;

Aplicar condições após o agrupamento, o que não é possível com WHERE;

Trabalhar com filtros mais complexos, inclusive com subqueries.

Os exemplos utilizam as tabelas:

produto: produtos do estoque;

categoria_produto: categorias existentes;

venda_produto: vendas realizadas (valor e data);

pessoa: dados de pessoas (no último exemplo).

Sintaxe básica
SELECT
  coluna1, coluna2, ...
FROM
  tabela1, tabela2, ...
GROUP BY
  campo1, campo2, ...
HAVING
  condição;


Dica importante:

WHERE filtra linhas antes do agrupamento

HAVING filtra resultados depois do agrupamento

Na prática
Exemplo 1 – Produtos vendidos em 2018 com receita maior que 300

Objetivo: listar produtos vendidos em 2018 cuja receita total seja maior que 300.

SELECT
    P.nome,
    SUM(V.valor) AS RECEBIDO
FROM
    produto P, venda_produto V
WHERE
    YEAR(V.data) = 2018 AND
    P.id = V.id_produto
GROUP BY
    P.id
HAVING
    SUM(V.valor) > 300;


Dicas:

WHERE filtra o ano (2018).

GROUP BY agrupa por produto.

HAVING usa SUM para filtrar pela receita total.

Resultado:
Notebook (7000.00) e Monitor LG 19 (450.00).

Exemplo 2 – Produtos com no mínimo duas vendas

Objetivo: exibir produtos e sua receita total, mostrando apenas aqueles com duas ou mais vendas.

SELECT
    P.id,
    P.nome AS PRODUTO,
    SUM(V.valor) AS RECEITA
FROM
    produto P,
    venda_produto V
WHERE
    P.id = V.id_produto
GROUP BY
    P.id
HAVING
    COUNT(V.id_produto) >= 2;


Dicas:

SUM calcula a receita total.

COUNT é usado no HAVING para filtrar produtos com múltiplas vendas.

Esse tipo de filtro não pode ser feito com WHERE.

Resultado: Bola, Patinete, Notebook e O dia do Curinga.

Exemplo 3 – Identificar homônimos

Objetivo: listar nomes que aparecem mais de uma vez na tabela pessoa.

SELECT
    nome
FROM
    pessoa
GROUP BY
    nome
HAVING
    COUNT(nome) > 1;


Dica: o HAVING é ideal para detectar valores duplicados após o agrupamento.

Resultado: Pedro Henrique e Thiago Henrique.

Conclusão:
O HAVING é essencial em consultas SQL com GROUP BY, pois permite filtrar resultados agregados, oferecendo maior flexibilidade e precisão em análises e relatórios.