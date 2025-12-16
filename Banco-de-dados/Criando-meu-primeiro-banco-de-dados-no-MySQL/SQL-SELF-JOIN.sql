SQL: SELF JOIN – Resumo
O que é SELF JOIN?

O SELF JOIN (ou auto-junção) é uma junção em que uma tabela se relaciona com ela mesma.
Na prática, ele funciona como um INNER JOIN, mas usando apelidos (aliases) diferentes para a mesma tabela.

👉 É muito usado para comparar registros da mesma entidade.

Sintaxe básica
SELECT colunas
FROM tabela A
INNER JOIN tabela B
ON A.coluna = B.coluna;


📌 Apesar de ser a mesma tabela, os aliases fazem o SQL tratar como duas tabelas diferentes.

Exemplo 1 – Alunos da mesma turma
Objetivo

Listar alunos que estão na mesma turma que outros alunos.

SELECT
  A1.nome,
  A2.nome
FROM aluno A1
INNER JOIN aluno A2
ON A1.id <> A2.id
WHERE A1.turma = A2.turma
ORDER BY A1.nome;

O que acontece?

A tabela aluno é usada duas vezes (A1 e A2)

O id <> evita comparar o aluno com ele mesmo

Só aparecem alunos que compartilham a mesma turma

📌 Alunos sem colegas na mesma turma não aparecem.

✅ Dica: Sempre filtre para evitar comparações do registro com ele mesmo.

Exemplo 2 – Funcionários com o mesmo salário
Objetivo

Encontrar funcionários que ganham o mesmo salário.

SELECT
  F1.nome,
  F2.nome,
  F1.salario
FROM funcionario F1
INNER JOIN funcionario F2
ON F1.id <> F2.id
WHERE F1.salario = F2.salario;

Resultado

Funcionários com salários iguais aparecem em pares

Registros únicos (salários exclusivos) são ignorados

✅ Dica: Esse tipo de consulta pode gerar linhas duplicadas invertidas (A–B e B–A).

Exemplo 3 – Funcionários e Supervisores
Objetivo

Listar funcionários e seus respectivos supervisores, armazenados na mesma tabela.

SELECT
  F1.nome AS SUPERVISOR,
  F2.nome AS FUNCIONARIO
FROM funcionario F1
INNER JOIN funcionario F2
ON F1.id = F2.id_supervisor
ORDER BY F1.id;

O que acontece?

F1 representa o supervisor

F2 representa o funcionário

Apenas funcionários com supervisor definido aparecem

✅ Dica: SELF JOIN é ideal para relacionamentos hierárquicos.

Principais características do SELF JOIN

✔ Usa a mesma tabela mais de uma vez
✔ Exige uso de aliases
✔ Funciona como INNER JOIN (ou LEFT JOIN, se necessário)
✔ Muito útil para comparações internas e hierarquias

Quando usar SELF JOIN?

Comparar registros da mesma tabela

Identificar dados semelhantes (salários, grupos, categorias)

Trabalhar com hierarquias (chefes, supervisores, pais/filhos)

Analisar relações internas

📌 Regra de ouro:

Sempre use aliases claros e condições bem definidas para evitar resultados duplicados ou incorretos.SQL: SELF JOIN – Resumo
O que é SELF JOIN?

O SELF JOIN (ou auto-junção) é uma junção em que uma tabela se relaciona com ela mesma.
Na prática, ele funciona como um INNER JOIN, mas usando apelidos (aliases) diferentes para a mesma tabela.

👉 É muito usado para comparar registros da mesma entidade.

Sintaxe básica
SELECT colunas
FROM tabela A
INNER JOIN tabela B
ON A.coluna = B.coluna;


📌 Apesar de ser a mesma tabela, os aliases fazem o SQL tratar como duas tabelas diferentes.

Exemplo 1 – Alunos da mesma turma
Objetivo

Listar alunos que estão na mesma turma que outros alunos.

SELECT
  A1.nome,
  A2.nome
FROM aluno A1
INNER JOIN aluno A2
ON A1.id <> A2.id
WHERE A1.turma = A2.turma
ORDER BY A1.nome;

O que acontece?

A tabela aluno é usada duas vezes (A1 e A2)

O id <> evita comparar o aluno com ele mesmo

Só aparecem alunos que compartilham a mesma turma

📌 Alunos sem colegas na mesma turma não aparecem.

✅ Dica: Sempre filtre para evitar comparações do registro com ele mesmo.

Exemplo 2 – Funcionários com o mesmo salário
Objetivo

Encontrar funcionários que ganham o mesmo salário.

SELECT
  F1.nome,
  F2.nome,
  F1.salario
FROM funcionario F1
INNER JOIN funcionario F2
ON F1.id <> F2.id
WHERE F1.salario = F2.salario;

Resultado

Funcionários com salários iguais aparecem em pares

Registros únicos (salários exclusivos) são ignorados

✅ Dica: Esse tipo de consulta pode gerar linhas duplicadas invertidas (A–B e B–A).

Exemplo 3 – Funcionários e Supervisores
Objetivo

Listar funcionários e seus respectivos supervisores, armazenados na mesma tabela.

SELECT
  F1.nome AS SUPERVISOR,
  F2.nome AS FUNCIONARIO
FROM funcionario F1
INNER JOIN funcionario F2
ON F1.id = F2.id_supervisor
ORDER BY F1.id;

O que acontece?

F1 representa o supervisor

F2 representa o funcionário

Apenas funcionários com supervisor definido aparecem

✅ Dica: SELF JOIN é ideal para relacionamentos hierárquicos.

Principais características do SELF JOIN

✔ Usa a mesma tabela mais de uma vez
✔ Exige uso de aliases
✔ Funciona como INNER JOIN (ou LEFT JOIN, se necessário)
✔ Muito útil para comparações internas e hierarquias

Quando usar SELF JOIN?

Comparar registros da mesma tabela

Identificar dados semelhantes (salários, grupos, categorias)

Trabalhar com hierarquias (chefes, supervisores, pais/filhos)

Analisar relações internas

📌 Regra de ouro:

Sempre use aliases claros e condições bem definidas para evitar resultados duplicados ou incorretos.