Resumo – Subqueries: questões de concurso resolvidas

Subquery é um SELECT dentro de outro comando SQL (SELECT, UPDATE, DELETE ou outra subquery). Ela permite resolver consultas mais complexas, muitas vezes impossíveis ou muito difíceis de fazer apenas com JOIN. Por isso, é um tema muito cobrado em concursos públicos e essencial para desenvolvedores.

Questão 1 – CGU (conceitual)

Pergunta sobre afirmações corretas a respeito de subqueries.

✅ Resposta correta: letra E

O operador = não pode ser usado quando a subquery retorna múltiplas linhas.

Por que as outras estão erradas?

A) Toda subquery deve estar entre parênteses.
👉 Dica: use sempre um alias quando possível.

B) A subquery pode estar à esquerda ou à direita do operador.

C) Subqueries não usam ORDER BY (ele deve ficar na consulta principal).

D) O operador IN pode ser usado com subqueries que retornam várias linhas.

📌 Dica de prova:

Uma linha → =

Múltiplas linhas → IN, NOT IN, EXISTS, NOT EXISTS

Questão 2 – TCMSP (NOT EXISTS)

A consulta usa subqueries aninhadas com NOT EXISTS.

Estratégia de resolução:

Analisar da subquery mais interna para a externa.

Ver quais registros existem ou não existem em cada nível.

Filtrar o resultado final na consulta principal.

Após analisar passo a passo:

Apenas o valor 1 atende a todas as condições.

✅ Resposta correta: letra A (1)

👉 Dica importante:
Em questões com EXISTS / NOT EXISTS, sempre avalie:

Quais linhas geram resultado

Quais não encontram correspondência

Questão 3 – IBGE (NOT IN)

Pergunta:

Quais empregados do departamento 200 não tiraram férias em 2000?

SELECT nomeEmpregado
FROM Empregado
WHERE idDepartamento = 200
AND idEmpregado NOT IN (
    SELECT idEmpregado
    FROM Ferias
    WHERE ano = 2000
);

Compreensão:

A consulta principal filtra o departamento 200

A subquery retorna quem tirou férias em 2000

NOT IN exclui esses empregados do resultado

👉 Dica:
NOT IN é ideal para exclusões baseadas em listas.

Questão 4 – IBGE (subquery com agregação)

Pergunta:

Empregados com salário acima da média e mais de 2 dependentes.

SELECT idEmpregado, nomeEmpregado
FROM Empregado
WHERE numeroDependentes > 2
AND salario > (SELECT AVG(salario) FROM Empregado);

Compreensão:

A subquery calcula a média salarial da empresa

A consulta principal compara cada salário com esse valor

Filtros são combinados com AND

👉 Dica de ouro:
Subqueries com funções agregadas (AVG, SUM, COUNT) são muito comuns em provas.

Conclusão

Subqueries são fundamentais porque:

Resolvem problemas que JOIN não resolve bem

Permitem consultas mais claras e organizadas

São recorrentes em concursos públicos

📌 Resumo final para provas:

Use parênteses sempre

Subquery de múltiplas linhas ≠ =

IN, NOT IN, EXISTS e NOT EXISTS são essenciais

Analise de dentro para fora