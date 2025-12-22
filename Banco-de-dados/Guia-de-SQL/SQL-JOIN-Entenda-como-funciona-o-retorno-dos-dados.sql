SQL JOIN – Como funciona o retorno dos dados

Muitos desenvolvedores têm dificuldade em entender quais dados cada tipo de JOIN retorna e quando usar cada um. Os JOINs podem ser entendidos usando a Teoria dos Conjuntos, comparando duas tabelas (A e B).

Para os exemplos, considere duas tabelas simples:

Estrutura das tabelas
CREATE TABLE TabelaA (Nome varchar(50));
CREATE TABLE TabelaB (Nome varchar(50));

Dados de teste
-- TabelaA
Fernanda
Josefa
Luiz
Fernando

-- TabelaB
Carlos
Manoel
Luiz
Fernando


Os nomes Luiz e Fernando existem em ambas as tabelas.

1. INNER JOIN

🔹 Retorna apenas os registros comuns às duas tabelas.

Exemplo
SELECT a.Nome, b.Nome
FROM TabelaA A
INNER JOIN TabelaB B
ON a.Nome = b.Nome;

Resultado
Luiz     | Luiz
Fernando | Fernando


✅ Dica: Use quando precisar somente dos dados que existem nos dois lados do relacionamento.

2. LEFT JOIN

🔹 Retorna todos os registros da tabela da esquerda (A) e os correspondentes da tabela B.
🔹 Quando não houver correspondência, os dados da tabela B ficam NULL.

Exemplo
SELECT a.Nome, b.Nome
FROM TabelaA A
LEFT JOIN TabelaB B
ON a.Nome = b.Nome;

Resultado
Fernanda | NULL
Josefa   | NULL
Luiz     | Luiz
Fernando | Fernando


✅ Dica: Ideal quando a tabela A é a principal e você não quer perder nenhum registro dela.

3. RIGHT JOIN

🔹 Retorna todos os registros da tabela da direita (B) e os correspondentes da tabela A.

Exemplo
SELECT a.Nome, b.Nome
FROM TabelaA A
RIGHT JOIN TabelaB B
ON a.Nome = b.Nome;

Resultado
NULL     | Carlos
NULL     | Manoel
Luiz     | Luiz
Fernando | Fernando


✅ Dica: Funciona como o LEFT JOIN, mas invertendo as tabelas.
💡 Boa prática: Prefira LEFT JOIN para manter legibilidade.

4. FULL OUTER JOIN

🔹 Retorna todos os registros das duas tabelas, combinando os comuns e exibindo NULL onde não houver correspondência.

Exemplo
SELECT a.Nome, b.Nome
FROM TabelaA A
FULL OUTER JOIN TabelaB B
ON a.Nome = b.Nome;

Resultado
Fernanda | NULL
Josefa   | NULL
Luiz     | Luiz
Fernando | Fernando
NULL     | Carlos
NULL     | Manoel


✅ Dica: Útil para comparar tabelas e identificar diferenças entre elas.
📌 OUTER é opcional (FULL JOIN funciona igual).

5. LEFT EXCLUDING JOIN

🔹 Retorna apenas os registros da tabela A que NÃO existem na tabela B.

Exemplo
SELECT a.Nome
FROM TabelaA A
LEFT JOIN TabelaB B
ON a.Nome = b.Nome
WHERE b.Nome IS NULL;

Resultado
Fernanda
Josefa


✅ Dica: Excelente para encontrar registros órfãos ou não relacionados.

6. RIGHT EXCLUDING JOIN

🔹 Retorna os registros da tabela B que NÃO existem na tabela A.

Exemplo
SELECT b.Nome
FROM TabelaA A
RIGHT JOIN TabelaB B
ON a.Nome = b.Nome
WHERE a.Nome IS NULL;

Resultado
Carlos
Manoel


✅ Dica: Pode ser reescrito como LEFT JOIN invertendo as tabelas.

7. OUTER EXCLUDING JOIN

🔹 Retorna apenas os registros que NÃO são comuns entre as tabelas.

Exemplo
SELECT a.Nome, b.Nome
FROM TabelaA A
FULL JOIN TabelaB B
ON a.Nome = b.Nome
WHERE a.Nome IS NULL OR b.Nome IS NULL;

Resultado
Fernanda | NULL
Josefa   | NULL
NULL     | Carlos
NULL     | Manoel


✅ Dica: Ideal para identificar diferenças entre duas tabelas.

Conclusão

Os JOINs são fundamentais no SQL e amplamente utilizados em bancos relacionais como SQL Server, MySQL, Oracle e Firebird.