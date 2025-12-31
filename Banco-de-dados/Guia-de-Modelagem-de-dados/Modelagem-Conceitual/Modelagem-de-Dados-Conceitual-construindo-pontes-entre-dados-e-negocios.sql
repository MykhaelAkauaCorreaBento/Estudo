O artigo mostra como a modelagem de dados conceitual ajuda a criar uma ponte entre dados e negócios, permitindo:

Melhor compreensão dos requisitos de negócio

Comunicação clara entre TI e áreas de negócio

Alinhamento entre processos, sistemas e informações

Apoio a projetos de TI, mesmo quando não há banco de dados envolvido

📌 Modelos conceituais são artefatos centrais da Arquitetura de Dados.

O que são Modelos de Dados

Modelos de dados são representações gráficas dos requisitos de informação de:

Uma empresa

Uma área de negócio

Um sistema de informação

Um projeto de TI

Eles complementam os modelos de processos, trazendo a visão dos dados.

📌 Importante:

Artefatos de dados são mais estáveis que processos, mas também evoluem.

Um modelo não é só o diagrama, mas também a documentação associada.

Componentes básicos

Todo modelo de dados é composto por:

Entidades

Atributos

Relacionamentos

Camadas da Modelagem de Dados

(Figura 1)

A modelagem deve seguir uma abordagem de detalhamento sucessivo, com três níveis:

1️⃣ Modelo Conceitual

Visão de alto nível

Representa conceitos de negócio

Foco: o que a empresa precisa em termos de informação

Público-alvo: negócio + TI

2️⃣ Modelo Lógico

Detalha entidades em atributos atômicos

Aplica normalização

Ainda independente de tecnologia

Serve de base para o modelo físico

3️⃣ Modelo Físico

Representa o banco de dados real

Inclui tabelas, colunas, constraints, índices, partições

Foco em performance e implementação

📌 O artigo trata apenas do modelo conceitual.

Por que modelar conceitos?

Modelos conceituais ajudam a responder perguntas estratégicas como:

Quais são os principais conceitos de negócio?

Quantos sistemas usam dados de CLIENTE?

Quantos projetos dependem de PEDIDO?

Se um conceito mudar, quais sistemas serão impactados?

Onde implementar um novo conceito de negócio?

Perspectivas de Modelagem

A modelagem pode ser feita sob diferentes perspectivas:

Corporativa

Área de negócio

Projeto

Sistema

📊 Figura 2 mostra como conceitos corporativos (C), projetos (P) e sistemas (S) se intersectam, permitindo análises como:

Conceitos usados por vários sistemas

Conceitos ainda não sistematizados

Risco de duplicação de conceitos

Objetos Conceituais
Entidades

Representam conceitos de negócio

Usam substantivos (CLIENTE, PRODUTO)

Não devem representar processos (ex.: PRODUÇÃO ❌)

Relacionamentos

Representam associações entre conceitos

Nomeados com verbos

Preferencialmente direcionais

Não representam regras de negócio, mas relações conceituais

Atributos

Opcionais em modelos conceituais

Usados apenas para esclarecer um detalhe importante

Não há:

Chaves primárias

Migração de atributos

Integridade referencial

📌 O foco é integridade conceitual, não técnica.

Definições Reais × Definições Nominais

(BOX 1)

Definição nominal: explica apenas o significado da palavra

Definição real: explica o conceito no contexto do negócio

📌 Exemplo:

❌ “Produto é um bem produzido pela empresa”

✅ “Produto é um bem produzido e comercializado pela empresa, excluindo serviços”

👉 Sempre usar definições reais, com sinônimos e exemplos.

Exemplo de Modelo Conceitual

(Figura 3)

Mostra:

Entidades

Relacionamentos

Alguns atributos para clareza (ex.: tipo de cliente, código de barras)

📌 Boas práticas:

Poucas entidades

Preferencialmente uma página

Visão geral, sem excesso de detalhes

Tipos de Modelos Conceituais
VHDM — Very High-level Data Model

Altíssimo nível de abstração

Poucos conceitos

Representa áreas de assunto

Usado em modelos corporativos

Contém apenas entidades e relacionamentos

HDM — High-level Data Model

Mais detalhado que o VHDM

Representa conceitos-chave de um contexto específico

Pode incluir atributos

Usado em projetos e sistemas

Não deve misturar níveis de abstração

Ferramentas de Modelagem

(BOX 2)

Ferramentas CASE ajudam a:

Criar diagramas

Documentar conceitos

Compartilhar modelos

Integrar modelos conceituais, lógicos e físicos

📌 Mesmo ferramentas voltadas a modelos lógicos podem ser usadas para modelos conceituais
(Figura 4).

Quem deve manter os modelos?

📌 Arquitetura de Dados, pois:

Integra modelos conceituais, lógicos e físicos

Garante padronização

Alinha dados, processos e sistemas

Abordagens para Capturar Conceitos

(Figura 5)

🔼 Top-down (Plano A)

Entrevistas com especialistas do negócio

Análise de processos, políticas e glossários

Visão estratégica e corporativa

📌 Cuidado com:

Redundâncias

Silos departamentais

🔽 Bottom-up (Plano C)

Parte dos sistemas existentes

Análise de bancos de dados e documentos técnicos

Engenharia reversa

⚠️ Mais arriscada:

Conceitos tecnológicos

Nomes diferentes para o mesmo conceito

🔄 Middle-up-and-down (Plano B)

Abordagem híbrida

Combina entrevistas + análise de sistemas

Mais comum na prática

📌 Exige atenção a conflitos entre visões.

Por que criar modelos conceituais?
Para sistemas de informação

Alinhar TI e negócio

Identificar conceitos compartilhados

Guiar modelos lógicos e físicos

Integrar pacotes de software ao negócio

Para projetos (mesmo sem BD)

Identificar conceitos envolvidos

Antecipar impactos em outros sistemas

Estimular alinhamento entre equipes

Registrar novos conceitos para uso futuro

📌 Ao final do projeto, o modelo deve ser estabilizado e arquivado.

Modelo Conceitual Corporativo

(Figura 6)

Benefícios:

Alinha estratégia de negócio e TI

Harmoniza conceitos entre sistemas

Integra dados e processos

Apoia integração entre sistemas

Avalia aderência de ERPs e soluções externas

📌 Pode ser criado:

Do zero

A partir de modelos de referência de mercado

Conclusão

Sem modelos conceituais:

A visão de dados fica fragmentada

O foco excessivo em tecnologia distorce o negócio

Com modelos conceituais:

Dados ganham significado

Conceitos são reutilizados

A informação gera mais valor

TI se alinha melhor ao negócio

🎯 Mensagem final:
A modelagem de dados conceitual é a base para compreender, organizar e maximizar o valor dos dados de uma empresa.