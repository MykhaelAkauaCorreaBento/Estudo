SQL: RIGHT JOIN – Resumo
O que é o RIGHT JOIN?

O RIGHT JOIN (ou RIGHT OUTER JOIN) retorna todos os registros da tabela da direita e apenas os registros correspondentes da tabela da esquerda.
Quando não existe correspondência, os campos da tabela da esquerda retornam NULL.

👉 É o oposto do LEFT JOIN.

Sintaxe básica
SELECT colunas
FROM tabela_esquerda A
RIGHT JOIN tabela_direita B
ON A.coluna = B.coluna;


📌 A tabela que vem depois do RIGHT JOIN é a prioritária.

Exemplo 1 – Turmas e Professores
Objetivo

Listar todas as turmas, mesmo aquelas sem professor.

SELECT
    turma.nome AS Turma,
    professor.nome AS Professor
FROM professor
RIGHT JOIN turma
ON turma.id = professor.idturma;

Resultado (resumo)

Turmas com professor → nome do professor

Turmas sem professor → NULL

Exemplo:

Turma D | NULL
Turma E | NULL


✅ Dica: RIGHT JOIN é útil quando a tabela mais importante está à direita da consulta.

Exemplo 2 – Alunos, Turmas e Professores
Objetivo

Exibir dados de alunos, turmas e professores, incluindo professores sem turma.

SELECT
    aluno.nome AS Aluno,
    turma.nome AS Turma,
    professor.nome AS Professor
FROM aluno
INNER JOIN turma
ON turma.id = aluno.idturma
RIGHT JOIN professor
ON turma.id = professor.idturma;

O que acontece?

Professores sem turma aparecem com Aluno e Turma = NULL

Todos os professores são listados

Relações existentes são preservadas

✅ Dica: RIGHT JOIN pode ser combinado com outros JOINs sem problemas.

Principais características do RIGHT JOIN

✔ Retorna todos os registros da tabela da direita
✔ Registros sem relação retornam NULL à esquerda
✔ Funciona como um LEFT JOIN invertido
✔ Pode ser encadeado com vários JOINs

Quando usar RIGHT JOIN?

Quando a tabela principal está à direita da consulta

Para listar registros obrigatórios da tabela direita

Para identificar registros sem relacionamento à esquerda

📌 Boa prática:

Sempre que possível, prefira LEFT JOIN, pois costuma ser mais legível.
RIGHT JOIN é útil quando inverter a ordem das tabelas não é viável.