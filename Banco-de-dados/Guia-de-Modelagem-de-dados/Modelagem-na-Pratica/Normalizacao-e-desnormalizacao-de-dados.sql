Normalização e Desnormalização de Dados – Resumo Completo e Prático
📌 Objetivo do artigo

Explicar normalização de dados em bancos de dados relacionais, suas formas normais (1FN a 5FN), e quando aplicar desnormalização para melhorar performance, equilibrando teoria e prática.

🔹 O que é Normalização?

Normalização é um processo de organização dos dados para:

Evitar duplicidade de informações

Economizar espaço em disco

Garantir integridade referencial

Facilitar manutenção e entendimento do modelo

Ela se baseia em regras chamadas Formas Normais (FN). Cada forma refina a anterior.

⚠️ Cuidado: normalizar demais pode causar perda de desempenho, devido ao excesso de junções (JOINs).

🔹 Conceitos básicos importantes

Tabela: estrutura que define colunas e armazena linhas

Linha (registro/tupla): um conjunto de dados

Coluna (campo/atributo): característica do dado

Chave Primária (PK): identifica unicamente um registro

Chave Estrangeira (FK): referencia uma PK de outra tabela

Integridade Referencial: garante consistência entre tabelas relacionadas

🔹 Formas Normais (FN)
✅ 1ª Forma Normal (1FN)

Remove grupos repetidos criando relacionamento 1:N.

📌 Exemplo:
Uma ordem de compra com vários itens → cria-se a tabela ItemOrdemCompra.

Benefícios:

Menos redundância

Menor consumo de espaço

Garantia de consistência

✅ 2ª Forma Normal (2FN)

Separa dados estáticos de dados dinâmicos, criando relacionamento N:1.

📌 Exemplo:
Dados do cliente (nome, endereço, telefone) separados da ordem de compra.

Dica: dados que mudam pouco tendem a ser repetidos → devem ir para outra tabela.

✅ 3ª Forma Normal (3FN)

Resolve relacionamentos muitos-para-muitos (N:M) usando uma tabela intermediária.

📌 Exemplo:
Curso ↔ Aluno → tabela Curso_Aluno.

⚠️ Dica prática:
Só aplique se a aplicação realmente precisar consultar esses dados individualmente. Muitas vezes, isso pode ser resolvido na aplicação.

✅ 4ª Forma Normal (4FN)

Remove atributos multivalorados.

📌 Exemplo:
Um empregado com várias habilidades e certificações → tabelas separadas.

⚠️ Pode gerar muitas tabelas e prejudicar desempenho.

✅ 5ª Forma Normal (5FN)

Divide colunas inter-relacionadas em tabelas menores para eliminar redundâncias restantes.

📌 Uso raro e mais acadêmico.

🔹 Resumo rápido das Formas Normais
Forma	O que faz	Uso prático
1FN	Remove repetições	Muito comum
2FN	Separa dados estáticos	Muito comum
3FN	Resolve N:M	Uso criterioso
4FN	Remove multivalores	Raro
5FN	Elimina redundâncias complexas	Muito raro
🔹 OLTP x OLAP

OLTP: sistemas transacionais (cadastros, vendas, pedidos)

OLAP/Data Warehouse: análises, relatórios, BI

📌 Importante:

OLTP → altamente normalizado

OLAP → geralmente desnormalizado (modelo dimensional)

🔹 O que é Desnormalização?

É a introdução controlada de redundância para:

Reduzir JOINs

Melhorar tempo de resposta

Simplificar consultas

⚠️ Não é o oposto exato da normalização, nem remove tudo.

🔹 Quando desnormalizar?

Desnormalize somente se houver problemas reais de desempenho.

💡 Sinais claros:

Muitas junções para buscar um dado simples

Muitas tabelas pouco usadas

Relacionamentos 1:1 desnecessários

Consultas SQL muito grandes e lentas

Muito mais tabelas do que funcionalidades

📌 Frase-chave do artigo:

“Normalize sempre e desnormalize quando necessário.”

🔹 Exemplos comuns de desnormalização

Unir tabelas 1:1

Eliminar tabelas intermediárias inúteis

Copiar dados estáticos para evitar junções frequentes

Usar chaves compostas para reduzir joins

Criar tabelas específicas para relatórios

🔹 Dicas finais importantes

✔ Normalize no projeto inicial
✔ Teste desempenho antes da produção
✔ Evite normalização “por obrigação acadêmica”
✔ Espaço em disco é barato, tempo de resposta não
✔ Não existe receita pronta — experiência conta muito

🎯 Conclusão

Normalização garante organização, integridade e economia

Desnormalização garante desempenho

O sucesso está no equilíbrio

Um bom projeto de banco de dados começa com uma modelagem bem pensada

Boa prática: normalize sempre, mas esteja pronto para desnormalizar quando o desempenho exigir.