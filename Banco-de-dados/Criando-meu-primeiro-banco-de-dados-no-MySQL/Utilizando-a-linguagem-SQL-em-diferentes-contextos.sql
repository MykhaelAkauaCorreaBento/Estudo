Utilizando a linguagem SQL em diferentes contextosResumo – Utilizando a linguagem SQL em diferentes contextos

O artigo mostra que, embora a SQL seja a linguagem mais usada para manipulação de dados, seus conceitos e sintaxe foram adaptados para diversos contextos além do banco relacional tradicional. O objetivo é apresentar uma visão geral de como o conhecimento em SQL pode ser reaproveitado, destacando vantagens, limitações e exemplos em diferentes tecnologias.

1. SQL como base para manipulação de dados

A SQL é uma linguagem declarativa (DSL): o desenvolvedor diz o que quer, não como fazer.
Isso explica sua popularidade desde os anos 1980, sua padronização pelo ANSI e o surgimento de dialetos, como:

T-SQL (SQL Server)

PL/SQL (Oracle)

Mesmo com novas tecnologias, a SQL continua dominante no mercado e no meio acadêmico, sendo ensinada em praticamente todos os cursos de banco de dados.

📌 Dica importante:
SQL é uma ferramenta poderosa, mas não é bala de prata — nem sempre é a melhor solução para todo tipo de dado ou cenário.

2. Dados temporais – TSQL2

A SQL tradicional trabalha bem com datas, mas tem limitações para operações avançadas com intervalos temporais.

Solução: TSQL2

Proposta para lidar com:

Histórico de dados

Validade temporal

Intervalos de datas

Exemplo de recurso

Operador OVERLAPS: identifica intervalos de datas que se sobrepõem

📌 Ideias do TSQL2 foram incorporadas em:

Oracle (Flashback)

SQL Server (Temporal Tables)

Teradata

3. MDX – consultas multidimensionais (OLAP)

A MDX (Multidimensional Expressions) é usada em ambientes analíticos (OLAP), como cubos de dados.

Características:

Voltada para Business Intelligence

Trabalha com dimensões e medidas

Normalmente gerada por ferramentas gráficas (não manualmente)

Exemplo simples

SELECT
  [Measures].[Store Sales] ON COLUMNS,
  [Date].Members ON ROWS
FROM Sales
WHERE ([Store].[USA].[CA])


📌 Diferença principal:

SQL → tabelas e linhas

MDX → cubos, dimensões e medidas

4. SPARQL – consultas semânticas

A SPARQL é baseada em SQL e usada para consultar dados no formato RDF, organizados como:

Sujeito – Predicado – Objeto

É comum em:

Web semântica

Documentos relacionados (ex.: Wikipédia)

Exemplo

SELECT ?name ?email
WHERE {
  ?person a foaf:Person.
  ?person foaf:name ?name.
  ?person foaf:mbox ?email.
}


📌 Dica:
SPARQL exige entendimento da ontologia (modelo semântico), não apenas da estrutura dos dados.

5. SQL em ORMs – HQL e JPQL

Em ORMs, os dados estão em objetos, não diretamente em tabelas.

Linguagens inspiradas em SQL:

HQL (Hibernate)

JPQL (Java Persistence API)

Exemplo de JPQL

SELECT a FROM Author a
WHERE a.lastName IS NULL OR LOWER(a.lastName) = LOWER(:lastName)


📌 Tendência moderna:

Uso de map/reduce, Streams (Java) e LINQ (C#) em vez de SQL puro.

Exemplo com Java Streams

myList.stream()
  .filter(s -> s.startsWith("c"))
  .map(String::toUpperCase)
  .sorted()
  .forEach(System.out::println);

6. SQL e NoSQL

NoSQL não é “anti-SQL”, mas uma abordagem diferente para:

Escalabilidade

Distribuição

Flexibilidade de esquema

Cassandra – CQL

A CQL é muito parecida com SQL, mas:

Não possui JOINs

Exige um modelo de dados diferente

Exemplo

SELECT * FROM timeline
WHERE day = '12 Jan 2014'
AND (hour, min) >= (3, 50)
AND (hour, min, sec) <= (4, 37, 30);


📌 Dica crucial:
Não tente replicar o modelo relacional em Cassandra.

MongoDB

Não usa SQL

Utiliza comandos em JavaScript

Consultas agregadas são muito mais verbosas que SQL

📌 Comparação mostrou que uma simples consulta SQL pode virar um script extenso no MongoDB.

Grafos – SQL-Gremlin

Em bancos de grafos (Neo4J, Titan):

Usa-se normalmente Gremlin

O projeto SQL-Gremlin permite usar SELECT

Exemplo

SELECT p1.name, p2.name, p3.name
FROM person p1
JOIN person p2 ...


📌 Útil para consultas como “amigos dos amigos”.

7. Ciência de dados e SQL

Na ciência de dados, SQL aparece principalmente na pré-processamento dos dados.

Exemplos:

sqldf (R): usa SQL sobre data frames

SQL Server + R Services: executa scripts R dentro do banco

Exemplo

EXEC sp_execute_external_script
  @language = N'R',
  @script = N'SQLOut <- SQLIn;',
  @input_data_1 = N'SELECT 12 AS Col;';

8. Big Data – Hive e Spark SQL
Hive

Traduz SQL em jobs Map/Reduce

Suporta SELECT, GROUP BY, HAVING, CTEs, views

Spark SQL

Processamento em memória

Alto desempenho e uso em tempo real

Exemplo com Spark SQL

SELECT name FROM people WHERE age BETWEEN 13 AND 19;


📌 O mesmo resultado pode ser obtido com APIs funcionais (Scala, Python).

Conclusão

A SQL continua sendo a principal linguagem para manipulação de dados

Seus conceitos são reaproveitados em:

Bancos temporais

OLAP

Web semântica

ORMs

NoSQL

Big Data

Ciência de dados

✔ O conhecimento em SQL não fica obsoleto
✔ Ele se adapta a diferentes contextos
✔ Saber quando e como usar cada variação é o diferencial do profissional