Resumo – SQL: SELECT FROM SELECT (Subquery no FROM)

O SELECT FROM SELECT é uma variação do SQL que permite usar o resultado de uma consulta como se fosse uma tabela para outra consulta. Essa abordagem é muito útil quando precisamos filtrar, agrupar ou aplicar funções agregadoras sobre dados já calculados anteriormente.

Visão geral

Esse tipo de subquery é indicado quando:

Precisamos consultar valores derivados (ex.: totais, médias, contagens).

Queremos aplicar novos filtros (WHERE) sobre resultados que não existem diretamente nas tabelas originais.

O problema pode ser resolvido em etapas lógicas, tornando a consulta mais clara.

👉 Dica: pense como se a primeira consulta gerasse uma tabela temporária.

Exemplo 1 – Quantidade de comissões a pagar em julho

Objetivo: descobrir quantas vendas terão comissão paga, considerando que:

Apenas vendas com primeira parcela paga entram na comissão.

O pagamento da parcela deve ter ocorrido em julho.

Estratégia:

Subquery (SELECT interno): seleciona vendas cuja primeira parcela está paga em julho.

Consulta externa: faz um COUNT sobre o resultado da subquery.

👉 Compreensão importante:
Primeiro montamos o conjunto de dados correto, depois consultamos esse resultado.

Resultado: total de 2 comissões a serem pagas em julho.

Sintaxe básica
SELECT colunas
FROM (
   SELECT colunas
   FROM tabelas
) AS alias;


📌 Dica obrigatória: toda subquery usada no FROM precisa de um alias.

Exemplo 2 – Vendas com parcelas pagas

Partindo de uma consulta que já retorna:

Dados da venda

Quantidade de parcelas pagas e em aberto

A consulta externa:

Usa o resultado como fonte (FROM (SELECT ...))

Aplica um WHERE para exibir apenas vendas com pelo menos uma parcela paga

👉 Dica prática:
Esse padrão é ideal quando você precisa filtrar por colunas calculadas, que não podem ser usadas diretamente no WHERE da mesma consulta.

Exemplo 3 – Produtos com preço acima da média

Objetivo:

Calcular a média global de preços dos produtos.

Listar apenas os produtos com valor acima dessa média.

Estratégia:

Subquery calcula a média (AVG) e adiciona como coluna.

Consulta externa compara valor > MEDIA_GLOBAL.

👉 Compreensão-chave:
O SELECT interno prepara os dados; o SELECT externo decide quais ficam no resultado final.

Exemplo 4 – Projetos com muitos comentários

Cenário:

Primeiro SELECT calcula a quantidade de comentários por projeto.

Segundo SELECT usa esse resultado como tabela e filtra projetos com mais de 2 comentários.

👉 Dica:
Esse padrão é muito comum em relatórios, rankings e análises estatísticas.

Conclusão

O SELECT FROM SELECT permite:

Trabalhar com dados já processados

Criar consultas mais organizadas e legíveis

Aplicar filtros e agregações em múltiplas etapas

📌 Resumo final:
Sempre que precisar consultar resultados de outra consulta, use subqueries no FROM e lembre-se de nomear a tabela resultante com AS.