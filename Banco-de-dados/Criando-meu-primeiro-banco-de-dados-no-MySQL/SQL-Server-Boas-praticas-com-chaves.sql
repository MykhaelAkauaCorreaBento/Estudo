Resumo – SQL Server: Boas práticas com chaves (Primary Key e Unique Key)

O artigo apresenta boas práticas para criação de Primary Keys (PK) e Unique Keys (UK) no SQL Server, mostrando como essas escolhas afetam desempenho, manutenção e evolução do banco de dados, sempre com exemplos práticos.

1. Índices no SQL Server (base para entender as chaves)

O SQL Server usa a estrutura B-tree, que permite buscas rápidas por meio de:

Nó raiz

Níveis intermediários

Nível folha (onde ficam os dados ou referências)

Tipos de índices

Clustered

Ordena fisicamente os dados da tabela

Só pode existir um por tabela

Nonclustered

Não altera a ordem física

Podem existir vários

📌 Exemplo conceitual
Se uma tabela tiver índice clustered no campo Codigo, os dados serão fisicamente ordenados por esse campo.

2. Boas práticas para índices Clustered (com exemplos)

Um índice clustered ideal deve ser:

🔹 Único

Se não for único, o SQL Server adiciona internamente um valor extra (4 bytes).

Exemplo ruim

CREATE CLUSTERED INDEX IX_Cliente_Cidade ON Cliente(Cidade)


➡ Cidade pode se repetir → índice não é único → custo extra.

Exemplo melhor

CREATE CLUSTERED INDEX IX_Cliente_ID ON Cliente(Cliente_ID)

🔹 Pequeno

A chave clustered é copiada para todos os índices nonclustered.

Exemplo ruim

PRIMARY KEY (CpfCnpj, Nome, Sobrenome)


Exemplo bom

PRIMARY KEY (Cliente_ID)

🔹 Estático

Campos que mudam causam fragmentação e alto custo.

Exemplo ruim

CPF como PK (pode mudar por correção cadastral)

Exemplo bom

ID gerado automaticamente (nunca muda)

🔹 Incremental

Evita fragmentação e melhora INSERTs.

Exemplo ideal

Cliente_ID INT IDENTITY(1,1)

3. Primary Key x Unique Key (com exemplo real)
Primary Key

Não aceita NULL

Apenas uma por tabela

Unique Key

Garante unicidade

Pode existir mais de uma por tabela

📌 Exemplo

CREATE TABLE Cliente (
    Cliente_ID INT IDENTITY(1,1) PRIMARY KEY,
    CpfCnpj VARCHAR(14) NOT NULL UNIQUE
)


➡ Cliente_ID identifica tecnicamente
➡ CpfCnpj identifica no negócio

4. Exemplo 1 – PK usando dados de negócio
Modelo sem ID (chave de negócio)
CREATE TABLE Cliente (
    CpfCnpj VARCHAR(14) NOT NULL,
    Nome VARCHAR(200),
    CONSTRAINT PK_Cliente PRIMARY KEY (CpfCnpj)
)


📌 Problemas

Alterar CPF exige atualização em todas as tabelas relacionadas

Foreign Keys ficam mais caras

Maior impacto em UPDATEs

5. Exemplo 2 – PK usando Surrogate Key (ID)
Modelo com ID (recomendado)
CREATE TABLE Cliente (
    Cliente_ID INT IDENTITY(1,1) PRIMARY KEY,
    CpfCnpj VARCHAR(14) NOT NULL,
    Nome VARCHAR(200),
    CONSTRAINT UQ_Cliente_CpfCnpj UNIQUE (CpfCnpj)
)


📌 Vantagens

PK pequena, estática e incremental

Chave de negócio protegida por Unique Key

Menor custo de manutenção

6. Exemplo prático – UPDATE em PK x UPDATE em UK
Atualizando chave de negócio como PK
UPDATE Cliente
SET CpfCnpj = '00000000149761'
WHERE CpfCnpj = '00000000049761'


➡ Atualiza índices
➡ Verifica tabelas relacionadas
➡ Maior custo de IO

Atualizando chave de negócio como UK
UPDATE Cliente
SET CpfCnpj = '00000000149761'
WHERE Cliente_ID = 100


➡ Impacto muito menor
➡ Mais eficiente

7. Exemplo – Chave composta x ID no desenvolvimento
Chave composta
PRIMARY KEY (CodPedido, CodItem)


📌 Em aplicações:

Precisa concatenar valores

Mais código

Mais erros

Com ID
ItemPedido_ID INT IDENTITY PRIMARY KEY


📌 Aplicações ficam mais simples:

Um único valor

JOINs mais fáceis

Menos lógica no código

8. Conclusão com base nos exemplos

✔ As duas abordagens funcionam
✔ Surrogate Keys seguem melhor as boas práticas de índices clustered
✔ Facilitam:

Manutenção

Performance

Evolução do sistema

Desenvolvimento de aplicações

⚠ Importante
Mesmo com boas chaves:

Consultas mal escritas

SELECT *

Falta de índices adequados

ainda causam problemas de desempenho.