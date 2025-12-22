Resumo – SQL: SELECT como Campo (Subquery no SELECT)

O SELECT as Field é uma variação do SELECT que permite usar uma subconsulta como se fosse uma coluna da consulta principal. Isso torna os comandos SQL mais flexíveis, principalmente quando precisamos usar funções agregadoras (COUNT, AVG, SUM, etc.).

Visão geral

Essa técnica permite buscar dados calculados a partir de outras tabelas ou do próprio conjunto de dados e exibi-los como uma nova coluna no resultado.
Ela é especialmente útil quando a agregação precisa ser feita sobre um conjunto inteiro de registros, algo que nem sempre é possível apenas com JOIN, que trabalha registro a registro.

Exemplo 1 – Total de convidados por evento

Uma casa de festas quer saber quantos convidados participaram de cada evento.

A consulta principal busca nome e data do evento.

A subquery conta (COUNT) quantas entradas existem na tabela entrada_evento para cada evento.

O resultado da subquery vira uma nova coluna, chamada total.

👉 Dica: use AS para dar um nome claro à coluna criada pela subconsulta.

Resultado: cada evento aparece com o total de convidados, facilitando a análise de capacidade do espaço.

Sintaxe básica
SELECT
   coluna1,
   coluna2,
   (
      SELECT função_agregadora(coluna)
      FROM tabela
   ) AS nova_coluna
FROM tabela_principal;

Exemplo 2 – Parcelas pagas de cada venda

Temos:

vendas: dados da venda

vendas_parcelas: detalhamento das parcelas

A consulta:

Lista os dados da venda

Cria uma coluna chamada QTD_PARCELAS_PAGAS

A subquery conta apenas as parcelas com DATA_PAGAMENTO IS NOT NULL

👉 Dica: filtros dentro da subquery permitem criar colunas muito específicas, como “pagas” ou “em aberto”.

Exemplo 3 – Parcelas pagas e em aberto

Extensão do exemplo anterior:

Uma subquery conta parcelas pagas

Outra subquery conta parcelas em aberto (DATA_PAGAMENTO IS NULL)

Resultado: cada venda aparece com:

Total de parcelas pagas

Total de parcelas ainda abertas

👉 Dica prática: você pode usar mais de uma subquery no mesmo SELECT.

Exemplo 4 – Média global de preços

Neste caso:

A consulta lista todos os produtos

Uma subquery calcula a média geral de preços (AVG) da tabela produto

Essa média aparece repetida como uma nova coluna (MEDIA_GLOBAL) para cada produto

👉 Compreensão importante:
Quando a subquery não depende da linha atual, o mesmo valor é exibido para todos os registros.

Conclusão

O uso de subqueries no SELECT permite:

Criar colunas calculadas dinamicamente

Utilizar funções agregadoras com mais controle

Gerar relatórios mais completos sem depender apenas de JOIN

Essa técnica é ideal para relatórios, análises e comparações globais ou específicas dentro do SQL.