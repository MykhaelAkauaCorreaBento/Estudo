SQL: LEFT JOIN – Resumo
O que é o LEFT JOIN?

O LEFT JOIN retorna todos os registros da tabela da esquerda e apenas os registros correspondentes da tabela da direita.
Quando não existe correspondência, os campos da tabela da direita retornam NULL.

👉 Em outras palavras: nada da tabela esquerda é perdido.

Sintaxe básica
SELECT colunas
FROM tabela_esquerda A
LEFT JOIN tabela_direita B
ON A.coluna = B.coluna;


📌 A tabela que vem antes do LEFT JOIN é sempre a prioritária.

Exemplo 1 – Produtos e Categorias
Objetivo

Listar todos os produtos, mesmo aqueles sem categoria.

SELECT
    P.nome AS Produto,
    C.nome AS Categoria
FROM produto P
LEFT JOIN categoria_produto C
ON C.id = P.id_categoria;

Resultado (resumo)

Produtos com categoria → nome da categoria

Produtos sem categoria → NULL
Ex.: Bicicleta Mormai → NULL

✅ Dica: Use LEFT JOIN quando os dados da tabela da esquerda devem aparecer sempre, mesmo incompletos.

Exemplo 2 – Produtos, Categorias e Vendas
Objetivo

Exibir todos os produtos, sua categoria e quantidade de vendas, mesmo que nunca tenham sido vendidos.

SELECT
    P.nome AS Produto,
    C.nome AS Categoria,
    COUNT(VP.id_produto) AS TOTAL_VENDIDOS
FROM produto P
LEFT JOIN categoria_produto C
ON C.id = P.id_categoria
LEFT JOIN venda_produto VP
ON VP.id_produto = P.id
GROUP BY P.id;

O que acontece?

Produtos sem vendas → TOTAL_VENDIDOS = 0

Produtos sem categoria → Categoria = NULL

Nenhum produto é excluído do resultado

✅ Dica importante:
Quando usar COUNT com LEFT JOIN, o resultado será 0, não NULL.

Exemplo 3 – Projetos e Comentários
Objetivo

Listar todos os projetos, com comentários quando existirem.

SELECT
    P.id,
    P.titulo,
    C.comentario
FROM projetos P
LEFT JOIN comentario C
ON C.id_projeto = P.id;

Resultado

Projetos com comentários → múltiplas linhas

Projetos sem comentários → comentário NULL

✅ Dica: Ideal para relatórios onde os dados relacionados são opcionais.

Principais características do LEFT JOIN

✔ Retorna todos os registros da tabela esquerda
✔ Não elimina dados sem relacionamento
✔ Campos da tabela direita podem ser NULL
✔ Pode ser encadeado com vários LEFT JOINs

Quando usar LEFT JOIN?

Quando não pode perder dados da tabela principal

Para relatórios completos

Para identificar registros sem relacionamento

Quando o relacionamento é opcional

📌 Regra de ouro:

Se o registro precisa aparecer mesmo sem correspondência, use LEFT JOIN.