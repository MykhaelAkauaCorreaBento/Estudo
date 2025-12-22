Resumo – SQL: Comando SELECT (com exemplos)

O SELECT é o comando mais importante da linguagem SQL, usado para recuperar registros de tabelas em um banco de dados. O resultado aparece em formato tabular: colunas no topo e linhas abaixo.

1. Sintaxe básica do SELECT

Seleciona colunas específicas:

SELECT id, nome, email
FROM funcionario;


Seleciona todas as colunas da tabela:

SELECT *
FROM funcionario;


Dica: Evite usar * quando não precisar de todas as colunas — isso melhora a performance.

2. Cláusula WHERE – filtrando registros

A cláusula WHERE restringe o retorno apenas aos registros que atendem a uma condição:

SELECT id, nome, email
FROM funcionario
WHERE nome = 'Caio';

Textos x Números no WHERE

Números não usam aspas, textos usam:

-- Número
SELECT id, nome, email
FROM funcionario
WHERE id = 5;

-- Texto
SELECT id, nome, email
FROM funcionario
WHERE nome = 'Eduardo';

3. Operadores da cláusula WHERE

Todos usados para comparar valores:

=   (igual)
>   (maior que)
<   (menor que)
>=  (maior ou igual)
<=  (menor ou igual)
<>  (diferente de)


Exemplos:

SELECT nome
FROM alunos
WHERE media = 6;

SELECT nome
FROM alunos
WHERE media > 6;

SELECT nome
FROM alunos
WHERE media < 6;

SELECT nome
FROM alunos
WHERE media >= 6;

SELECT nome
FROM alunos
WHERE media <= 6;

SELECT nome
FROM alunos
WHERE media <> 6;

4. LIKE – busca textual

O LIKE permite pesquisar textos por padrão.
O caractere % é um coringa: significa “qualquer sequência”.

Sintaxe:

SELECT colunas
FROM tabela
WHERE campo LIKE 'valor';

Exemplos de uso:

texto → busca correspondência exata

%texto% → contém

%texto → termina com

texto% → começa com

SELECT nome, idade
FROM pessoa
WHERE nome LIKE 'J%';

Underscore (_) – coringa para apenas 1 caractere

Exemplos:

_este → pega “teste”, “peste”, “veste”

b_m → pega “bom”, “bem”, “b1m”

_u% → pega “Luis”, “Gustavo”

SELECT nome, idade
FROM pessoa
WHERE nome LIKE '_u%';

5. Operador IN – lista de valores

Verifica se o valor está dentro de um conjunto:

SELECT nome, idade
FROM pessoa
WHERE id_pessoa IN (2, 3, 7);

6. Operadores lógicos: AND, OR e NOT
AND – todas as condições devem ser verdadeiras
SELECT nome
FROM funcionarios
WHERE salario > 2000 AND setor = 2;

OR – apenas uma condição precisa ser verdadeira
SELECT nome
FROM funcionarios
WHERE salario > 2000 OR setor = 2;

NOT – nega a condição
SELECT nome
FROM funcionarios
WHERE NOT nome = 'Wesley';

Conclusão

O comando SELECT é essencial para trabalhar com qualquer banco de dados:
✔ faz consultas simples ou complexas
✔ permite filtrar, combinar e localizar informações
✔ é a base para relatórios e sistemas que dependem de dados armazenados

Entender SELECT, WHERE, operadores, LIKE, IN e AND/OR/NOT é fundamental para a prática diária de SQL e para construir consultas eficientes.