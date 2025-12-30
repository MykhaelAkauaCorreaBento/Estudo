Resumo – Desnormalização de Banco de Dados (Revista .Net Magazine 83)

O artigo apresenta, de forma prática e didática, como transformar um banco de dados transacional e normalizado em um modelo desnormalizado, otimizado para consultas, relatórios e sistemas de Business Intelligence (BI). O foco está em desempenho, não em integridade transacional.

Contexto e motivação

Os sistemas transacionais (OLTP) são projetados para operações do dia a dia (vendas, estoque, financeiro) e utilizam bancos normalizados, garantindo consistência e facilidade de manutenção.

Porém, quando as empresas precisam responder perguntas mais complexas, como:

“Quando devo renovar o estoque?”

“Quais produtos têm melhor retorno entre vendas e marketing?”

os relatórios tradicionais tornam-se lentos e difíceis de manter.
É nesse cenário que surgem os sistemas de Business Intelligence (OLAP), que trabalham com grandes volumes de dados, cálculos complexos e leitura intensiva.

👉 Para BI, a desnormalização é essencial.

OLTP x OLAP (ideia central)

OLTP

Banco normalizado

Muitas escritas (INSERT, UPDATE, DELETE)

Poucos registros por operação

Foco em integridade

OLAP

Banco desnormalizado

Muitas leituras e agregações

Milhões de registros

Foco em desempenho

Os dois modelos não competem, eles se complementam.

Revisão rápida das Formas Normais (base conceitual)

Antes de desnormalizar, o artigo revisa a normalização:

🔹 1FN – Primeira Forma Normal

Campos devem ser atômicos

Sem listas em uma coluna
Exemplo: datas de login devem virar outra tabela

🔹 2FN – Segunda Forma Normal

Elimina dependências parciais da chave primária
Exemplo: dados do produto não devem ficar repetidos na tabela de vendas

🔹 3FN – Terceira Forma Normal

Elimina dependências transitivas
Exemplo: idade não deve ser armazenada, pois depende da data de nascimento

✔️ A normalização evita redundância, mas não é ideal para análise de dados.

Dimensões e Medidas (conceitos-chave de BI)

Medidas: valores numéricos analisados
Ex: total de vendas, quantidade, faturamento

Dimensões: perspectivas de análise
Ex: tempo, cliente, produto, vendedor

Esses dados são analisados em visões multidimensionais, como:

Pivot Tables

Operações de:

Drill Down / Drill Up (mais ou menos detalhe)

Slice and Dice (mudar a visão dos dados)

Por que normalização não funciona bem em BI?

Em bancos transacionais:

Datas ficam em um único campo

Não existem colunas como Ano, Mês ou Trimestre

Totais precisam ser calculados em tempo real

Isso gera:

Muitas junções

Muito processamento

Consultas lentas

👉 A solução é extrair os dados do OLTP e carregá-los em um banco desnormalizado, preparado para análise.

Modelos desnormalizados para BI

O artigo apresenta dois esquemas principais:

⭐ Star Schema (Esquema em Estrela)

Uma Tabela Fato central

Várias Tabelas Dimensão ao redor

Sem relacionamento entre dimensões

Melhor desempenho

Mais usado

❄️ Snowflake Schema (Esquema Floco de Neve)

Dimensões podem se relacionar entre si

Menos redundância

Mais complexidade

Desempenho um pouco menor

👉 No artigo, o Star Schema é escolhido por oferecer melhor performance.

Tabela Fato e Tabelas Dimensão
🔹 Tabela Fato

Contém:

Chaves para todas as dimensões

Medidas (valores numéricos)

Define a granularidade dos dados

🔹 Tabelas Dimensão

Contêm dados descritivos

Ex: cliente, produto, tempo, vendedor

📌 Uma dimensão tempo é obrigatória em qualquer modelo BI.

Exemplo prático (AdventureWorks)

O artigo usa o banco AdventureWorks da Microsoft para mostrar, passo a passo:

Definição de métricas (ex: preço, desconto, total, atraso)

Definição de dimensões (produto, cliente, vendedor, pedido, tempo)

Criação do Star Schema

Criação das tabelas fato e dimensão

Migração dos dados do banco transacional

Durante esse processo:

Entidades são fundidas

Algumas tabelas são duplicadas (quando há múltiplas dependências)

Dados calculados passam a ser armazenados, não calculados em tempo real

ETL (Extract, Transform, Load)

Para alimentar o banco desnormalizado, é usado um processo de ETL, que:

Extrai dados do OLTP

Transforma (agrega, calcula, ajusta)

Carrega no banco BI

O artigo mostra exemplos com Stored Procedures, mas ressalta que existem ferramentas específicas como:

SQL Server Integration Services (SSIS)

Talend

BizTalk

Ferramentas de BI (Cognos, QlikView etc.)

Dicas importantes do artigo

✔️ Normalização é essencial no OLTP

✔️ Desnormalização é essencial no BI

✔️ Sempre defina métricas antes das dimensões

✔️ Granularidade define o nível de detalhe dos dados

⚠️ Não tente fazer BI direto no banco transacional

⚠️ Performance é prioridade, não integridade transacional

Conclusão

A desnormalização é um pilar fundamental da arquitetura de dados em Business Intelligence. Ignorar essa etapa geralmente leva ao fracasso do projeto.

Um banco desnormalizado:

Sacrifica regras clássicas de normalização

Ganha simplicidade estrutural

Oferece alto desempenho em análises complexas

Por fim, o artigo reforça que arquitetura de BI exige visão técnica e entendimento do negócio, indo muito além de apenas criar tabelas.