✅ Resumo: SQL Server — Operadores LIKE e NOT LIKE (com todos os exemplos e dicas)

Os operadores LIKE e NOT LIKE são usados em conjunto com a cláusula WHERE para realizar pesquisas em colunas de texto, permitindo filtrar por letras, caracteres, sílabas ou padrões específicos.

O caractere % funciona como coringa, representando “qualquer sequência de caracteres”.

📌 WHERE com LIKE

Usamos LIKE quando queremos buscar valores por padrões em colunas do tipo texto (como NOMEPRODUTO e TIPOPRODUTO).

🔹 1. Produtos cuja primeira letra é C
SELECT *
FROM Produtos
WHERE NOMEPRODUTO LIKE 'C%';


Retorna todos os produtos que começam com a letra C.
O % permite que qualquer sequência de caracteres venha depois.

🔹 2. Produtos que começam com C e têm D em qualquer posição
SELECT *
FROM Produtos
WHERE NOMEPRODUTO LIKE 'C%D%';


Primeiro caractere = C
Em algum ponto depois = D

🔹 3. Produtos que contenham C em qualquer posição
SELECT *
FROM Produtos
WHERE NOMEPRODUTO LIKE '%C%';


%C% → a letra C pode aparecer no começo, meio ou fim.

🔹 4. Produtos que contenham a sílaba "or"
SELECT *
FROM Produtos
WHERE NOMEPRODUTO LIKE '%or%';


Pesquisa por uma sílaba dentro do nome.

🔹 5. Produtos cujo nome contém "or" e tipo contém "ti"
SELECT *
FROM Produtos
WHERE NOMEPRODUTO LIKE '%or%'
  AND TIPOPRODUTO LIKE '%ti%';


Combinação de condições simultâneas com AND.

📌 WHERE com NOT LIKE

O NOT LIKE retorna valores que não correspondem ao padrão informado.
É exatamente a operação contrária do LIKE.

🔹 1. Produtos que NÃO começam com C
SELECT *
FROM Produtos
WHERE NOMEPRODUTO NOT LIKE 'C%';


Exclui todos que iniciam com C.

🔹 2. Produtos que NÃO começam com C e NÃO têm D em nenhuma posição
SELECT *
FROM Produtos
WHERE NOMEPRODUTO NOT LIKE 'C%D%';


Nem começam com C, nem possuem D em qualquer posição.

🔹 3. Produtos que NÃO contenham E
SELECT *
FROM Produtos
WHERE NOMEPRODUTO NOT LIKE '%E%';


Exclui todos que tenham E em qualquer parte do nome.

🔹 4. Produtos cujo nome NÃO contenha "or" e tipo NÃO contenha "ti"
SELECT *
FROM Produtos
WHERE NOMEPRODUTO NOT LIKE '%or%'
  AND TIPOPRODUTO NOT LIKE '%ti%';


Combina duas negações ao mesmo tempo.

📘 Resumo final
✔ LIKE:

Busca por padrões com % (coringa).

Permite filtrar por:

letra inicial

caracteres no meio

sílabas

combinações de condições

✔ NOT LIKE:

Retorna valores que não combinam com o padrão.

Útil para excluir sílabas, letras e padrões específicos.

✔ Dicas:

% representa qualquer sequência de caracteres.

Pode ser usado no início, meio ou fim da string.

Pode combinar várias condições com AND e OR.

Ótimo para pesquisas flexíveis em colunas de texto.