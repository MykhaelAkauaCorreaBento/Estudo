✅ Resumo: SQL — SUM (somando valores de uma coluna)

SUM é uma função agregadora utilizada para somar valores numéricos de uma coluna ou o resultado de uma expressão aplicada a cada linha.

📌 Como o SUM funciona

O SUM recebe uma coluna ou uma expressão como parâmetro:

SUM(coluna) → soma todos os valores retornados dessa coluna.

SUM(expressão) → primeiro resolve a expressão para cada linha e depois soma os resultados.

📘 SUM recebendo uma coluna

Considere a tabela:

id	preco
1	20
2	30
3	50
Query
SELECT SUM(preco) FROM Produtos;

Resultado
100


Porque:
20 + 30 + 50 = 100

📝 Dica:
SUM só funciona com colunas numéricas.

📘 SUM recebendo uma expressão

Usando a mesma tabela de produtos, agora aplicando 10% de desconto antes de somar:

Query
SELECT SUM(preco - ((preco * 10) / 100)) FROM Produtos;

Processo

20 → 18

30 → 27

50 → 45

Resultado
90


(18 + 27 + 45 = 90)

📝 Dica:
SUM pode envolver qualquer expressão matemática, e ela é aplicada linha por linha antes da soma final.

📘 Sintaxe
SUM(coluna)
SUM(expressao)

📌 Exemplos de uso do SUM
🔹 Exemplo 1 — Somar valores de uma coluna

Tabela:

Id	Carro	Velocidade
1	Ferrari 458	325
2	Porsche 911 Carrera	306
3	BMW 325i	240
Query
SELECT SUM(Velocidade) FROM Carros;

Resultado
Total | 871

🔹 Exemplo 2 — Somar expressão (cálculo de média via soma)

Tabela igual ao exemplo anterior.

Query
SELECT SUM(Velocidade / 3) FROM Carros;

Resultado
Total | 290,333


📝 Dica:
A expressão é calculada para cada linha antes de somar.

🔹 Exemplo 3 — SUM com GROUP BY

Tabela:

Id	Fabricante	Carro	Velocidade
1	Ferrari	458	325
2	Porsche	911 Carrera	306
3	BMW	325i	240
4	Ferrari	F40	367
5	BMW	M3	290
Query
SELECT SUM(Velocidade)
FROM Carros
GROUP BY Fabricante;

Resultado
BMW     | 530
Ferrari | 692
Porsche | 306


📝 Dica importante:
Quando usamos SUM + GROUP BY, a soma é feita separadamente para cada grupo.

✔️ Resumo Final

SUM soma valores numéricos.

Aceita colunas e expressões.

É compatível com GROUP BY, permitindo somas por categoria/fabricante/etc.

Sempre retorna um único valor, a menos que seja usado com GROUP BY.

Para usar SUM, a coluna deve ser numérica.