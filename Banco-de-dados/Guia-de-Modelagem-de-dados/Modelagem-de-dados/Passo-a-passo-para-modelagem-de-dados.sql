Conceitos fundamentais e boas práticas de modelagem de dados, mostrando como planejar corretamente um banco de dados para garantir:

Boa performance

Facilidade de manutenção e integração

Redução de erros futuros

Documentação clara

A modelagem é recomendada para qualquer tipo de aplicação, simples ou complexa.

Por que a modelagem de dados é importante?

Evita retrabalho e sistemas difíceis de manter

Reduz erros causados por mudanças (ex: legislação)

Facilita integração com outros sistemas

Garante dados consistentes e confiáveis

Muitas empresas gastam mais com manutenção do que com desenvolvimento por não modelarem corretamente no início.

Boas práticas iniciais

Usar melhores práticas desde o começo, mesmo que o trabalho não seja “visível” para o cliente

Pensar sempre em crescimento futuro e integrações

Documentar tudo: tabelas, campos, decisões e fontes

Desenvolvimento por módulos

Trabalhar por módulos traz várias vantagens:

Entrega parcial mais rápida ao cliente

Manutenção localizada (um módulo não quebra o sistema todo)

Menos risco de projetos abandonados

📌 Exemplo real: o problema do Bug do Ano 2000 teria sido muito mais simples se os sistemas fossem modulares e bem documentados.

Definição de escopo

Antes de modelar, é essencial definir:

O que faz parte do projeto

O que fica fora (por enquanto)

Exemplo (mercearia/mercado):

Dentro do escopo inicial:

Cadastro de produtos

Fornecedores

Entrada de mercadorias

Controle de estoque

Fora do escopo inicial:

Folha de pagamento (RH)

Contas a pagar/receber (ficam para outra fase)

💡 Dica: Use brainstorming sem preconceitos, depois filtre o que realmente importa.

Levantamento de informações

Antes de criar tabelas:

Observe o ambiente real (ex: estoque do cliente)

Anote tudo, mesmo o que parecer irrelevante:

Nome do produto

Validade

Tipo de embalagem

Peso, volume

Fabricante, fornecedor

📌 Importante: nesta fase, não existe informação inútil.

Normalização

Normalização significa:

Eliminar redundâncias

Evitar inconsistências

Garantir integridade dos dados

Exemplos de boas práticas:

Usar nomes claros de tabelas e colunas

Evitar campos genéricos como A1, campo1

Criar tabelas auxiliares para valores repetidos

❌ Exemplo ruim:

Produto com unidade escrita como Litro, LITRO, litor

✅ Solução:

Tabela Unidade de Medida com valores padronizados

Etapas da modelagem
1️⃣ Primeira etapa – Agrupamento de informações

Agrupar dados por tipo e proximidade

Ainda sem definir nomes técnicos, tipos ou tamanhos

Foco em entender o negócio

📌 Exemplo:

Produtos como arroz, feijão, lentilha

Definir se o controle será por:

Tipo de produto

Tipo de embalagem

Peso / unidade

2️⃣ Segunda etapa – Separação lógica

Separar informações em possíveis tabelas

Evitar redundância

Não se preocupar ainda com PK, FK ou tipos de dados

💡 Dica: cuidado com desnormalização — só deve ser usada por quem tem muita experiência.

3️⃣ Terceira etapa – Estruturação

Agora sim:

Definir nomes claros de tabelas e colunas

Definir tipos e tamanhos dos dados

Definir chaves primárias (PK) e estrangeiras (FK)

Exemplo prático: cadastro de produtos

Tabela principal: Produto

Campos essenciais:

Código do produto (ex: código de barras)

Nome do produto

Tipo de embalagem (envase)

Unidade de medida

Quantidade

Valor de compra

Valor de venda

Quantidade em estoque

Tabelas auxiliares:

Unidade de Medida (kg, g, litro, ml…)

Tipo de Envase (lata, saco, garrafa…)

Pacote / Kit

Produto x Pacote (tabela de ligação)

📌 Exemplo:

Shampoo + Condicionador vendidos como kit

O kit não é um novo produto, mas uma promoção

Boas práticas de nomenclatura

Usar nomes no singular

Manter padrão:

id_ para identificadores

cod_ para códigos

num_ para números

❌ Evitar:

cod_cliente, cod_cli, cliente, num_cliente misturados

Análise final

Uma boa modelagem:

Facilita manutenção e integração

Evita refatorações caras no futuro

Reduz erros humanos no cadastro

Torna o sistema mais claro e confiável

🧼 Refatoração deve ser exceção, não regra.

Conclusão

Modelar bem é investir no sucesso do sistema

Simplicidade é essencial

Modelagem excessivamente complexa dificulta uso e manutenção

📌 Mensagem final:

“A simplicidade é a ordem do dia.”

Nota:
Scrum (https://www.scrum.org/)
Código de Barras (https://learn.microsoft.com/pt-br/previous-versions/technical-articles/cc580676(v=msdn.10))