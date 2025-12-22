SQL: INNER JOIN – Resumo
Visão geral

O INNER JOIN é usado para juntar duas ou mais tabelas, retornando somente os registros que possuem correspondência entre todas elas.
Se um registro existir em uma tabela, mas não tiver relação na outra, ele não aparece no resultado.

👉 Em termos práticos: apenas a interseção entre as tabelas.

Sintaxe básica
SELECT colunas
FROM tabela1 A
INNER JOIN tabela2 B
ON A.coluna = B.coluna;


📌 A cláusula ON define como as tabelas se relacionam (chave primária × chave estrangeira).

Exemplo 1 – Produto e Categoria
Objetivo

Listar os produtos com o nome de sua categoria.

SELECT
    P.nome,
    P.preco,
    C.nome AS Categoria
FROM produto P
INNER JOIN categoria_produto C
ON P.id_categoria = C.id;

O que acontece?

Apenas produtos que possuem categoria válida são exibidos.

Se um produto não tiver categoria relacionada, não aparece no resultado.

✅ Dica: INNER JOIN é ideal quando o relacionamento é obrigatório.

Exemplo 2 – Produto, Categoria e Vendas
Objetivo

Listar produtos, categoria e quantidade de vendas.

SELECT
    P.nome,
    P.preco,
    C.nome AS Categoria,
    COUNT(V.id_produto) AS TOTAL_VENDIDOS
FROM produto P
INNER JOIN categoria_produto C
ON P.id_categoria = C.id
INNER JOIN venda_produto V
ON V.id_produto = P.id
GROUP BY P.id;

O que acontece?

O produto só aparece se:

existir na tabela de produtos,

tiver categoria,

e tiver ao menos uma venda.

Produtos sem vendas não aparecem.

✅ Dica: Quando usar INNER JOIN com COUNT, lembre-se do GROUP BY.

Exemplo 3 – Projetos com Comentários
Objetivo

Listar apenas os projetos que possuem comentários.

SELECT
    P.id,
    P.titulo
FROM projetos P
INNER JOIN comentario C
ON C.id_projeto = P.id
GROUP BY P.id;

Resultado

Apenas projetos que têm ao menos um comentário são retornados.

✅ Dica: INNER JOIN é perfeito para filtrar registros que obrigatoriamente tenham relacionamento.

Principais características do INNER JOIN

✔ Retorna apenas registros com correspondência em todas as tabelas
✔ Ignora dados sem relacionamento
✔ Muito usado em relatórios e consultas com regras bem definidas

Quando usar INNER JOIN?

Quando o relacionamento é obrigatório

Quando você quer dados consistentes

Quando registros sem vínculo não fazem sentido no resultado

📌 Regra de ouro:

Se não houver correspondência entre as tabelas, o INNER JOIN descarta o registro.