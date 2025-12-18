Resumo – SQL: Subquery (Subconsulta)

Uma subquery (ou subselect) é um comando SELECT dentro de outro comando SQL. Ela permite criar consultas mais poderosas, resolvendo problemas que seriam difíceis ou impossíveis com apenas uma query simples.

🔎 Visão geral

As subqueries podem aparecer em diferentes partes do SQL, como:

no SELECT (como campo),

no FROM (como tabela),

no WHERE (como condição).

Elas são muito usadas para comparar valores, filtrar resultados, agrupar dados e manipular registros (INSERT, DELETE).

🧱 Sintaxe básica
SELECT coluna1, coluna2 | subquery AS alias
FROM tabela | (subquery) AS alias
WHERE coluna = (subquery)
   OR coluna IN (subquery)

📌 Exemplo 1 – Preço acima da média

Problema: listar produtos com preço maior que a média.

SELECT nome, preco
FROM produto
WHERE preco > (
  SELECT AVG(preco)
  FROM produto
);


🔹 A subquery calcula a média de preços, e a query principal retorna apenas os produtos acima desse valor.
✔ Resultado: Notebook (3500.00).

📌 Exemplo 2 – Produto mais vendido

Problema: descobrir qual produto teve a maior quantidade de vendas.

Subquery interna: conta quantas vezes cada produto aparece em venda_produto.

Query externa: pega o maior valor vendido.

SELECT id, Produto, MAX(TOTAL_VENDIDO) AS MAIOR
FROM (
  SELECT
    P.id,
    P.nome AS Produto,
    (SELECT COUNT(VP.id_produto)
     FROM venda_produto VP
     WHERE P.id = VP.id_produto
     GROUP BY P.id) AS TOTAL_VENDIDO
  FROM produto P
  GROUP BY P.id
) AS Tabela;


✔ Resultado: Bola – 3 vendas.

📌 Dica: subqueries no FROM precisam de alias.

📌 Exemplo 3 – INSERT com subquery

Problema: promover supervisores contratados antes de 2016 para a tabela gerente.

INSERT INTO gerente (nome, departamento, data_admissao)
SELECT nome, departamento, data_admissao
FROM supervisor
WHERE YEAR(data_admissao) < 2016;


✔ Os supervisores antigos são inseridos como gerentes.

⚠ Dica importante: o INSERT ... SELECT só funciona se as colunas forem compatíveis em quantidade e tipo.

📌 Exemplo 4 – DELETE com subquery

Problema: remover da tabela supervisor quem já foi promovido a gerente.

DELETE FROM supervisor
WHERE nome IN (
  SELECT nome
  FROM gerente
);


✔ Remove apenas os supervisores que agora são gerentes.

📌 Exemplo 5 – Projetos com comentários

Problema: listar apenas projetos que possuem comentários.

SELECT P.*
FROM projetos P
WHERE P.id IN (
  SELECT C.id_projeto
  FROM comentario C
  WHERE C.id_projeto = P.id
);


✔ Retorna somente projetos comentados.

📌 Dica: usar IN é ideal quando a subquery retorna vários valores.

📌 Exemplo 6 – Projetos sem comentários

Problema: listar projetos que não possuem comentários.

SELECT P.*
FROM projetos P
WHERE P.id NOT IN (
  SELECT C.id_projeto
  FROM comentario C
);


✔ Retorna apenas projetos sem vínculo com comentários.

✅ Conclusão

As subqueries são essenciais no SQL e permitem:

comparar dados (ex: média),

filtrar resultados complexos,

reutilizar consultas,

manipular dados com INSERT, DELETE e SELECT.

💡 Resumo da dica principal:

Sempre pense na subquery como uma consulta auxiliar que fornece dados para a consulta principal.