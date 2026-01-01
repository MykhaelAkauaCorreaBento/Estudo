🎯 Objetivo do artigo

Apresentar boas práticas para projetos de bancos de dados relacionais, cobrindo todo o ciclo:

Levantamento de requisitos

Modelagem

Implementação

Performance

Monitoramento e manutenção

O foco é criar projetos sustentáveis ao longo dos anos, evitando retrabalho, gargalos e migrações forçadas.

🧠 Importância da modelagem

A arquitetura de dados é mais complexa do que parece. Decisões erradas no início impactam:

Desempenho

Custos

Manutenção

Escalabilidade

➡️ Nenhuma tecnologia resolve uma modelagem mal feita.

🏗️ Arquitetura e modelagem de dados
👥 Integração entre times

Modelagem deve ser feita junto com desenvolvimento e negócio

Falta de comunicação é uma das maiores causas de falhas

É preciso entender:

O produto

Como será usado

Como evoluirá no futuro

Quais métricas e KPIs serão acompanhados

📂 Documentação e versionamento

Boas práticas:

Repositório central de documentos (modelos conceitual, lógico e físico)

Histórico de decisões e regras de negócio

Uso de controle de versão (Git/SVN) para scripts SQL

Padronização de deploy e manutenção

🏷️ Padronização de nomenclatura

Facilita:

Leitura

Manutenção

Migração

Trabalho em equipe

Exemplos de padrões:

num_clicks → campo numérico

des_store → descrição (varchar)

tablename_pk → chave primária

tableorigem_tabledestino_fk → chave estrangeira

Prefixos comuns:

id → identificador

cod → código

nam → nome

dat → data

flag / ind → booleanos

⚠️ Atenção a limites de SGBD (ex: Oracle → 30 caracteres por objeto).

📐 Normalização e integridade

Bancos relacionais devem ser normalizados

Reduz redundância, custo de disco e IO

Facilita joins e manutenção

Também é essencial:

Evitar dados inválidos

Impor regras com NOT NULL, UNIQUE, FK

Evitar duplicidades (ex: e-mails, pessoas)

📊 Volumetria e crescimento

Todo projeto começa pequeno, mas pode crescer muito.

Perguntas essenciais:

Qual o tamanho esperado do banco?

Tipo de dados?

Crescimento anual?

Precisará de replicação?

Alta disponibilidade?

Solução free ou paga?

📌 Exemplo (PostgreSQL – tamanho do banco)
SELECT pg_size_pretty(pg_database_size('banco_teste'));

📌 Tamanho de tabelas
SELECT
  schemaname,
  tablename,
  pg_size_pretty(pg_relation_size(schemaname||'.'||tablename)) AS tamanho,
  pg_size_pretty(pg_total_relation_size(schemaname||'.'||tablename)) AS total
FROM pg_tables
WHERE schemaname = 'schema_teste';

🔄 Portabilidade e escolha do SGBD

Prefira SQL padrão, evitando recursos proprietários

Facilita migrações futuras

MySQL

Prefira InnoDB (transações + FK)

Evite MyISAM (lock em tabela)

CREATE TABLE my_table (
  id INT AUTO_INCREMENT PRIMARY KEY
) ENGINE=InnoDB;

🧱 Tipos de dados (muito importante)

Boas práticas:

Prefira tipos numéricos e de tamanho fixo

Use tinyint, smallint quando possível

Avalie char vs varchar

Evite text, blob, clob (use com moderação)

⚠️ PK e FK devem ser do mesmo tipo

📌 Índices
Regras gerais:

Sempre criar índice em foreign keys

Monitorar uso de índices

Índices mal planejados também prejudicam

Índices ajudam a:

WHERE

JOIN

ORDER BY

GROUP BY

MIN / MAX

⚠️ Se a query retorna mais de ~20% da tabela, o banco pode optar por FULL TABLE SCAN.

🔌 Conexões

Problema comum: excesso de conexões idle/sleep

Solução:

Usar connection pool

Limitar conexões ativas

Reutilizar conexões

Exemplo (Java – pool):
initialSize=5
minIdle=5
maxActive=30
maxIdle=7

🧾 Queries – boas práticas

Evitar:

LIKE

ORDER BY desnecessário

CAST / CONVERT

Funções no WHERE

JOIN entre tipos diferentes

❌ Query ineficiente:
SELECT COUNT(*)
FROM produto p
WHERE lista_preco < 1.25 * (
  SELECT AVG(custo_unitario)
  FROM custo c
  WHERE c.id_produto = p.id_produto
);


Problema: subquery executada linha a linha.

📈 Plano de execução

Mostra:

Ordem de acesso às tabelas

Uso de índices

Tipo de JOIN

Custo da query

Ferramentas:

EXPLAIN (MySQL/Postgres)

EXPLAIN PLAN (Oracle)

➡️ Fundamental antes e depois de ir para produção.

🚀 Cargas e manutenção

Grandes cargas → usar ferramentas nativas

MySQL: LOAD DATA INFILE

Oracle: SQL*Loader

Desabilitar índices durante carga

Para limpar tabela inteira → TRUNCATE TABLE

📋 Regras gerais de filtros

Prefira = e AND

Evite LIKE e <>

Evite funções no WHERE

Quanto mais seletiva a condição, melhor a performance.

🩺 Monitoramento do ambiente

Sem monitoramento não existe sustentabilidade.

MySQL – Slow Queries
long_query_time=5
log-slow-queries=/tmp/mysql-slow.log

Oracle – Top queries lentas

Consulta na V$SQL para identificar as mais custosas.

O que monitorar:

Transações

Latência

Conexões

FULL SCAN

Deadlocks

Cache de queries

Uso de índices

Ferramentas:

MySQLslap

Sysbench

Innotop

Oracle Enterprise Manager

✅ Conclusão

Projetos de banco nunca estão finalizados

Evoluem com o negócio

Modelagem + boas práticas + monitoramento garantem:

Performance

Qualidade

Escalabilidade

Menos retrabalho

📌 Banco de dados bem modelado cresce com segurança.