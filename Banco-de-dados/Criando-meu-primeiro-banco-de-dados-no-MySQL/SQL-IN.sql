Resumo – SQL: IN

O operador IN é usado na cláusula WHERE para verificar se o valor de uma coluna pertence a um conjunto de valores. Esses valores podem ser definidos manualmente ou retornados por uma subquery.

Conceito principal

IN substitui várias condições com OR

Facilita filtros quando há múltiplos valores possíveis

Pode ser usado junto com subqueries

NOT IN retorna o resultado oposto

Sintaxe geral
SELECT colunas
FROM tabela
WHERE coluna IN (valor1, valor2, ...);


Ou com subquery:

WHERE coluna IN (SELECT coluna FROM tabela);

Na prática
Exemplo 1 – Lista de valores definida manualmente

Buscar alunos que ainda estão cursando (status Aprovado ou Aguardando nota):

SELECT
  A.nome,
  T.nome AS Turma,
  S.status AS Status
FROM aluno A
INNER JOIN turma T ON T.id = A.id_turma
INNER JOIN status S ON S.id = A.id_status
WHERE A.id_status IN (1, 3);


➡️ Retorna apenas alunos cujo id_status seja 1 ou 3.

Exemplo 2 – IN com subquery

Buscar alunos que estão trancados:

SELECT
  A.nome
FROM aluno A
WHERE A.id IN (
  SELECT id_aluno
  FROM trancamento_aluno
);


➡️ O filtro considera apenas os IDs retornados pela subquery.

Exemplo 3 – Projetos com comentários
SELECT
  P.id,
  P.titulo
FROM projetos P
WHERE P.id IN (
  SELECT C.id_projeto
  FROM comentario C
);


➡️ Retorna projetos que possuem comentários.

Exemplo 4 – NOT IN (resultado inverso)

Buscar projetos sem comentários:

SELECT
  P.id,
  P.titulo
FROM projetos P
WHERE P.id NOT IN (
  SELECT C.id_projeto
  FROM comentario C
);


➡️ Retorna apenas projetos que não aparecem na tabela de comentários.

Dicas importantes

✔ IN deixa o código mais limpo que vários OR

✔ Pode ser usado com valores fixos ou subqueries

✔ NOT IN inverte o resultado

✔ Muito usado para filtros baseados em relacionamentos entre tabelas

O operador IN é ideal quando você precisa verificar se um valor faz parte de um conjunto específico de dados.
