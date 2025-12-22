Resumo – Trabalhando com Subqueries em SQL

Uma subquery (ou subconsulta / subselect) é um comando SELECT dentro de outro comando SQL. Ela é essencial para resolver consultas complexas, sendo muitas vezes a única forma correta de obter determinados resultados.

🔎 Exemplo básico de subquery
SELECT *
FROM tabela1 T
WHERE coluna1 IN (
  SELECT coluna2
  FROM tabela2 T2
  WHERE T.id = T2.id
);


✔ A consulta principal filtra seus resultados com base no retorno de outra consulta.

📌 Formas de usar subqueries

As subqueries podem ser usadas de três maneiras principais:

Como uma nova coluna no SELECT

Como filtro de uma consulta (IN, EXISTS ou operadores lógicos)

Como fonte de dados da consulta principal (SELECT FROM SELECT)

Os exemplos utilizam tabelas como: projetos, comentarios, usuarios, likes_por_projeto e likes_por_comentarios.

🧱 1. Subquery como nova coluna (SELECT AS FIELD)

Objetivo: listar projetos e adicionar colunas calculadas, como quantidade de comentários e likes.

SELECT
  P.titulo,
  (SELECT COUNT(C.id_projeto)
   FROM comentarios C
   WHERE C.id_projeto = P.id) AS Quantidade_Comentarios,
  (SELECT COUNT(LP.id_projeto)
   FROM likes_por_projeto LP
   WHERE LP.id_projeto = P.id) AS Quantidade_Likes
FROM projetos P
GROUP BY P.id;


✔ Resultado: cada projeto aparece com o total de comentários e likes.

📌 Dicas importantes:

A subquery deve retornar apenas um valor.

Sempre use AS para nomear a coluna criada.

🔍 2. Subquery como filtro de consulta
Usando IN

Objetivo: listar apenas projetos que possuem comentários.

SELECT P.id, P.titulo, P.data
FROM projetos P
WHERE P.id IN (
  SELECT C.id_projeto
  FROM comentarios C
  WHERE P.id = C.id_projeto
);


✔ Retorna somente projetos comentados.
📌 A subquery pode retornar vários valores, mas uma única coluna.

Usando EXISTS
SELECT P.id, P.titulo, P.data
FROM projetos P
WHERE EXISTS (
  SELECT C.id_projeto
  FROM comentarios C
  WHERE P.id = C.id_projeto
);


✔ O EXISTS verifica se a subquery retorna algum resultado, sem se importar com os valores.

📌 Dica: EXISTS costuma ser mais eficiente em tabelas grandes.

Usando operadores lógicos

Objetivo: buscar o último projeto que recebeu likes.

SELECT P.titulo, P.data
FROM projetos P
WHERE P.id = (
  SELECT MAX(LP.id_projeto)
  FROM likes_por_projeto LP
);


✔ A subquery retorna um único valor que é comparado com =.

🗂️ 3. Subquery como fonte de dados (SELECT FROM SELECT)

Objetivo: usar o resultado de uma query como se fosse uma tabela.

SELECT F.titulo, F.Quantidade_Comentarios
FROM (
  SELECT
    P.id,
    P.titulo,
    (SELECT COUNT(C.id_projeto)
     FROM comentarios C
     WHERE C.id_projeto = P.id) AS Quantidade_Comentarios
  FROM projetos P
) AS F
WHERE F.Quantidade_Comentarios > 2;


✔ Retorna apenas projetos com mais de 2 comentários.

📌 Dicas importantes:

Subqueries no FROM devem ter um alias (AS F).

Essa técnica facilita filtros e relatórios mais avançados.

✅ Conclusão

As subqueries tornam o SQL muito mais poderoso, permitindo:

criar colunas calculadas,

filtrar dados com base em outras tabelas,

reutilizar consultas como se fossem tabelas.

💡 Dica final:

Pense na subquery como uma consulta auxiliar que alimenta a consulta principal, seja com valores, filtros ou dados completos.