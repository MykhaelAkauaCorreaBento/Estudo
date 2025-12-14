Resumo – SQL: GROUP BY

A cláusula GROUP BY é usada para agrupar dados semelhantes, permitindo utilizar uma ou mais colunas no agrupamento. Ela é muito aplicada em conjunto com funções de agregação (COUNT, SUM, etc.), onde o cálculo é feito sobre vários registros, mas o resultado é exibido de forma agrupada.

Visão geral

O agrupamento de dados facilita a análise de informações em comum, como totais por categoria, por dia ou por mês. Nos exemplos, são utilizadas as tabelas:

produto: dados dos produtos;

categoria_produto: categorias existentes;

venda_produto: registros das vendas (valor e data).

Exemplo – Quantidade de produtos por categoria

Objetivo: saber quantos produtos estão cadastrados em cada categoria.

SELECT
  COUNT(P.ID) AS TOTAL,
  C.nome AS CATEGORIA
FROM
  produto P, categoria_produto C
WHERE
  P.id_categoria = C.id
GROUP BY
  C.id;


Dicas:

COUNT(P.ID) calcula o total de produtos.

GROUP BY C.id define que o agrupamento será por categoria.

Resultado:

Infantil: 4

Informática: 2

Educacional: 4

Sintaxe básica
SELECT
  coluna1, coluna2, ...
FROM
  tabela1, tabela2, ...
GROUP BY
  coluna1, coluna2, ...;

Na prática
Exemplo 1 – Total recebido por categoria

Objetivo: somar o valor das vendas agrupadas por categoria.

SELECT
  SUM(VP.valor) AS TOTAL,
  C.nome AS CATEGORIA
FROM
  produto P, categoria_produto C, venda_produto VP
WHERE
  P.id_categoria = C.id AND
  VP.id_produto = P.id
GROUP BY
  C.id;


Dica: use SUM junto com GROUP BY para obter totais por grupo.

Resultado:

Infantil: 360.00

Informática: 7450.00

Educacional: 223.00

Exemplo 2 – Total recebido por dia

Objetivo: obter o total vendido em cada data.

SELECT
  SUM(valor) AS TOTAL,
  data
FROM
  venda_produto
GROUP BY
  data;


Dica: o SQL soma os valores de todas as vendas realizadas na mesma data.

Resultado: totais diários, como 280.00 em 2018-07-15 e 7563.00 em 2018-07-16.

Exemplo 3 – Total recebido por mês

Objetivo: somar as vendas agrupadas por mês.

SELECT
  SUM(valor) AS TOTAL,
  MONTH(data) AS MES
FROM
  venda_produto
GROUP BY
  MES;


Dica: funções de data, como MONTH, podem ser usadas no GROUP BY.

Resultado:

Maio (5): 35.00

Junho (6): 35.00

Julho (7): 7963.00

Conclusão:
O GROUP BY é essencial para gerar relatórios e análises em SQL, permitindo combinar dados com funções de agregação e obter resultados organizados por categoria, data ou qualquer outro critério relevante.