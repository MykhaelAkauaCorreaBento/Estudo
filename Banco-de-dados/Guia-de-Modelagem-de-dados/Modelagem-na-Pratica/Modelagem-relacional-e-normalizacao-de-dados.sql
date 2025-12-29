Modelagem Relacional e Normalização de Dados – Resumo Prático
🎯 Objetivo do artigo

Mostrar como aplicar normalização na prática, usando um caso real (planilha de um corretor de imóveis), explicando:

Conceitos do modelo relacional

Formas Normais (1FN, 2FN, 3FN)

Vantagens da normalização em consistência, armazenamento e desempenho

Quando e como desnormalizar sem perder qualidade

🔹 Origem do Modelo Relacional

O modelo relacional foi proposto por Edgar F. Codd (1970), baseado em teoria dos conjuntos, em um contexto de:

Pouco armazenamento

Hardware caro

Modelos não relacionais (hierárquicos)

Ele definiu:

O conceito de relação

As formas normais

Regras para evitar problemas causados pelo crescimento dos dados

Essas ideias são a base dos bancos de dados atuais.

🔹 Regras do Mundo Real (Suposições Semânticas)

Antes de qualquer tabela, o modelo nasce das regras do negócio, por exemplo:

Um cliente pode alugar vários imóveis

Existem vários tipos de imóveis (casa, apartamento, flat…)

Clientes são pessoas físicas

CPF e telefone são obrigatórios

📌 Dica importante:
Essas regras não podem ser automatizadas por ferramentas — dependem do entendimento do analista.

🔹 Conceitos Fundamentais

Relação → futura tabela

Tupla → futura linha

Atributo → futura coluna

Domínio → tipo/valores possíveis

Chave primária (PK) → identifica unicamente uma tupla

Chave estrangeira (FK) → cria relacionamento entre relações

📌 Exemplo:
Assim como o chassi identifica um carro, uma chave primária identifica uma entidade no banco.

🔹 Problema da Planilha

A planilha do corretor:

Mistura dados de cliente, imóvel e operação

Possui valores repetidos e inconsistentes

Dificulta buscas e atualizações

Gera ambiguidades (“Av.” x “Avenida”)

📌 Esse tipo de problema motivou a criação da normalização.

🔹 Primeira Forma Normal (1FN)

Regra: todos os valores devem ser atômicos (indivisíveis).

❌ Problema: telefones múltiplos na mesma linha
✔ Solução: criar uma relação separada para telefones

📌 Dica:
Não use “Telefone 1”, “Telefone 2” — isso não existe no mundo real e quebra o modelo.

🔹 Segunda Forma Normal (2FN)

Regra:

Estar na 1FN

Todo atributo não-chave deve depender de toda a chave

❌ Problema: dados do cliente dependiam apenas do CPF
✔ Solução: separar em relações:

Cliente

Telefone do Cliente

Operação Imobiliária

📌 Conceito-chave: Dependência Funcional

🔹 Chaves Substitutas

Na prática, usa-se IDs artificiais (ex: CódigoCliente, CódigoOperação) porque:

Nem sempre existe chave natural confiável

CPF, RG ou passaporte podem não existir para todos

📌 Dica:
A chave substituta é o “chassi” da tupla no banco.

🔹 Terceira Forma Normal (3FN)

Regra:

Estar na 2FN

Nenhum atributo pode depender de outro atributo não-chave

❌ Problema: bairro dependia do endereço, não da operação
✔ Solução: separar em:

Endereço

Imóvel

Operação Imobiliária

📌 Resultado:
Cada relação descreve uma única coisa.

🔹 Até onde normalizar?

Existem outras formas (BCNF, 4FN, 5FN…), mas:

3FN é suficiente na maioria dos sistemas

Já garante consistência e elimina redundância

🔹 Vantagens da Normalização

✔ Uma única versão da verdade
✔ Menos espaço em disco
✔ Melhor desempenho de I/O
✔ Evita anomalias de:

Inserção

Atualização

Remoção

📌 Exemplo de anomalia:
Apagar um cliente e perder dados do imóvel por erro de modelagem.

🔹 Entidades Domínio

São tabelas pequenas para valores controlados, como:

Tipo de imóvel (Casa, Apartamento, Flat)

✔ Evitam variações (“ap.”, “apto.”)
✔ Garantem consistência

🔹 Desnormalização

Usada quando:

Muitos JOINs prejudicam o desempenho

Tabelas têm milhões de registros

✔ Consiste em introduzir redundância controlada
✔ Deve partir de um modelo já normalizado

⚠️ Atenção:

A consistência passa a ser responsabilidade do desenvolvedor

🔹 Três Regras de Ouro do Modelo Físico

1️⃣ Indexe PKs e FKs
Evita FULL SCAN e melhora JOINs

2️⃣ Mantenha tabelas domínio em memória
São pequenas e muito usadas

3️⃣ Use Views Materializadas
Garante desempenho sem perder consistência

🎯 Conclusão

A normalização traduz as regras do mundo real em dados consistentes

Um modelo em 3FN é considerado plenamente normalizado

Desempenho pode ser ajustado com índices, memória, views e desnormalização

O equilíbrio entre teoria e prática é o que garante um bom banco de dados