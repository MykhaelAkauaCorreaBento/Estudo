Resumo – Desnormalização de Banco de Dados (com dicas e exemplos)

A desnormalização de banco de dados é o processo oposto à normalização. Enquanto a normalização busca eliminar redundâncias e garantir integridade dos dados, a desnormalização aceita a redundância proposital para ganhar desempenho, especialmente em consultas analíticas.

Contexto de uso

A desnormalização é muito utilizada em Sistemas de Apoio à Decisão (SAD), que fornecem informações estratégicas para a alta gerência tomar decisões importantes.

Um exemplo clássico de SAD são os sistemas de Business Intelligence (BI).

Esses sistemas normalmente consultam dados armazenados em um Data Warehouse, que é, na prática, um banco de dados desnormalizado, otimizado para leitura e análise.

OLTP x OLAP

Um ponto central do tema é a diferença entre dois tipos de sistemas:

🔹 OLTP (Online Transaction Processing)

Usado em sistemas operacionais do dia a dia

Muitas inserções, atualizações e exclusões

Exemplo: sistemas de vendas, cadastros, pedidos

Banco normalizado

Prioriza integridade e consistência dos dados

🔹 OLAP (Online Analytical Processing)

Usado para análise de dados e tomada de decisão

Muitas consultas complexas

Exemplo: relatórios gerenciais, dashboards, BI

Banco desnormalizado

Prioriza desempenho em consultas

👉 Resumo da ideia:
OLTP grava dados → OLAP analisa dados.

Por que desnormalizar?

Reduz a quantidade de JOINs

Acelera consultas complexas

Facilita análises e relatórios

Ideal para grandes volumes de dados históricos

⚠️ Em contrapartida:

Gera redundância

Aumenta o tamanho do banco

Não é ideal para sistemas transacionais

Esquemas mais usados na desnormalização
⭐ Esquema Estrela (Star Schema)

Uma tabela fato central (ex: vendas)

Várias tabelas dimensão ao redor (tempo, cliente, produto)

Estrutura simples

Consultas rápidas

Mais comum em Data Warehouses

Exemplo:
Fato_Vendas ligada diretamente às dimensões Cliente, Produto e Tempo.

❄️ Esquema Floco de Neve (Snowflake Schema)

Evolução do esquema estrela

Dimensões são normalizadas

Menos redundância que o esquema estrela

Estrutura mais complexa

Consultas podem ser um pouco mais lentas

Exemplo:
Dimensão Cliente dividida em Cliente → Cidade → Estado → País.

Dicas importantes

✔️ Use desnormalização em sistemas analíticos, não transacionais.

✔️ Ideal para BI e Data Warehouse.

⚠️ Evite em sistemas com muitas escritas.

⚖️ Sempre avalie o equilíbrio entre performance e manutenção.

Conclusão

A desnormalização é fundamental para sistemas de análise e apoio à decisão. Ela não substitui a normalização, mas a complementa, sendo aplicada principalmente em OLAP, BI e Data Warehouses, onde o foco é consulta rápida e análise eficiente, e não a atualização constante dos dados.