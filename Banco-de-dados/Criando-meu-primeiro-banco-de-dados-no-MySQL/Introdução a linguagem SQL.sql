Resumo – SQL com exemplos de cada comando

SQL (Structured Query Language) é a linguagem padrão para trabalhar com bancos de dados relacionais.
Com ela criamos tabelas, modificamos estruturas, inserimos dados, atualizamos, consultamos, controlamos permissões e executamos transações.

SQL é uma linguagem declarativa: você informa o que quer, não como fazer.
Seus comandos são divididos em conjuntos conforme sua função.

1. DDL – Data Definition Language

Lida com a estrutura do banco: tabelas, colunas, esquemas, etc.
Principais comandos: CREATE, ALTER, DROP, TRUNCATE

✔ CREATE TABLE – cria uma tabela
CREATE TABLE Contato (
    Id int,
    Nome varchar(255),
    Telefone varchar(11)
);

✔ DROP TABLE – exclui uma tabela
DROP TABLE Contato;


Remove a tabela e todos os dados dentro dela.

✔ ALTER TABLE – altera a estrutura
ALTER TABLE Contato
ADD email VARCHAR(255);

✔ TRUNCATE TABLE – apaga todos os dados (estrutura permanece)
TRUNCATE TABLE Contato;

2. DML / DQL – Manipulação e Consulta de Dados
DML – Data Manipulation Language

Comandos que inserem, atualizam e excluem dados.

✔ INSERT – inserir registros
INSERT INTO Cliente(nome, telefone)
VALUES ('Suzana', '99999-9999');

✔ DELETE – excluir registros
DELETE FROM Cliente WHERE id = 2;  -- Exclui só o id = 2
DELETE FROM Cliente;               -- Exclui todos os registros

✔ UPDATE – atualizar registros
UPDATE Cliente SET telefone = '99999-9999' WHERE id = 3;
  -- Atualiza somente o cliente 3

UPDATE Cliente SET telefone = '99999-9999';
  -- Atualiza todos os registros

DQL – Data Query Language

Focado em consultas aos dados.

✔ SELECT – recuperar registros
SELECT nome, telefone FROM Cliente;

✔ SELECT com condição (WHERE)
SELECT nome, telefone
FROM Cliente
WHERE nome = 'Ramon';

✔ JOIN – juntar dados de várias tabelas
SELECT c.nome, c.telefone, p.codigo, p.data_pedido
FROM Cliente c
JOIN Pedido p
ON c.id = p.id_cliente
WHERE c.id = 5;


Combina registros conforme a coluna relacionada.

3. DTL – Data Transaction Language

Gerencia transações, garantindo consistência.

✔ BEGIN TRAN – inicia uma transação
BEGIN TRAN;

4. DCL – Data Control Language

Controla permissões e acessos.

✔ GRANT – conceder privilégios
GRANT CREATE TABLE TO usuario;

Dicas importantes

✔ Domine primeiro DDL + DML + SELECT, pois são 90% do uso real.
✔ Sempre use WHERE em DELETE ou UPDATE para não alterar tudo por engano.
✔ Use TRUNCATE e DROP com muito cuidado — são destrutivos.
✔ Treine muito SELECT com JOIN, WHERE, ORDER BY e LIMIT.
✔ Explore um banco real como MySQL ou PostgreSQL para ver diferenças práticas.