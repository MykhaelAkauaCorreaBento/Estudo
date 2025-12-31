O artigo apresenta passo a passo a modelagem de um banco de dados tático para armazenar, organizar e analisar informações sobre empresas concorrentes, incluindo:

Produtos e serviços

Clientes

Funcionários

Fornecedores

Campanhas de marketing

Canais digitais

Notícias (clipagem)

Experiências de consumo

O modelo é genérico, adaptável e independente de tecnologia, podendo ser integrado a CRM, ERP e BI.

Por que informações da concorrência são importantes?

Em um mercado altamente competitivo, conhecer os concorrentes permite:

Ajustar estratégias de produtos e preços

Direcionar campanhas de marketing

Monitorar reputação da marca

Identificar oportunidades e fraquezas no mercado

Apoiar decisões estratégicas da gestão

📌 Ideia central:
Conhecer o concorrente é tão importante quanto conhecer o próprio negócio.

Inspiração conceitual (Sun Tzu)

A famosa ideia de “conhecer o inimigo” é aplicada ao contexto empresarial:

Concorrente = “adversário”

Informação = vantagem competitiva

Dados bem organizados = decisões melhores

Cuidados Éticos (Dica essencial)

⚠️ Coleta de dados da concorrência deve ser ética e legal

Usar apenas fontes públicas e lícitas

Evitar espionagem industrial

Respeitar privacidade e legislação

Este cuidado impacta diretamente o que pode ou não ser armazenado no banco de dados.

Visão Geral da Modelagem

Processo iterativo e incremental

Começa com entidades genéricas

Evolui com refinamentos sucessivos

Algumas entidades podem ser:

Removidas

Fundidas

Detalhadas posteriormente

📌 Ferramenta sugerida: MySQL Workbench

Entidades Iniciais do Modelo

(Levantamento inicial — Figura 1)

CONCORRENTES

CLIENTES

PRODUTOS

SERVICOS

FUNCIONARIOS

FORNECEDORES

LOCAIS

CAMPANHAS

CLIPAGENS

CANAIS DIGITAIS

EXPERIENCIAS

Essas entidades representam os principais pontos de coleta de dados estratégicos.

Entidade Principal: CONCORRENTES

(Figura 2)

Armazena dados gerais e métricas estratégicas das empresas concorrentes.

Principais atributos:

ID_CONCORRENTE (PK)

NOME

NOME_HOLDING

QTD_FUNCIONARIOS

LUCRO

EBITDA

FATURAMENTO

MARKET_SHARE (%)

EXPORTA (flag)

📌 Dica importante:
Os valores financeiros referem-se ao último ano fiscal.
O modelo pode ser expandido para histórico anual.

Produtos, Clientes e Compras

(Figura 3)

Entidades envolvidas:

CLIENTES

PRODUTOS

COMPRAS

ITENS_COMPRA

Características:

Relacionamento N:M

Considera apenas clientes relevantes

Nem todos os dados podem ser conhecidos → uso de NULL

📌 Observação importante:
O modelo assume que:

Só existem clientes se houve compra

Só existem produtos se foram vendidos

Funcionários, Fornecedores e Locais

(Figura 4)

FUNCIONARIOS

Apenas cargos estratégicos

Possui autorrelacionamento para hierarquia (organograma)

Inclui estimativa salarial (uso cuidadoso)

FORNECEDORES

Relacionamento direto com CONCORRENTES

Informações contratuais em texto livre

Não há ligação direta com PRODUTOS (modelo mais genérico)

LOCAIS

Lojas, escritórios, centros de distribuição etc.

Uso de atributo geográfico (POINT)

Permite análises territoriais e de alcance

📌 Dica estratégica:
Mapear locais ajuda a identificar regiões fortes ou fracas da concorrência.

Campanhas de Marketing e Clipagem

(Figura 5)

CAMPANHAS

Ligada diretamente a PRODUTOS

Permite analisar:

Tipo de mídia

Tipo de campanha

Período

Impacto

📌 Possibilita navegar:

CAMPANHAS → PRODUTOS → COMPRAS → CONCORRENTES

CLIPAGENS

Armazena notícias e menções na mídia

Ligada diretamente a CONCORRENTES (não a produtos)

Atributos comuns:

Veículo

Data

URL

Autor

Texto da matéria

Arquivos relacionados (imagem, vídeo, áudio)

Canais Digitais e Experiências

(Figura 6 – Diagrama Final)

CANAIS_COMUNICACAO

Redes sociais e plataformas digitais

Define a métrica de audiência (likes, seguidores etc.)

PERFIS

Liga CONCORRENTES aos CANAIS

Armazena:

URL do perfil

Métrica de audiência

Data da última postagem

📌 Indicador importante:
Mostra nível de engajamento digital da concorrência.

EXPERIENCIAS

Relatos de consumidores

Relacionada a:

CONCORRENTES

PRODUTOS

CANAIS_COMUNICACAO

Atributos:

Nome do consumidor

Relato

Experiência positiva ou negativa

Data

Contato

Diagrama Final

Integra todas as entidades

Representa:

Concorrentes

Mercado

Comunicação

Reputação

Disponibilizado em arquivo do MySQL Workbench para reuso

Conclusão

O modelo proposto:

Serve como base tática para inteligência competitiva

Pode ser adaptado para diferentes mercados

Apoia análises estratégicas e mercadológicas

Auxilia decisões sobre:

Posicionamento

Produtos

Marketing

Relacionamento com clientes

📌 Mensagem final:
A qualidade da análise depende diretamente da qualidade da modelagem e da coleta ética dos dados.