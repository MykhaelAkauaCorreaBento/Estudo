🎯 Objetivo do artigo

O artigo aprorofunda o uso da instrução SELECT com JOIN, ensinando como combinar dados de duas ou mais tabelas em uma única consulta SQL, com foco em:

Clareza na escrita

Correção lógica

Boa performance

Melhores práticas usadas no dia a dia do desenvolvedor

Ao final, você estará preparado para resolver cerca de 90% dos cenários reais envolvendo consultas SQL.

🧱 Modelo de dados (base dos exemplos)

O artigo utiliza um modelo simples de uma empresa fictícia, com as tabelas:

Fornecedores (cod_fornecedor, nome, cidade, grupo)

Materiais (cod_material, cod_fornecedor, nome, estoque, unidade)

Pedidos (num_pedido, cod_fornecedor, datas, valor)

Itens_Pedidos (num_pedido, cod_material, quantidade, valor`)

Unidades (cod_unidade, nome_unidade)

Conceitos-chave:

Chave primária: identifica unicamente um registro (ex: cod_fornecedor)

Chave estrangeira: cria o relacionamento entre tabelas (ex: materiais.cod_fornecedor)

👉 Dica: nunca tente fazer JOIN sem conhecer essas chaves.

🧠 Teoria de conjuntos aplicada ao SQL

As tabelas podem ser vistas como conjuntos de dados. Os JOINs e operadores SQL seguem conceitos matemáticos:

União (UNION) → junta resultados

Interseção (INTERSECT) → dados comuns

Diferença (MINUS) → dados de um conjunto que não estão em outro

Produto cartesiano → todas as combinações possíveis (geralmente indesejado)

👉 Dica importante: um JOIN sem condição gera produto cartesiano, causando resultados errados e lentos.

🔗 SELECT com duas ou mais tabelas (JOIN básico)
Sintaxe geral:
SELECT colunas
FROM tabela1, tabela2
WHERE condição_de_relacionamento;

❌ Exemplo errado (sem relacionamento):
SELECT fornecedores.nome, materiais.nome
FROM fornecedores, materiais;


Isso gera todas as combinações possíveis entre fornecedores e materiais.

✅ Exemplo correto (com JOIN):
SELECT fornecedores.nome AS "Nome Fornecedor",
       materiais.nome   AS "Nome Material"
FROM fornecedores, materiais
WHERE fornecedores.cod_fornecedor = materiais.cod_fornecedor;


✔ Aqui o banco sabe como as tabelas se relacionam.

🏷️ Uso de ALIAS (boa prática)

Alias tornam o código:

Mais curto

Mais legível

Mais fácil de manter

Mesmo exemplo com alias:
SELECT f.nome, m.nome
FROM fornecedores f, materiais m
WHERE f.cod_fornecedor = m.cod_fornecedor;


👉 Dica: sempre use alias em consultas com mais de uma tabela.

⚙️ Performance e índices

Chaves primárias e estrangeiras normalmente possuem índices

JOINs feitos por essas chaves são mais rápidos

Relacionar tabelas por colunas erradas:

Pode gerar dados incorretos

Prejudica a performance

👉 Regra de ouro: JOIN sempre por chave primária ↔ chave estrangeira.

🔵 INNER JOIN

Retorna somente registros que existem nas duas tabelas.

Exemplo:
SELECT f.nome, SUM(p.valor_total)
FROM fornecedores f, pedidos p
WHERE f.cod_fornecedor = p.cod_fornecedor
GROUP BY f.nome;


✔ Lista apenas fornecedores que têm pedidos.

🟡 OUTER JOIN

Retorna todos os registros de uma tabela, mesmo sem correspondência na outra.

No artigo (Oracle), é usado (+).

Exemplo:
SELECT f.nome, SUM(p.valor_total)
FROM fornecedores f, pedidos p
WHERE f.cod_fornecedor = p.cod_fornecedor(+)
GROUP BY f.nome;


✔ Retorna todos os fornecedores, mesmo os que nunca tiveram pedidos (valor NULL).

📌 Diferença resumida
Tipo de JOIN	O que retorna
INNER JOIN	Apenas registros correspondentes
OUTER JOIN	Todos de uma tabela + correspondentes da outra
✅ Conclusão

JOIN é essencial para qualquer desenvolvedor SQL

Sempre conheça o modelo de dados

Use alias, chaves corretas e condições explícitas

JOINs bem escritos:

Reduzem código na aplicação

Melhoram performance

Evitam erros lógicos


🔄 Sintaxes diferentes para JOIN
1️⃣ Notação implícita (antiga)

Usa vírgulas no FROM e condições no WHERE

Funciona para INNER JOIN em todos os SGBDs

OUTER JOIN depende do fabricante

Exemplos:
-- INNER JOIN (implícito)
FROM fornecedores f, materiais m
WHERE f.cod_fornecedor = m.cod_fornecedor;

-- OUTER JOIN no Oracle
WHERE f.cod_fornecedor = p.cod_fornecedor(+);

-- OUTER JOIN no SQL Server antigo
WHERE f.cod_fornecedor *= p.cod_fornecedor;


⚠️ Problema: não é padronizada e varia entre bancos.

2️⃣ Notação explícita (ANSI – padrão)

JOINs ficam dentro do FROM

Usa palavras-chave: INNER JOIN, LEFT OUTER JOIN, etc.

Funciona em todos os SGBDs modernos

Mais clara e padronizada

INNER JOIN explícito:
SELECT f.nome, m.nome
FROM fornecedores f
INNER JOIN materiais m
  ON f.cod_fornecedor = m.cod_fornecedor;

OUTER JOIN explícito:
SELECT f.nome, SUM(p.valor_total)
FROM fornecedores f
LEFT OUTER JOIN pedidos p
  ON f.cod_fornecedor = p.cod_fornecedor
GROUP BY f.nome;


✅ Dica: prefira sempre a notação explícita (ANSI).

🔗 JOIN com várias tabelas
Exemplo simples (Pedidos × Itens)
SELECT p.*, ip.*
FROM pedidos p, itens_pedidos ip
WHERE p.num_pedido = ip.num_pedido
  AND year(data_pedido) = 2015
  AND month(data_pedido) = 2;


✔ Funciona, mas:

Mostra apenas códigos

Não exibe nomes de fornecedores, materiais e unidades

JOIN completo (5 tabelas)
SELECT f.nome, p.num_pedido, p.data_pedido, p.data_recebimento,
       p.quant_itens, p.valor_total,
       m.nome, ip.quant_pedida,
       u.nome, ip.valor_unitario
FROM pedidos p,
     itens_pedidos ip,
     fornecedores f,
     materiais m,
     unidades u
WHERE p.num_pedido = ip.num_pedido
  AND p.cod_fornecedor = f.cod_fornecedor
  AND ip.cod_material = m.cod_material
  AND m.cod_unidade = u.cod_unidade
  AND year(data_pedido) = 2015
  AND month(data_pedido) = 2;


📌 Cada JOIN representa um relacionamento do modelo de dados.

Mesmo exemplo usando notação explícita (recomendado)
SELECT f.nome, p.num_pedido, p.data_pedido, p.data_recebimento,
       p.quant_itens, p.valor_total,
       m.nome, ip.quant_pedida,
       u.nome, ip.valor_unitario
FROM pedidos p
INNER JOIN fornecedores f    ON p.cod_fornecedor = f.cod_fornecedor
INNER JOIN itens_pedidos ip ON p.num_pedido = ip.num_pedido
INNER JOIN materiais m      ON ip.cod_material = m.cod_material
INNER JOIN unidades u       ON m.cod_unidade = u.cod_unidade
WHERE year(data_pedido) = 2015
  AND month(data_pedido) = 2;


✅ Mais legível
✅ Padronizado
✅ Mais fácil de manter

📄 Por que os dados aparecem repetidos?

Cada item do pedido gera uma linha

Dados do pedido se repetem por natureza do JOIN

Agrupamento e formatação ficam por conta:

da aplicação

ou de um gerador de relatórios

👉 Isso é esperado e correto.

🚀 Por que usar JOIN e não várias queries?
❓ Pergunta comum:

Por que não buscar pedidos em uma query e os itens em outra?

✔ Resposta: PERFORMANCE

Cada query exige:

Análise (parse)

Criação do plano de execução

Execução

📊 Exemplo prático:

2.000 pedidos/mês

5 itens por pedido

1 query de pedidos + 2.000 queries de itens

⏱️ Se cada query levar 1 segundo → 2.000 segundos (~33 minutos)

Com JOIN:

1 única query

Resultado completo

Tempo médio: poucos segundos

👉 Conclusão:
Em 99% dos casos, 1 JOIN grande é muito mais rápido que milhares de queries pequenas.

✅ Dicas finais

Prefira JOIN explícito (ANSI)

Sempre use alias

Faça JOINs apenas por chaves primárias e estrangeiras

Evite múltiplas queries dentro de loops

Dados repetidos não são erro, são consequência natural do JOIN


🔄 Outras sintaxes de OUTER JOIN
LEFT, RIGHT e FULL OUTER JOIN
🔹 LEFT OUTER JOIN

Retorna todas as linhas da tabela da esquerda, mesmo sem correspondência na direita.

FROM fornecedores f
LEFT OUTER JOIN pedidos p
  ON f.cod_fornecedor = p.cod_fornecedor;


✔ Todos os fornecedores aparecem
✔ Pedidos são opcionais

🔹 RIGHT OUTER JOIN

Retorna todas as linhas da tabela da direita, mesmo sem correspondência na esquerda.

FROM fornecedores f
RIGHT OUTER JOIN pedidos p
  ON f.cod_fornecedor = p.cod_fornecedor;


✔ Todos os pedidos aparecem
✔ Fornecedores são opcionais

👉 Dica:
RIGHT JOIN é equivalente a inverter as tabelas e usar LEFT JOIN.

🔹 FULL OUTER JOIN

Retorna todas as linhas das duas tabelas, com ou sem correspondência.

FROM fornecedores f
FULL OUTER JOIN pedidos p
  ON f.cod_fornecedor = p.cod_fornecedor;


✔ Todos os fornecedores
✔ Todos os pedidos
✔ Onde não houver correspondência → NULL

⚠️ Atenção: nem todos os SGBDs suportam FULL OUTER JOIN.

🔁 Simulando FULL OUTER JOIN com UNION

Quando o SGBD não suporta FULL OUTER JOIN, usamos:

SELECT f.nome, SUM(p.valor_total)
FROM fornecedores f
LEFT OUTER JOIN pedidos p
  ON f.cod_fornecedor = p.cod_fornecedor
GROUP BY f.nome
UNION
SELECT f.nome, SUM(p.valor_total)
FROM fornecedores f
RIGHT OUTER JOIN pedidos p
  ON f.cod_fornecedor = p.cod_fornecedor
GROUP BY f.nome;


✔ Resultado igual ao FULL OUTER JOIN

🔗 Operador UNION
UNION

Une dois resultados

Remove duplicidades

Exige:

Mesmo número de colunas

Mesma ordem

Tipos compatíveis

SELECT nome FROM fornecedores_A
UNION
SELECT nome FROM fornecedores_B;

UNION ALL

Une os resultados

Mantém duplicidades

Mais rápido

SELECT nome FROM fornecedores_A
UNION ALL
SELECT nome FROM fornecedores_B;


👉 Dica de performance:
Use UNION ALL sempre que duplicatas não forem um problema.

ORDER BY com UNION

Só pode aparecer no final da última query

SELECT nome FROM A
UNION
SELECT nome FROM B
ORDER BY nome;

🔀 Operador INTERSECT

Retorna apenas os registros comuns entre duas queries.

Exemplo:

Fornecedores com compras > R$50

Fornecedores sem compras há mais de 1 ano

SELECT f.nome
FROM fornecedores f, pedidos p
WHERE f.cod_fornecedor = p.cod_fornecedor
GROUP BY f.nome
HAVING SUM(p.valor_total) > 50
INTERSECT
SELECT f.nome
FROM fornecedores f, pedidos p
WHERE f.cod_fornecedor = p.cod_fornecedor
  AND p.data_pedido < CURRENT_DATE - INTERVAL 1 YEAR;


✔ Resultado: apenas quem atende às duas condições

⚠️ Nem todos os SGBDs suportam INTERSECT.

➖ Operador MINUS

Retorna os registros da primeira query menos a segunda.

Exemplo:

Compras > R$50

Excluindo fornecedores inativos há mais de 1 ano

SELECT f.nome
FROM fornecedores f, pedidos p
WHERE f.cod_fornecedor = p.cod_fornecedor
GROUP BY f.nome
HAVING SUM(p.valor_total) > 50
MINUS
SELECT f.nome
FROM fornecedores f, pedidos p
WHERE f.cod_fornecedor = p.cod_fornecedor
  AND p.data_pedido < CURRENT_DATE - INTERVAL 1 YEAR;


⚠️ MINUS não existe no MySQL.

Substituindo MINUS com subquery (MySQL)
SELECT f.nome
FROM fornecedores f, pedidos p
WHERE f.cod_fornecedor = p.cod_fornecedor
  AND f.nome NOT IN (
      SELECT f.nome
      FROM fornecedores f, pedidos p
      WHERE f.cod_fornecedor = p.cod_fornecedor
        AND p.data_pedido < CURRENT_DATE - INTERVAL 1 YEAR
  )
GROUP BY f.nome
HAVING SUM(p.valor_total) > 50;


✔ Resultado idêntico
✔ Compatível com MySQL

🔁 Auto Join (tabela com ela mesma)

Usado quando uma tabela se autorrelaciona.

Exemplo: Funcionários e Chefes
SELECT f.nome, f.cargo,
       chefe.nome, chefe.cargo
FROM funcionarios f, funcionarios chefe
WHERE f.matricula_chefe = chefe.matricula;


✔ A mesma tabela aparece duas vezes
✔ Alias diferenciam os papéis

👉 Dica:
Se quiser todos os funcionários, mesmo sem chefe → use LEFT JOIN.

❌ Cross Join (produto cartesiano)

Combina todas as linhas de uma tabela com todas da outra.

FROM fornecedores CROSS JOIN materiais;


📌 Resultado = multiplicação das linhas
📌 Geralmente indica erro de JOIN

👉 Regra prática:
Se você não sabe exatamente por que está usando CROSS JOIN, provavelmente não deveria usar.

✅ Conceitos finais essenciais

Ao escrever um JOIN, sempre busque:

Resultado correto (objetivo)

Legibilidade (clareza para quem lê)

Performance (menos queries, mais eficiência)

Joins bem escritos:

Reduzem código da aplicação

Melhoram desempenho

Evitam erros lógicos difíceis de detectar