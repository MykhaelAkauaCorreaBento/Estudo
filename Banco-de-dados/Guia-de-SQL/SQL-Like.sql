Resumo – SQL: LIKE

O operador LIKE é usado para buscar padrões de texto em colunas do tipo texto. Ele funciona de forma parecida com expressões regulares simples e é muito usado em filtros, pesquisas e autocompletes.

Conceito principal

O LIKE trabalha com caracteres curingas, que permitem procurar partes de um texto sem precisar saber o valor completo.

Principais curingas

% → representa zero, um ou vários caracteres

_ → representa apenas um caractere

Sintaxe geral
SELECT colunas
FROM tabela
WHERE coluna LIKE 'padrao';

Na prática
Exemplo 1 – Texto que termina com um padrão

Buscar alunos cujo nome termine com “da Silva”:

SELECT nome
FROM aluno
WHERE nome LIKE '%da Silva';


➡️ Retorna nomes que terminam com “da Silva”.

Exemplo 2 – Texto que começa com um padrão

Buscar alunos cujo nome comece com “João”:

SELECT nome
FROM aluno
WHERE nome LIKE 'João%';


➡️ Retorna todos os nomes que iniciam com “João”.

Exemplo 3 – Texto que contém um trecho

Buscar e-mails que contenham “gmail” em qualquer posição:

SELECT email
FROM aluno
WHERE email LIKE '%gmail%';


➡️ Retorna e-mails que possuem “gmail” no meio, início ou fim do texto.

Exemplo 4 – Uso do caractere _ (um único caractere)

Buscar nomes que tenham dois caracteres antes de “ão”:

SELECT nome
FROM aluno
WHERE nome LIKE '__ão%';


➡️ Cada _ representa um caractere (ex: “João”).

Dicas importantes

✔ % é ideal para buscas amplas e parciais

✔ _ é útil quando você sabe a quantidade exata de caracteres

✔ É possível combinar % e _ na mesma consulta

✔ LIKE é muito usado em pesquisas por texto, como formulários e filtros

O LIKE é essencial quando você precisa encontrar padrões ou partes de textos dentro de colunas no banco de dados.