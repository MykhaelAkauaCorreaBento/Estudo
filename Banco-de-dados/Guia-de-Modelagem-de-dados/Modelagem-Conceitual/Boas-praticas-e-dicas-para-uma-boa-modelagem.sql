Mostrar que muitos problemas de retrabalho e desempenho em bancos de dados surgem por falhas na modelagem inicial.
O artigo apresenta boas práticas desde a coleta de requisitos até a implementação no SGBD, ajudando:

Arquitetos de Dados (modelagem)

DBAs (implementação e desempenho)

🧠 Importância da modelagem

O banco de dados é a alma da empresa.

Decisões estratégicas dependem da qualidade dos dados armazenados.

Uma modelagem mal feita gera:

Baixo desempenho

Dificuldade de manutenção

Muito retrabalho

👉 O sucesso da aplicação começa na modelagem.

📝 1. Coleta de requisitos (etapa mais crítica)
1.1 Quem entrevistar

É essencial entrevistar as pessoas certas, divididas por nível hierárquico:

Executivos → visão estratégica

Gerentes da área → métricas e expectativas

Analistas da área → operação e fluxo real

Gerentes/analistas de áreas relacionadas → integração entre setores

Cada grupo contribui com tipos diferentes de informação.

1.2 O que perguntar
Perguntas para executivos

Quais os objetivos da empresa?

Quais métricas medem eficiência?

Quais os maiores desafios?

Perguntas para gerentes

Objetivos do departamento

Métricas e relatórios

Limitações e uso das informações

Perguntas para analistas

Rotina de alimentação do sistema

Origem dos dados

Produtos e categorização

Relatórios gerados e destino das informações

⚠️ Importante:
Um sistema OLTP (transacional) tem requisitos diferentes de um sistema DSS / DW / OLAP.

🧩 2. Iniciando a modelagem conceitual
2.1 Definição das entidades

Técnica prática:

Separe os requisitos em frases

Identifique substantivos importantes

📌 Exemplo (CDs):

“Informações sobre autor, título, CDs, categoria e músicas”

Entidades identificadas:

CD

Música

Artista

👉 Evita redundância de dados.

2.2 Definição dos relacionamentos

Procure verbos nos requisitos.

Exemplos:

Artista grava Música

CD é composto por Músicas

Cardinalidade

Definida com base nas entrevistas:

Um CD → 1 artista

Uma música → pertence a 1 CD

Coletâneas → artista especial (“Coletânea”)

2.3 Definição dos atributos

Boas práticas:

❌ Não poluir o modelo com excesso de atributos

✔️ Avaliar se o atributo:

Pode ser obtido por relacionamento

É multivalorado (indício de nova entidade)

📌 Exemplo:

“Autor” → vem do relacionamento com Artista

“Músicas” → atributo multivalorado → vira entidade

✔️ Sempre definir um atributo identificador (chave primária).

🛠️ 3. Implementação no SGBD e desempenho

Mesmo um modelo correto pode ter problemas de performance.

🔑 Palavra-chave: Desempenho

📐 4. Normalização (conceito base)

Objetivo: eliminar redundâncias e inconsistências.

Formas Normais:

1FN, 2FN, 3FN

Boyce-Codd, 4FN, Domain-Key NF

Em geral, até a 3FN já resolve a maioria dos problemas.

⚠️ 5. Desnormalização (quando usar)

📌 Regra geral:

OLTP → bem normalizado

DSS / DW / OLAP → menos preocupação com normalização

Por que desnormalizar?

Melhorar desempenho

Evitar muitos JOINs em consultas frequentes

📌 Exemplo clássico:

Tabela Pessoa com:

Data de nascimento

Idade (calculável)

➡️ Idade é redundante, mas evita cálculo constante.

⚠️ Desnormalização:

Deve ser decisão consciente

Baseada em análise de acesso aos dados

Nunca regra geral

🧱 6. Visões Materializadas (Materialized Views)

Alternativa à desnormalização direta:

Mantém tabelas normalizadas

Executa consultas pesadas em segundo plano

Armazena resultados prontos

Melhor desempenho em relatórios

📌 Diferença:

View comum → executa consulta sempre

Materialized View → dados já armazenados

⚠️ Nem todo SGBD suporta → considerar na escolha da tecnologia.

✅ Conclusão

Não existe solução mágica.

A teoria é fundamental, mas a experiência prática faz diferença.

Boas práticas evitam:

Retrabalho

Problemas de desempenho

Decisões erradas de projeto

📌 Mensagem final:

Aprenda com livros, mas também com erros reais, experiências e trocas com outros profissionais.

📚 Referências principais

C.J. Date – Introdução a Sistemas de Bancos de Dados

Silberschatz, Korth e Sudarshan – Sistemas de Bancos de Dados

Harrington, Muller, Monteiro – Projetos de BD