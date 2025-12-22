
Resumo – SQL: Funções de Agregação

As funções de agregação em SQL são usadas para resumir informações, combinando vários valores de uma coluna em um único resultado (por exemplo: maior venda, média de preços, total de itens). São muito comuns em relatórios e análises de dados.

Sintaxe básica

Uma função de agregação recebe uma coluna como parâmetro:

nome_da_funcao(coluna)


Uso geral no SELECT:

SELECT
  função(ões) de agregação / coluna(s)
FROM
  tabela(s);


Os exemplos utilizam a tabela produtos.

Principais funções de agregação
MAX

Retorna o maior valor de um conjunto.

SELECT max(precovenda)
FROM produtos;


Resultado: 14.00
Dica: útil para identificar o maior preço ou valor máximo registrado.

MIN

Retorna o menor valor de um conjunto.

SELECT min(precovenda)
FROM produtos;


Resultado: 1.00
Dica: ideal para encontrar o menor preço ou valor mínimo.

SUM

Realiza a soma dos valores de uma coluna.

SELECT sum(precovenda)
FROM produtos
WHERE categoria = 1;


Resultado: 6.65
Dica: a função SUM ignora valores NULL por padrão.

AVG

Calcula a média aritmética dos valores.

SELECT avg(precovenda)
FROM produtos;


Resultado: aproximadamente 5.41
Dica: assim como SUM, a função AVG ignora valores NULL.

COUNT

Retorna o total de registros.

SELECT count(precovenda)
FROM produtos
WHERE categoria = 1;


Dica:

COUNT(coluna) ignora valores NULL

COUNT(*) contabiliza todas as linhas

GROUP BY

A cláusula GROUP BY divide os registros em grupos, aplicando a função de agregação uma vez para cada grupo.

Exemplo: maior preço de venda por categoria.

SELECT
  categoria,
  max(precovenda)
FROM
  produtos
GROUP BY categoria;


Dica: sem GROUP BY, a função retorna apenas uma linha; com ele, retorna uma linha por grupo.

HAVING

O HAVING é usado para filtrar resultados agregados, funcionando após o GROUP BY.

Exemplo: categorias cujo maior preço seja maior que 10.

SELECT
  categoria,
  max(precovenda)
FROM
  produtos
GROUP BY categoria
HAVING max(precovenda) > 10;


Dica:

WHERE filtra linhas

HAVING filtra resultados agregados

ALIAS

O AS cria um apelido para colunas, facilitando a leitura do resultado.

SELECT
  categoria,
  max(precovenda) AS maximo_preco_venda
FROM
  produtos
GROUP BY categoria
HAVING max(precovenda) > 10;

Exemplo prático

Listar categorias cuja média do preço de custo seja maior que 2.

SELECT
  categoria,
  avg(precocusto) AS media_preco_custo
FROM
  produtos
GROUP BY categoria
HAVING avg(precocusto) > 2;


Resultado: apenas a categoria 2 atende à condição.