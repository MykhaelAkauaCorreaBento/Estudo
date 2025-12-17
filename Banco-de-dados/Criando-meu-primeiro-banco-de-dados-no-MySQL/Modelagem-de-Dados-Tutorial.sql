Modelagem de Dados — Resumo Prático
O que é modelagem de dados?

Modelagem de dados é o processo de organizar, estruturar e representar dados de um sistema antes da implementação do banco de dados.
Ela ajuda a entender o domínio do negócio, reduzir erros, evitar retrabalho e melhorar a comunicação entre desenvolvedores e DBAs.

👉 É semelhante à modelagem de classes, mas foca apenas nos dados, não no comportamento.

Exemplo:

Entidades: Cliente, Venda, Endereço

Atributos: nome, CPF, data, valor

Relacionamentos: cliente faz venda, cliente mora em endereço

Tipos de modelos de dados
1️⃣ Modelo Conceitual

Visão simples e de alto nível

Usado para entender o negócio

Muito comum no início do projeto

📌 Exemplo:
Cliente — Endereço — Venda

💡 Dica: ótimo para conversar com usuários e stakeholders.

2️⃣ Modelo Lógico de Dados (MLD)

Detalha entidades, atributos e relacionamentos

Independente de banco de dados

Muito usado em projetos tradicionais

📌 Exemplo:
Entidade Cliente com atributos nome, sobrenome, cpf

💡 Dica: não costuma agregar muito valor em projetos ágeis orientados a objetos.

3️⃣ Modelo Físico de Dados (MFD)

Representa tabelas, colunas, tipos de dados e chaves

Reflete como o banco será implementado

Muito importante em projetos ágeis e tradicionais

📌 Exemplo:

CLIENTE (
  CLI_ID INT,
  CLI_NOME VARCHAR(50),
  CLI_CPF CHAR(11)
)


💡 Dica: siga sempre os padrões de nomenclatura da empresa.

Notações de modelagem mais comuns
Notação	Características
EI	Simples, fácil de ler, não detalha atributos
Barker	Muito usada, completa, pode ficar complexa
IDEF1X	Complexa e pouco usada atualmente
UML	Não é oficial para dados, mas bastante aplicada

💡 Dica: Barker e UML são as mais encontradas no mercado.

Etapas fundamentais da modelagem de dados
1️⃣ Identificar entidades

Entidades representam conceitos do mundo real.

📌 Exemplos:

Cliente

Produto

Venda

💡 Dica: entidades devem ser coesas (um conceito bem definido).

2️⃣ Identificar atributos

São as informações da entidade.

📌 Exemplo:

Cliente → nome, sobrenome, CPF

💡 Dica importante: definir bem o nível de detalhe evita retrabalho.

3️⃣ Aplicar convenções de nomes

Lógico: fácil de ler (Cliente, Endereço)

Físico: técnico e padronizado (CLI_NOME, END_ID)

💡 Dica: modelagem padronizada = manutenção mais fácil.

4️⃣ Identificar relacionamentos

Define como as entidades se conectam.

📌 Exemplo:

Cliente faz Venda

Cliente possui Endereço

Inclui:

Cardinalidade (1, N)

Opcionalidade (obrigatório ou não)

💡 Dica: pense sempre nos dois lados do relacionamento.

5️⃣ Associar chaves

Existem dois tipos principais:

🔑 Chave natural: vem do negócio (CPF, matrícula)

🔑 Chave substituta: criada artificialmente (ID)

💡 Dica: não existe escolha perfeita — use o bom senso.

6️⃣ Normalização (reduzir redundância)
Forma Normal	Regra
1NF	Sem grupos repetidos
2NF	Dependência total da chave
3NF	Dependência direta da chave

✔ Vantagem: dados consistentes
❌ Desvantagem: pode impactar desempenho

7️⃣ Desnormalização (diversificar)

Aplicada somente quando há problemas de desempenho

Duplica dados para melhorar acesso

💡 Dica: normalize primeiro, desnormalize só se necessário.

Modelagem de dados ágil

Feita de forma incremental

Colaborativa

Evolui conforme o sistema cresce

💡 Melhor forma de aprender:

Praticar

Trabalhar próximo de DBAs

Estudar modelos reais

Ler constantemente sobre o tema

Conclusão

A modelagem de dados:

É essencial para qualquer sistema

Melhora qualidade, desempenho e manutenção

Não exige ser especialista, mas exige entendimento básico sólido

📌 Resumo final:

Modelar dados é pensar antes de construir — e isso economiza tempo, dinheiro e problemas no futuro.