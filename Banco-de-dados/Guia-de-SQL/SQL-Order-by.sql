✅ Resumo Unificado: SQL — ORDER BY, ASC, DESC, TOP e TOP WITH TIES

A cláusula ORDER BY organiza o resultado de uma consulta usando uma ou mais colunas, de forma crescente (ASC) ou decrescente (DESC).
Quando a ordem não é especificada, o padrão é ASC.

Além de organizar resultados, ORDER BY é fundamental para operações como encontrar maiores/menores valores, quando usado com TOP.

📂 1. Exemplo básico — Ordenação por uma coluna

Usando a tabela aluno:

id	nome	email
1	João Fernando	joao@gmail.com

2	Maria Carvalho	maria@gmail.com

3	Bruna dos Santos	bruna@gmail.com

4	Pedro da Silva	pedro@gmail.com

5	Tiago	tiago@gmail.com
Ordenar pelo nome
SELECT *
FROM aluno
ORDER BY nome;


Resultado:

id	nome	email
3	Bruna dos Santos	bruna@gmail.com

1	João Fernando	joao@gmail.com

2	Maria Carvalho	maria@gmail.com

4	Pedro da Silva	pedro@gmail.com

5	Tiago	tiago@gmail.com
📘 Sintaxe geral
SELECT [coluna1, coluna2, ... | *]
FROM tabela
ORDER BY coluna1, coluna2 [ASC | DESC];

📂 2. Exemplos práticos com ASC e DESC
🔹 Exemplo 1 — Ordenar por id (ASC)
SELECT *
FROM aluno
ORDER BY id ASC;


Resultado (1 → 5).

🔹 Exemplo 2 — Ordenar por id (DESC)
SELECT *
FROM aluno
ORDER BY id DESC;


Resultado (5 → 1).

🔹 Exemplo 3 — Ordenar por várias colunas

Tabela pessoa:

nome	data_nascimento
Bruno Henrique	2000-01-01
Pedro Pereira	2001-10-01
Fernando Luiz	1999-02-03
Luana Pereira	2005-01-30
Bruno Henrique	1970-07-09
Alan Dias	1963-04-01
Michele Braga	1999-11-01
Ordenar por nome e depois por data_nascimento:
SELECT nome, data_nascimento
FROM pessoa
ORDER BY nome, data_nascimento;


Resultado segue ordem por nome e desempata por data.

📂 3. ORDER BY com a tabela Produtos (outros exemplos importantes)
🔹 Ordenar por uma coluna
SELECT NOMEPRODUTO, VALORPRODUTO
FROM Produtos
ORDER BY NOMEPRODUTO;

🔹 Ordenar por mais de uma coluna
SELECT NOMEPRODUTO, VALORPRODUTO
FROM Produtos
ORDER BY VALORPRODUTO, NOMEPRODUTO;

🔹 ASC e DESC combinados
SELECT NOMEPRODUTO, VALORPRODUTO
FROM Produtos
ORDER BY VALORPRODUTO DESC, NOMEPRODUTO ASC;

📌 4. Cláusula TOP

TOP limita o número de linhas retornadas.

5 primeiros produtos
SELECT TOP 5 *
FROM Produtos;

Atenção:

Em Partitioned Views, TOP não funciona com UPDATE/INSERT.

Em INSERT/DELETE/UPDATE, TOP retorna linhas aleatórias (não há ORDER BY).

📌 5. TOP + ORDER BY (muito usado)
3 produtos mais baratos
SELECT TOP 3 *
FROM Produtos
ORDER BY VALORPRODUTO ASC;

2 produtos mais caros
SELECT TOP 2 *
FROM Produtos
ORDER BY VALORPRODUTO DESC;

📌 6. TOP WITH TIES

Retorna também empates com o último valor selecionado pelo TOP.

⚠ Funciona somente com:

SELECT

ORDER BY

🔹 Exemplo: menor quantidade (incluindo empates)

Suponha esta consulta:

SELECT *
FROM Produtos
ORDER BY QTDEPRODUTO ASC;

Agora usando TOP WITH TIES:
SELECT TOP 1 WITH TIES *
FROM Produtos
ORDER BY QTDEPRODUTO ASC;


Retorna o produto com menor quantidade + todos que têm a mesma quantidade.

🔹 Exemplo: 2 maiores quantidades + empates
SELECT TOP 2 WITH TIES *
FROM Produtos
ORDER BY QTDEPRODUTO DESC;


Retorna os 2 produtos com maior quantidade e todos que empataram com o 2º.

✔️ Resumo Final

ORDER BY organiza resultados (ASC padrão).

Aceita uma ou várias colunas.

ASC → crescente | DESC → decrescente.

TOP limita quantidades.

TOP + ORDER BY é obrigatório para obter maiores/menores.

TOP WITH TIES inclui empates, completando o conjunto.

Todos os exemplos foram mantidos e integrados.