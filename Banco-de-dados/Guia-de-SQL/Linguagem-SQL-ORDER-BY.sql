Resumo – Linguagem SQL: ORDER BY

O artigo explica o uso da cláusula ORDER BY no comando SELECT, que serve para ordenar os resultados de uma consulta. Sem essa cláusula, os dados podem aparecer misturados, dificultando a análise. Ao usar ORDER BY, a ordenação é feita diretamente pelo banco de dados, economizando trabalho manual.

Por que usar ORDER BY

Em tabelas com muitos registros, como uma tabela VENDAS_DIARIAS, visualizar dados sem ordem pode ser confuso. Por exemplo, para saber quais produtos venderam mais, é necessário ordenar os resultados por quantidade ou valor.

Sintaxe básica
SELECT [colunas]
FROM [tabela]
WHERE [condição]
ORDER BY [coluna(s)] ASC | DESC;


ORDER BY vem após SELECT, FROM e WHERE (se existir).

ASC: ordem crescente (padrão, do menor para o maior).

DESC: ordem decrescente (do maior para o menor).

Ordenando por uma coluna

Exemplo: ordenar vendas pelo valor_unitario em ordem crescente (ASC é padrão):

SELECT id, data_venda, produto, categoria, valor_unitario, quantidade, valor_total
FROM vendas_diarias
ORDER BY valor_unitario;

Ordem decrescente

Para ordenar pelo valor_total do maior para o menor:

SELECT id, data_venda, produto, categoria, valor_unitario, quantidade, valor_total
FROM vendas_diarias
ORDER BY valor_total DESC;

Ordenando por várias colunas

É possível combinar colunas na ordenação. Exemplo:

valor_unitario em ordem decrescente

produto em ordem crescente (padrão):

SELECT id, data_venda, produto, categoria, valor_unitario, quantidade, valor_total
FROM vendas_diarias
ORDER BY valor_unitario DESC, produto;

Conclusão

Com o ORDER BY, é possível organizar os resultados de uma consulta por uma ou mais colunas, em ordem crescente ou decrescente, tornando os dados mais claros, úteis e fáceis de analisar.