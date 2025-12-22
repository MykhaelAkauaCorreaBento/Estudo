Cláusula WHERE no SQL

A cláusula WHERE filtra registros que atendem a condições específicas, sendo usada para selecionar apenas os dados desejados. Pode ser combinada com operadores lógicos (AND, OR) e comparativos, além de operadores especiais (IN, NOT IN, BETWEEN, NOT BETWEEN).

1. AND e OR

AND: todas as condições devem ser verdadeiras.

OR: pelo menos uma condição deve ser verdadeira.

Exemplo AND – acréscimo de 10% em produtos de Informática com valor ≤ 350:

UPDATE Produtos
SET valor = valor * 1.1
WHERE tipo = 'Informática' AND valor <= 350;


Exemplo OR – acréscimo de 10% em produtos Eletrônicos ou com valor ≥ 350:

UPDATE Produtos
SET valor = valor * 1.1
WHERE tipo = 'Eletrônicos' OR valor >= 350;


Dica: AND é mais restritivo, OR é mais abrangente.

2. IN

Verifica se o valor de uma coluna está em uma lista.

SELECT * FROM Produtos
WHERE tipo IN ('Eletrônicos', 'Informática');

3. NOT IN

Retorna registros cujo valor não está na lista.

SELECT * FROM Produtos
WHERE tipo NOT IN ('Eletrônicos', 'Informática');


Pode-se também usar AND com <> para o mesmo efeito.

4. BETWEEN

Seleciona registros dentro de um intervalo de valores (inclusive os limites).

SELECT * FROM Produtos
WHERE valor BETWEEN 300.00 AND 500.00;


Útil para números, datas e caracteres.

5. NOT BETWEEN

Seleciona registros fora de um intervalo de valores.

SELECT * FROM Produtos
WHERE valor NOT BETWEEN 300.00 AND 500.00;

Resumo dos operadores
Operador	Função
AND	Todas as condições verdadeiras
OR	Pelo menos uma condição verdadeira
IN	Valor presente em uma lista
NOT IN	Valor não presente em uma lista
BETWEEN	Valor dentro de um intervalo
NOT BETWEEN	Valor fora de um intervalo

Próximos tópicos no curso:

Operadores LIKE e NOT LIKE

Cláusulas ORDER BY, TOP e TOP WITH TIES

Dica: Usar BETWEEN simplifica consultas de faixa em comparação a múltiplas condições relacionais; IN simplifica múltiplos OR.