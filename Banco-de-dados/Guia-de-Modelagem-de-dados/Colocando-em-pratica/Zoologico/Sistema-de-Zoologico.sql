Resumo – Modelagem de Dados na Prática (Sistema de Zoológico)

A modelagem de dados é uma etapa essencial no desenvolvimento de sistemas de informação, pois garante integridade, consistência e organização dos dados. Este artigo demonstra, de forma prática, como modelar um banco de dados para um sistema de zoológico, utilizando o Diagrama Entidade-Relacionamento (DER) e, ao final, gerar o script SQL para criação do banco em um SGBD.

Importância da Modelagem de Dados

Uma boa modelagem permite:

Identificar corretamente entidades, atributos e relacionamentos;

Evitar duplicidade de dados;

Garantir integridade referencial;

Facilitar a implementação e manutenção do banco.

O DER é o modelo mais utilizado, pois representa bem o mundo real por meio de:

Entidades (objetos do sistema),

Relacionamentos (vínculos entre entidades),

Cardinalidades (regras de quantidade).

Cenário do Sistema de Zoológico

O sistema deve gerenciar:

Animais (nome, espécie, cor, altura, classe);

Funcionários (dados pessoais, cargo e endereço);

Classes de animais (mamíferos, aves, répteis, com descrição);

Containers (jaula, viveiro, tanque, etc.);

Alas do zoológico;

Consultas veterinárias;

Limpeza dos containers.

Regras importantes:

Cada animal pertence a uma classe e um container;

Containers ficam em alas;

Funcionários possuem um cargo e um endereço;

Veterinários acompanham no máximo 15 animais;

Consultas e limpezas precisam registrar data e hora;

Históricos não devem ser perdidos, mesmo se animais ou funcionários saírem do sistema.

Identificação das Entidades

A partir do cenário, foram definidas as principais entidades:

Animal

Classe

Container

Ala

Funcionário

Cargo

Endereço

Cidade

HistóricoConsulta

Limpeza

Acompanha (entidade associativa)

Dica importante:
Alguns elementos que poderiam ser atributos (como Ala e Endereço) foram modelados como entidades, evitando perda de dados em exclusões.

Relacionamentos e Cardinalidades

O artigo detalha cuidadosamente as cardinalidades, por exemplo:

Um animal pertence a uma classe, mas uma classe possui vários animais;

Um container pode conter vários animais, mas um animal pertence a um único container;

Um veterinário pode acompanhar até 15 animais;

Um funcionário pode realizar várias limpezas;

Endereços pertencem a uma cidade, e uma cidade possui vários endereços.

Para preservar históricos:

Criou-se a entidade HistóricoConsulta, evitando perda de registros;

O relacionamento Acompanha indica quais animais o veterinário acompanha atualmente.

Modelo Conceitual (DER)

O Diagrama Entidade-Relacionamento:

Representa o sistema de forma independente do SGBD;

Serve como base para a criação das tabelas;

Garante fidelidade às regras do negócio.

Implementação em SQL
Criação do Banco
CREATE DATABASE Zoologico;

Criação das Tabelas

O artigo apresenta a criação detalhada de todas as tabelas, definindo:

Tipos de dados adequados (INT, VARCHAR, DATE, TIME, DECIMAL);

Atributos obrigatórios (NOT NULL);

Chaves primárias (PRIMARY KEY);

Chaves estrangeiras (FOREIGN KEY).

Dica prática:
As chaves estrangeiras são criadas após todas as tabelas existirem, usando ALTER TABLE, para evitar problemas de dependência.

Integridade Referencial

O uso correto de foreign keys garante:

Coerência entre os dados;

Relações válidas entre entidades;

Segurança na exclusão e atualização de registros.



1️⃣ Criação do Banco de Dados

Cria a base onde todas as tabelas serão armazenadas:

CREATE DATABASE Zoologico;

2️⃣ Tabelas Principais
🐾 Animal

Armazena os dados dos animais do zoológico.

CREATE TABLE Animal (
  codAnim INT NOT NULL,
  nome VARCHAR(30) NOT NULL,
  especie VARCHAR(30),
  cor VARCHAR(30),
  altura DECIMAL(4,2),
  classe INT NOT NULL,
  container INT,
  CONSTRAINT pkAnimal PRIMARY KEY (codAnim)
);


📌 Dicas:

codAnim identifica o animal de forma única

classe e container serão chaves estrangeiras

especie pode ser nula (animal desconhecido)

🦁 Classe

Define a classe do animal (mamífero, ave, réptil).

CREATE TABLE Classe (
  codClasse INT NOT NULL,
  nomeDaClasse VARCHAR(15),
  descricao VARCHAR(1000),
  CONSTRAINT pkClasse PRIMARY KEY (codClasse)
);

🏠 Container

Local onde o animal vive (jaula, viveiro, tanque).

CREATE TABLE Container (
  codCont INT NOT NULL,
  tipo VARCHAR(10) NOT NULL,
  ala INT,
  CONSTRAINT pkContainer PRIMARY KEY (codCont)
);

🏢 Ala

Organiza os containers por área do zoológico.

CREATE TABLE Ala (
  numeroAla INT NOT NULL,
  classe INT,
  CONSTRAINT pkAla PRIMARY KEY (numeroAla)
);

3️⃣ Funcionários e Estrutura Administrativa
👨‍⚕️ Funcionário

Armazena dados de veterinários, zeladores e administrativos.

CREATE TABLE Funcionario (
  matriculaFunc INT NOT NULL,
  nome VARCHAR(50) NOT NULL,
  CPF BIGINT NOT NULL,
  RG BIGINT,
  CRMV INT,
  cargo INT NOT NULL,
  endereco INT,
  CONSTRAINT pkFuncionario PRIMARY KEY (matriculaFunc)
);


📌 Observação importante:

CRMV só é usado para veterinários

CPF e RG usam BIGINT por serem números grandes

💼 Cargo

Define a função e o salário.

CREATE TABLE Cargo (
  codCargo INT NOT NULL,
  cargo VARCHAR(30) NOT NULL,
  salario DECIMAL(6,2),
  CONSTRAINT pkCargo PRIMARY KEY (codCargo)
);

4️⃣ Endereço e Cidade
CREATE TABLE Cidade (
  codCid INT NOT NULL,
  nome VARCHAR(20) NOT NULL,
  CONSTRAINT pkCidade PRIMARY KEY (codCid)
);

CREATE TABLE Endereco (
  codEndereco INT NOT NULL,
  rua VARCHAR(50) NOT NULL,
  numero SMALLINT,
  complemento VARCHAR(20),
  cidade INT NOT NULL,
  CEP INT NOT NULL,
  CONSTRAINT pkEndereco PRIMARY KEY (codEndereco)
);


📌 Boa prática:
Cidade é uma entidade separada para evitar perda de dados.

5️⃣ Consultas e Limpezas
🩺 Histórico de Consulta

Guarda consultas antigas (não pode ser perdido).

CREATE TABLE HistoricoConsulta (
  codConsult INT NOT NULL,
  dataConsult DATE NOT NULL,
  hora TIME NOT NULL,
  veterinario INT NOT NULL,
  animal INT NOT NULL,
  CONSTRAINT pkHistorico PRIMARY KEY (codConsult)
);

🧹 Limpeza

Agenda limpeza dos containers.

CREATE TABLE Limpeza (
  codLimp INT NOT NULL,
  dia DATE NOT NULL,
  hora TIME NOT NULL,
  container INT NOT NULL,
  funcionario INT NOT NULL,
  CONSTRAINT pkLimpeza PRIMARY KEY (codLimp)
);

6️⃣ Relacionamento Veterinário × Animal
🐕 Acompanha

Controla o limite de até 15 animais por veterinário.

CREATE TABLE Acompanha (
  codAnim INT NOT NULL,
  matriculaFunc INT NOT NULL,
  CONSTRAINT pkAcompanha PRIMARY KEY (codAnim, matriculaFunc)
);


📌 Chave primária composta = relação N:N

7️⃣ Chaves Estrangeiras (Integridade Referencial)

São criadas depois das tabelas, usando ALTER TABLE:

ALTER TABLE Animal
ADD CONSTRAINT fkAnimClasse
FOREIGN KEY (classe) REFERENCES Classe(codClasse);

ALTER TABLE Animal
ADD CONSTRAINT fkAnimContainer
FOREIGN KEY (container) REFERENCES Container(codCont);

ALTER TABLE Funcionario
ADD CONSTRAINT fkFuncCargo
FOREIGN KEY (cargo) REFERENCES Cargo(codCargo);

ALTER TABLE Funcionario
ADD CONSTRAINT fkFuncEndereco
FOREIGN KEY (endereco) REFERENCES Endereco(codEndereco);


📌 Dica de prova:
Sempre criar FK depois das PK para evitar erro de dependência.


Conclusão

O artigo mostra que uma modelagem bem feita, alinhada aos requisitos do mundo real, é fundamental para:

Criar sistemas confiáveis;

Manter históricos importantes;

Garantir integridade e desempenho do banco.

Apesar de limitações naturais ao tentar representar toda a complexidade do mundo real, cabe ao profissional equilibrar fidelidade, desempenho e integridade.