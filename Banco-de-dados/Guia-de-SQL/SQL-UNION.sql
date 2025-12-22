SQL: UNION – Resumo
O que é o UNION?

O UNION é um operador SQL usado para unir os resultados de duas ou mais consultas SELECT em um único conjunto de resultados.

👉 Diferente do JOIN, o UNION empilha resultados (verticalmente), em vez de combinar colunas.

Regras importantes do UNION

Para funcionar corretamente, todas as consultas devem:
✔ Ter o mesmo número de colunas
✔ Ter tipos de dados compatíveis
✔ Manter a mesma ordem de colunas

📌 O nome das colunas no resultado vem da primeira consulta.

Sintaxe básica
SELECT coluna1, coluna2
FROM tabela1
UNION [ALL]
SELECT coluna1, coluna2
FROM tabela2;


UNION → remove registros duplicados

UNION ALL → mantém registros duplicados (mais rápido)

Exemplo 1 – Professores e Coordenadores
Objetivo

Listar nomes de professores e coordenadores em uma única consulta.

SELECT nome
FROM professor
UNION
SELECT nome
FROM coordenador;

Resultado

Uma lista única contendo nomes de ambas as tabelas.

✅ Dica: Use UNION quando os dados estão em tabelas diferentes, mas representam o mesmo tipo de informação.

Exemplo 2 – Supervisores e Gerentes
Objetivo

Listar todos os funcionários, independentemente do cargo.

SELECT nome
FROM supervisor
UNION
SELECT nome
FROM gerente;

O que acontece?

Os nomes são combinados em um único resultado

Não importa de qual tabela o registro veio

✅ Dica: UNION é ideal para consolidar dados semelhantes.

Exemplo 3 – Cursos de diferentes modalidades
Objetivo

Listar todos os cursos da instituição, independente da modalidade.

SELECT nome FROM curso_pos
UNION
SELECT nome FROM curso_graduacao
UNION
SELECT nome FROM curso_aperfeicoamento;

Resultado

Uma lista única com cursos de pós-graduação, graduação e aperfeiçoamento.

📌 O UNION pode ser usado quantas vezes forem necessárias.

ORDER BY com UNION

🚫 Não é permitido usar ORDER BY em cada SELECT.
✅ Use apenas um ORDER BY no final da última consulta:

SELECT nome FROM curso_pos
UNION
SELECT nome FROM curso_graduacao
ORDER BY nome;

UNION × JOIN
UNION	JOIN
Une linhas	Une colunas
Resultados empilhados	Dados relacionados
Tabelas semelhantes	Tabelas relacionadas
Quando usar UNION?

Quando deseja juntar dados semelhantes

Quando as tabelas têm estrutura compatível

Para gerar relatórios consolidados

📌 Regra de ouro:

Se os dados têm o mesmo significado, use UNION.
Se os dados se relacionam, use JOIN.