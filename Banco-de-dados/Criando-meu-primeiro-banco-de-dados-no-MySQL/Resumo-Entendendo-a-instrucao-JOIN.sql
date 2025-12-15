📘 Guia resumido e prático sobre JOIN em SQL
🎯 Objetivo

A instrução SELECT com JOIN permite combinar dados de duas ou mais tabelas em uma única consulta, reduzindo código na aplicação, melhorando performance, mantendo clareza e explorando corretamente o modelo de dados.

Este guia cobre:

Tipos de JOIN

Sintaxes (implícita e explícita)

JOINs múltiplos

Operadores de conjuntos (UNION, INTERSECT, MINUS)

Auto Join e Cross Join

Boas práticas de performance

🧱 Modelo de dados (base dos exemplos)

Tabelas usadas:

Fornecedores (cod_fornecedor)

Materiais (cod_material, cod_fornecedor)

Pedidos (num_pedido, cod_fornecedor)

Itens_Pedidos (num_pedido, cod_material)

Unidades (cod_unidade)

Conceitos fundamentais:

Chave primária: identifica o registro

Chave estrangeira: cria o relacionamento entre tabelas

JOINs devem sempre usar essas chaves

👉 Dica: nunca faça JOIN sem conhecer o relacionamento entre as tabelas.

🔗 JOIN básico (INNER JOIN)
Sintaxe implícita:
SELECT f.nome, m.nome
FROM fornecedores f, materiais m
WHERE f.cod_fornecedor = m.cod_fornecedor;


✔ Retorna apenas registros que existem nas duas tabelas

Sintaxe explícita (ANSI – recomendada):
SELECT f.nome, m.nome
FROM fornecedores f
INNER JOIN materiais m
  ON f.cod_fornecedor = m.cod_fornecedor;


👉 Boa prática: prefira sempre a sintaxe explícita.

🔵 INNER JOIN

Retorna apenas registros correspondentes

É o JOIN mais comum

FROM fornecedores f
INNER JOIN pedidos p
  ON f.cod_fornecedor = p.cod_fornecedor;

🟡 OUTER JOIN
LEFT OUTER JOIN

Retorna todos da tabela da esquerda

Dados da direita são opcionais

FROM fornecedores f
LEFT OUTER JOIN pedidos p
  ON f.cod_fornecedor = p.cod_fornecedor;

RIGHT OUTER JOIN

Retorna todos da tabela da direita

FROM fornecedores f
RIGHT OUTER JOIN pedidos p
  ON f.cod_fornecedor = p.cod_fornecedor;


👉 RIGHT JOIN = inverter tabelas + LEFT JOIN

FULL OUTER JOIN

Retorna todos os registros de ambas as tabelas

Nem todos os SGBDs suportam

FROM fornecedores f
FULL OUTER JOIN pedidos p
  ON f.cod_fornecedor = p.cod_fornecedor;

🔁 Simulando FULL OUTER JOIN (quando não existe)
SELECT f.nome, SUM(p.valor_total)
FROM fornecedores f
LEFT JOIN pedidos p ON f.cod_fornecedor = p.cod_fornecedor
GROUP BY f.nome
UNION
SELECT f.nome, SUM(p.valor_total)
FROM fornecedores f
RIGHT JOIN pedidos p ON f.cod_fornecedor = p.cod_fornecedor
GROUP BY f.nome;

🧩 JOIN com várias tabelas
SELECT f.nome, p.num_pedido, m.nome, ip.quant_pedida, u.nome
FROM pedidos p
INNER JOIN fornecedores f    ON p.cod_fornecedor = f.cod_fornecedor
INNER JOIN itens_pedidos ip ON p.num_pedido = ip.num_pedido
INNER JOIN materiais m      ON ip.cod_material = m.cod_material
INNER JOIN unidades u       ON m.cod_unidade = u.cod_unidade
WHERE YEAR(p.data_pedido) = 2015
  AND MONTH(p.data_pedido) = 2;


📌 Dados repetidos são normais
📌 A apresentação final fica a cargo da aplicação ou relatório

⚙️ Performance: por que usar JOIN?

Uma query com JOIN é mais rápida do que milhares de queries separadas

Evita execução repetitiva de SELECTs

Índices em chaves primárias e estrangeiras aceleram JOINs

👉 Regra de ouro:

Prefira uma query bem escrita a muitas queries simples.

🔗 Operadores de conjuntos
UNION

Une resultados

Remove duplicatas

SELECT nome FROM A
UNION
SELECT nome FROM B;

UNION ALL

Mantém duplicatas

Mais rápido

SELECT nome FROM A
UNION ALL
SELECT nome FROM B;

INTERSECT

Retorna apenas registros comuns

SELECT nome FROM A
INTERSECT
SELECT nome FROM B;

MINUS

Retorna registros da primeira query menos a segunda

Não existe no MySQL

SELECT nome FROM A
MINUS
SELECT nome FROM B;

Alternativa no MySQL:
SELECT nome FROM A
WHERE nome NOT IN (SELECT nome FROM B);

🔁 Auto Join

JOIN de uma tabela com ela mesma (autorrelacionamento).

SELECT f.nome, chefe.nome
FROM funcionarios f
LEFT JOIN funcionarios chefe
  ON f.matricula_chefe = chefe.matricula;


✔ Muito usado em hierarquias (chefe, gerente, diretor)

❌ Cross Join

Produto cartesiano

Combina todas as linhas com todas

Geralmente indica erro

FROM fornecedores CROSS JOIN materiais;


👉 Se você não sabe por que está usando, não use.

✅ Boas práticas finais

Conheça o modelo de dados

Use JOIN explícito (ANSI)

Relacione apenas por chaves

Use alias

Priorize clareza, objetivo e performance