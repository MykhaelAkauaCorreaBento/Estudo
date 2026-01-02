O que é o MySQL

O MySQL é um Sistema de Gerenciamento de Banco de Dados (SGBD) que utiliza a linguagem SQL (Structured Query Language) para criar, consultar e manipular bancos de dados.

É amplamente utilizado no mercado, inclusive por grandes empresas como NASA, Google, HP, Sony, Bradesco, entre outras.

Principais vantagens do MySQL

Funciona em várias plataformas (portabilidade)

Compatível com diversas linguagens (Java, PHP, Python, C#, etc.)

Bom desempenho e estabilidade

Baixo consumo de hardware

Fácil de usar

Software livre (GPL)

Suporte a:

Transações

Triggers

Stored Procedures e Functions

Replicação

Diversos Storage Engines (InnoDB, MyISAM, etc.)

Possui interfaces gráficas para facilitar o uso

Trabalhando com MySQL via terminal (SQL puro)
1. Criando um banco de dados
CREATE DATABASE bancodeteste;


Cria um banco chamado bancodeteste.

2. Selecionando o banco de dados
USE bancodeteste;


Define qual banco será usado.

Criando tabelas
Exemplo de criação de tabela
CREATE TABLE fornecedores(
  codigo int(4) AUTO_INCREMENT,
  nome varchar(30) NOT NULL,
  email varchar(50),
  PRIMARY KEY (codigo)
);

Conceitos importantes

AUTO_INCREMENT: gera automaticamente valores numéricos

PRIMARY KEY: identifica unicamente cada registro

NOT NULL: campo obrigatório

Inserindo dados (INSERT)
INSERT INTO fornecedores(codigo, nome, email)
VALUES (null, "Ricardo", "ricoarrigoni@gmail.com");

INSERT INTO fornecedores(codigo, nome, email)
VALUES (null, "João", "joao@gmail.com");

INSERT INTO fornecedores(codigo, nome, email)
VALUES (null, "Maria", "maria@gmail.com");


📌 Dica: quando o campo é AUTO_INCREMENT, usa-se null.

Consultando dados (SELECT)
Buscar todos os dados
SELECT * FROM fornecedores;

Buscar apenas um campo específico
SELECT email FROM fornecedores;

Ordenando resultados (ORDER BY)
SELECT * FROM fornecedores ORDER BY nome ASC;


ASC: ordem crescente (alfabética)

DESC: ordem decrescente

Exemplo:

SELECT * FROM fornecedores ORDER BY nome DESC;

Atualizando dados (UPDATE)
UPDATE fornecedores
SET nome = "Ricardo Arrigoni"
WHERE codigo = 1;


🔎 WHERE define qual registro será alterado.
⚠️ Sem WHERE, todos os registros seriam modificados.

Excluindo dados (DELETE)
DELETE FROM fornecedores WHERE codigo = 3;


⚠️ Atenção:
O comando DELETE não é reversível. Use sempre com WHERE para evitar apagar todos os registros.

Conclusão

O MySQL é:

Simples de aprender

Leve

Gratuito

Muito usado tanto no meio acadêmico quanto no mercado profissional

Por isso, é uma excelente escolha para quem está começando a aprender bancos de dados e SQL.