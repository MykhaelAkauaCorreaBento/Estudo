Resumo – SQL DISTINCT

A cláusula DISTINCT é usada no SQL para remover registros duplicados em uma consulta, considerando todas as colunas informadas no SELECT. Se todos os valores dessas colunas forem iguais, o SQL trata o registro como duplicado e retorna apenas um.

Funcionamento
Exemplo (Tabela cliente)

Para evitar enviar e-mails duplicados a clientes que compartilham o mesmo endereço, usa-se:

SELECT DISTINCT email
FROM cliente;


Isso retorna apenas um registro por e-mail.

Sintaxe
SELECT [ DISTINCT ] [ coluna1, coluna2, ... | * ]
FROM tabela;

Exemplo 1 — DISTINCT em colunas específicas

Tabela com um nome e e-mail duplicados (Raquel Tavares):

SELECT DISTINCT nome, email
FROM cliente;


Como nome + email se repetem, um dos registros é removido.

Exemplo 2 — DISTINCT com *
SELECT DISTINCT *
FROM cliente;


O duplicado não é removido, pois a coluna ID é diferente — e o DISTINCT só elimina registros quando todas as colunas são idênticas.

Exemplo 3 — DISTINCT em outra tabela (carro)

Para listar apenas modelos distintos:

SELECT DISTINCT modelo
FROM carro;


Retorna um modelo por linha, mesmo que vários carros tenham o mesmo modelo.