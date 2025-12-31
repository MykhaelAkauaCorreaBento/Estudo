O artigo demonstra, passo a passo, como:

Entender um cenário real de negócio (manutenção veicular)

Identificar entidades e relacionamentos

Construir o modelo conceitual

Derivar para o modelo lógico

Gerar o modelo físico (SQL)

📌 O foco é mostrar como conceitos de negócio viram tabelas de banco de dados.

Contexto do problema

Usuários dominam o negócio, mas nem sempre conseguem expressar tudo de forma sistêmica.
Cabe ao projetista de dados:

Interpretar o negócio

Identificar entidades

Definir relacionamentos

Validar o entendimento com os usuários

O exemplo escolhido é o controle de manutenções de veículos, aplicável a:

Pessoas físicas

Oficinas

Frotas

Locadoras

Transportadoras

Situação inicial (planilhas)

Normalmente os dados já existem em planilhas:

Não normalizadas

Com redundâncias

Com valores calculáveis repetidos

📊 Figura 1: planilha com dados de manutenção
👉 Serve apenas como ponto de partida, não como modelo final.

Abordagem de Modelagem
Conceito principal

O modelo não começa pelos atributos, mas sim pelas entidades e seus relacionamentos.

📌 A partir do modelo conceitual:

Deriva-se o modelo lógico

Depois o modelo físico

Tipos de Modelos de Dados (Nota DevMan 1)
🔹 Modelo Conceitual

Visão do usuário

Entidades e relacionamentos

Fácil validação

Representado por DER

🔹 Modelo Lógico

Tabelas

Atributos

Chaves

Tipos de dados

🔹 Modelo Físico

Implementação no SGBD

Scripts SQL

Considera limitações técnicas

Ferramentas Utilizadas

brModelo (CASE)

Gratuito

Gera modelos conceitual, lógico e físico

Exporta SQL ANSI-2003

SQL Server 2008 Express

Gratuito

Limites de CPU, memória e tamanho

Suficiente para o exemplo

Entidades Principais do Sistema
Entidade central

VEÍCULO

A partir dela, controla-se:

Histórico de manutenções

Oficina

Peças

Produtos

Serviços

Relacionamento Veículo × Manutenção

📊 Figura 2

Um Veículo pode ter várias Manutenções

Cada Manutenção pertence a um único Veículo

👉 Relacionamento 1 : N

Manutenção como entidade central

A entidade MANUTENÇÃO centraliza:

Serviços (mão de obra)

Peças

Produtos

📌 Uma mesma manutenção pode envolver:

Serviço + Peça + Produto

Valores individuais que compõem o total

Generalização / Especialização (opcional)

📊 Figura 3

Possibilidade teórica:

Criar uma entidade genérica (Item de Manutenção)

Especializar em Serviço, Peça e Produto

📌 Técnicas:

Generalização (bottom-up): atributos comuns sobem

Especialização (top-down): entidade se divide

👉 O autor optou por não usar, mantendo entidades separadas
📊 Figura 4

✔️ Ambas as abordagens funcionam se bem aplicadas.

Cardinalidade: 1..N × 0..N

Importante definir:

Obrigatoriedade

Opcionalidade

📌 Exemplo:

Uma manutenção pode ou deve ter serviços?

Isso documenta melhor o negócio

Relacionamentos N : N

Exemplo clássico:

MANUTENÇÃO ↔ SERVIÇO

📊 Figura 5 (conceitual)
📊 Figura 6 (lógico)

👉 Um relacionamento N:N gera:

Tabela associativa

Chaves estrangeiras

Possível atributo extra (ex.: valor cobrado)

Fabricantes, Peças e Produtos

📊 Figura 7

Um Fabricante pode produzir vários produtos/peças

Um Produto/Peça pode ter vários fabricantes

👉 Relacionamento N : N
👉 Geração de tabelas associativas:

FABRICANTE_PRODUTO

FABRICANTE_PECA

Manutenção + Fabricante

Problema resolvido:

A manutenção precisa saber qual peça/produto e de qual fabricante

Solução:

Associar a manutenção às entidades associativas

Ajustar manualmente o modelo lógico

📊 Figuras 8 e 9

Montadora, Loja e Oficina

📊 Figura 10

Regras:

Veículo pertence a um modelo

Modelo pertence a uma montadora

Oficina pode ou não pertencer à montadora

Loja pode ou não ser concessionária

Decisões importantes do modelo final

🔑 Chaves auto incrementadas

🚗 VEÍCULO usa RENAVAM como chave primária

💡 Venda do veículo não foi detalhada (sugestão de exercício)

Resultado Final

📊 Figura 11: Modelo Conceitual completo

📊 Figura 12: Modelo Lógico completo

📊 Figura 13: Modelo Físico no SQL Server

Script SQL (Modelo Físico)

📌 O script:

Cria tabelas

Define chaves primárias

Define chaves estrangeiras

Implementa tabelas associativas

Exemplo representativo:

CREATE TABLE MANUTENCAO (
  ID_MANUTENCAO INT IDENTITY PRIMARY KEY,
  DS_MANUTENCAO VARCHAR(50),
  DT_DATA DATETIME,
  ID_OFICINA SMALLINT,
  ID_RENAVAM INT,
  FOREIGN KEY(ID_OFICINA) REFERENCES OFICINA(ID_OFICINA),
  FOREIGN KEY(ID_RENAVAM) REFERENCES VEICULO(ID_RENAVAM)
);


👉 O código reflete diretamente o modelo conceitual validado.

Conclusão

Modelagem de dados é crítica

Erros nesta fase geram:

Manutenção difícil

Sistemas inconsistentes

O modelo conceitual é a ponte entre negócio e tecnologia

🎯 O artigo mostra que:

Entender o negócio → modelar conceitos → gerar banco de dados confiável