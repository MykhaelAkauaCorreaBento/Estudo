SQL: WHERE

A cláusula WHERE é usada para filtrar resultados, retornando apenas registros que atendam a determinadas condições. Pode envolver operadores de comparação, filtros com subqueries ou operadores lógicos como IN, NOT IN e EXISTS.

Estrutura básica:
SELECT [coluna1, coluna2, ... | *]
FROM [tabela]
WHERE [condição];

Exemplo prático
Cenário: Tabela cliente
id	nome	email	cidade	data_cadastro
1	Fernando Braga	contato@mundial.com.br
	Belo Horizonte	2017-11-05
2	Luana Soares	luanassa@yahoo.com.br
	São Paulo	2016-05-05
3	Pedro Botelho	contato@mundial.com.br
	São Paulo	2018-04-02
4	Marilia Gabriela	mari_21@yahoo.com.br
	São Paulo	2018-03-01
5	Bruno Henrique	brunohrq@gmail.com
	Rio de Janeiro	2016-05-05
6	Cintia Pereira	cintiazinha@ig.com.br
	Belo Horizonte	2014-11-12
7	Raquel Tavares	contato@mundial.com.br
	Belo Horizonte	2014-11-11
Exemplo 1: Filtrando por nome
SELECT *
FROM cliente
WHERE nome = 'Marilia Gabriela';


Resultado:

id	nome	email	cidade	data_cadastro
4	Marilia Gabriela	mari_21@yahoo.com.br
	São Paulo	2018-03-01
Exemplo 2: Filtrando por ano de cadastro
SELECT *
FROM cliente
WHERE YEAR(data_cadastro) = 2016;


Resultado:

id	nome	email	cidade	data_cadastro
2	Luana Soares	luanassa@yahoo.com.br
	São Paulo	2016-05-05
5	Bruno Henrique	brunohrq@gmail.com
	Rio de Janeiro	2016-05-05
Exemplo 3: Dupla condição com operadores lógicos
SELECT *
FROM cliente
WHERE email LIKE '%@yahoo.com.br' AND cidade = 'São Paulo';


Resultado:

id	nome	email	cidade	data_cadastro
2	Luana Soares	luanassa@yahoo.com.br
	São Paulo	2016-05-05
4	Marilia Gabriela	mari_21@yahoo.com.br
	São Paulo	2018-03-01
Operadores suportados pelo WHERE
Operador	Função
=	Igual
!= ou <>	Diferente
<	Menor
>	Maior
>=	Maior ou igual
<=	Menor ou igual
AND	Retorna resultados se ambas condições forem verdadeiras
OR	Retorna resultados se pelo menos uma condição for verdadeira
NOT	Inverte a condição, retornando resultados que não atendem à condição

Dica: WHERE é a base para a maioria dos filtros em consultas SQL, podendo ser usado com operadores simples ou avançados, incluindo subqueries, IN, NOT IN, EXISTS e LIKE para padrões de texto.