Normalização de Dados na Prática – Resumo Essencial
🎯 Objetivo do artigo

Apresentar, de forma simples e prática, como aplicar normalização de dados (1FN, 2FN e 3FN) durante a modelagem de dados, mostrando:

Como evitar redundância

Como melhorar desempenho

Como aumentar a qualidade e manutenção dos sistemas

🔹 Quando usar normalização?

Em novos projetos

Na manutenção de sistemas existentes

Quando há problemas de:

Performance

Redundância

Dificuldade de manutenção

📌 Erro comum:
Criar o banco pensando no código, e não no negócio.
✔ O correto é modelar o negócio primeiro.

🔹 O que é normalização?

É um conjunto de regras para:

Organizar dados corretamente

Evitar inconsistências lógicas

Facilitar consultas e manutenção

Melhorar desempenho

Usando apenas 1FN, 2FN e 3FN, já se atinge um alto nível de maturidade no modelo.

🔹 Modelo Lógico x Modelo Físico

Modelo lógico: representa o negócio, define entidades, atributos e relacionamentos

Modelo físico: adapta o modelo lógico ao SGBD (tabelas, colunas, tipos de dados)

📌 Sempre normalize no modelo lógico, depois implemente o físico.

🔹 Entendimento do negócio

Antes das tabelas, é preciso entender:

O que o sistema faz

As regras do negócio

A função de cada atributo

📌 Exemplo usado no artigo:
Um formulário de cotação de preços, típico de empresas.

🔹 Separação por assunto (primeiro passo)

A partir do formulário, os atributos são agrupados por tema:

Pessoa (cliente e vendedor)

Item

Cotação

Itens da cotação

✔ Isso facilita a aplicação das formas normais.

🔹 Primeira Forma Normal (1FN)

Regra:
Nenhum atributo pode ter mais de um valor.

❌ Exemplo errado:

Fone1, Fone2

✔ Solução:

Criar entidade PESSOA_TELEFONE

Uma pessoa pode ter zero ou vários telefones

📌 Dica prática:
Atributos repetidos com números indicam violação da 1FN.

🔹 Segunda Forma Normal (2FN)

Regras:

Estar na 1FN

Todos os atributos devem depender totalmente da chave primária

✔ Elimina redundâncias
✔ Remove atributos fora do contexto da entidade

📌 Exemplos importantes:

Nome do cliente e nome do vendedor viram NOME_PESSOA

Criação de CHECK CONSTRAINT para diferenciar tipos (cliente/vendedor)

UNIDADE_MEDIDA vira uma entidade própria

📌 Dica prática:
Atributos do tipo “código”, “tipo” ou “sigla” devem ser analisados com cuidado.

🔹 Terceira Forma Normal (3FN)

Regras:

Estar na 2FN

Não armazenar campos calculados

❌ Exemplo:

Valor total da cotação armazenado

✔ Correto:

Calcular a partir de:

Quantidade × Valor Unitário

📌 Motivo:
Campos calculados podem gerar inconsistência histórica se a fórmula mudar.

🔹 Exceção importante à 3FN

📌 Documentos fiscais (Nota Fiscal)

✔ Devem armazenar:

Valores

Descrições

Totais
exatamente como emitidos, mesmo sendo redundantes.

⚠️ Isso não é erro de modelagem, é exigência legal.

🔹 Ajuste importante no modelo

O valor unitário do item deve existir:

No ITEM → valor atual

No COTACAO_ITEM → valor histórico

✔ Isso garante integridade das cotações antigas.

🔹 Preparando o modelo físico

Diferenças principais:

Entidade → Tabela

Atributo → Coluna

📌 Boas práticas:
✔ Padronizar nomes
✔ Usar NOT NULL para dados obrigatórios
✔ Nomear FKs claramente
✔ Definir tipos de dados corretamente

🎯 Conclusão

Não existe modelo perfeito, mas existem modelos bem feitos

Normalização é um guia, não uma regra cega

Aplicar 1FN, 2FN e 3FN em sequência garante:
✔ Menos redundância
✔ Mais desempenho
✔ Mais qualidade e manutenção

📌 Mensagem final:

Quanto mais você modela, melhor você fica.
A normalização vira algo natural com a prática.