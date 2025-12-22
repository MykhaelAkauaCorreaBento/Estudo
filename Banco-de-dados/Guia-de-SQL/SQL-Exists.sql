Resumo – SQL: EXISTS

A cláusula EXISTS é usada para verificar se uma subquery retorna ao menos um registro.
Se existir resultado, a condição retorna TRUE e o registro da consulta principal é exibido.
Ela é muito utilizada para filtrar dados com base na existência de registros em outra tabela.

Conceito principal

EXISTS → retorna TRUE se a subquery tiver resultados

NOT EXISTS → retorna TRUE se a subquery não tiver resultados

O foco do EXISTS é verificar a existência, não os valores retornados

Sintaxe geral
SELECT colunas
FROM tabela_principal
WHERE EXISTS (
  SELECT colunas
  FROM outra_tabela
  WHERE condicao
);


💡 Dica:
O conteúdo retornado pela subquery não importa, apenas se existe ou não algum registro.

Na prática
Exemplo 1 – Produtos que tiveram alguma venda

Buscar todos os produtos que aparecem na tabela de vendas:

SELECT
  P.id,
  P.nome
FROM
  produto P
WHERE
  EXISTS (
    SELECT 1
    FROM venda_produto V
    WHERE V.id_produto = P.id
  );


➡️ O EXISTS retorna TRUE quando encontra ao menos uma venda para o produto.

Uso de alias

P → apelido da tabela produto

V → apelido da tabela venda_produto

Vantagem: deixa o código mais claro e evita ambiguidades entre colunas.

Exemplo 2 – Produtos que não tiveram vendas (NOT EXISTS)
SELECT
  P.id,
  P.nome
FROM
  produto P
WHERE
  NOT EXISTS (
    SELECT 1
    FROM venda_produto V
    WHERE V.id_produto = P.id
  );


➡️ Retorna apenas os produtos que não aparecem na tabela de vendas.

Exemplo 3 – Projetos que possuem comentários

Buscar projetos que tenham pelo menos um comentário cadastrado:

SELECT
  P.id,
  P.titulo
FROM
  projetos P
WHERE
  EXISTS (
    SELECT 1
    FROM comentario C
    WHERE C.id_projeto = P.id
  );


➡️ Apenas projetos com comentários são exibidos.

Boas práticas e dicas

✔ Use EXISTS quando quiser verificar a existência de registros relacionados

✔ Combine com alias para melhorar a legibilidade

✔ Prefira SELECT 1 na subquery (mais simples e comum)

✔ Use NOT EXISTS para buscar registros sem relacionamento

O EXISTS é ideal para consultas condicionais entre tabelas, trazendo resultados com base na existência ou ausência de dados relacionados.