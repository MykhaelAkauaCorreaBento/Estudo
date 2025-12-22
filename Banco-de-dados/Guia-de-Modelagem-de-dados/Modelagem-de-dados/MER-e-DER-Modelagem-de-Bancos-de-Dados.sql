Resumo O que é MER (Modelo Entidade-Relacionamento)

O que é DER (Diagrama Entidade-Relacionamento)

Como eles são usados na modelagem de bancos de dados

Boas práticas, erros comuns e um exemplo prático completo

Esses conceitos são fundamentais na fase inicial de um sistema, logo após o levantamento de requisitos.

O que é MER (Modelo Entidade-Relacionamento)

O MER é um modelo conceitual, ou seja:

Não depende de banco de dados específico

Serve para entender o domínio do negócio

Define:

Entidades (objetos do sistema)

Atributos (características)

Relacionamentos (como interagem)

📌 Nem sempre o MER representa o sistema inteiro. Em sistemas grandes (ex: ERP), é comum criar modelos por módulo.

Entidades

Entidades representam os objetos do domínio e são nomeadas com substantivos.

Tipos de entidades

1️⃣ Entidades físicas

Existem no mundo real

Ex: Cliente, Produto, Livro

2️⃣ Entidades lógicas

Surgem de interações

Ex: Venda, Empréstimo, Classificação

Classificação quanto à existência

Entidades fortes: existem sozinhas

Ex: Produto

Entidades fracas: dependem de outras

Ex: Venda (não existe sem produto)

Entidades associativas: representam um relacionamento que precisa virar entidade

Ex: Item da Venda (Produto x Venda)

📌 Exemplo importante:
Produto ↔ Venda (N:N)
→ Cria-se a entidade associativa Item_Venda, onde ficam quantidade, preço, etc.

Relacionamentos

Indicam como as entidades interagem e são nomeados com verbos.

Tipos de relacionamento

1:1 (um para um)

Usuário ↔ Currículo

1:N (um para muitos)

Usuário ↔ Dependente

N:N (muitos para muitos)

Autor ↔ Livro

📌 Relacionamentos N:N não existem diretamente no banco relacional → viram entidade associativa.

Atributos

São as características das entidades.

Classificação por função

Descritivos: nome, cor

Nominativos: identificam (nome, código)

Referenciais: ligam entidades (FK)

Classificação por estrutura

Simples: nome, peso

Compostos: endereço (rua, número, CEP)

Chaves

Chave Primária (PK): identifica unicamente a entidade

Ex: CPF do cliente

Chave Estrangeira (FK): referencia outra entidade

Ex: CPF do cliente dentro de Venda

O que é DER (Diagrama Entidade-Relacionamento)

O DER é a representação gráfica do MER.

Funções do DER:

Facilitar visualização

Melhorar comunicação entre analistas e desenvolvedores

Reduzir erros de entendimento

Notações

Notação original (Chen):

Entidades: retângulos

Atributos: elipses

Relacionamentos: losangos

Notação moderna (UML):

Atributos dentro das entidades

Diagrama mais limpo e legível

Cardinalidade

Define quantos elementos participam do relacionamento.

Exemplo de leitura:

Um grupo possui 0 ou muitos produtos

Uma venda contém 1 ou muitos produtos

Um produto pode aparecer em 0 ou várias vendas

Ferramentas CASE

Ferramentas que auxiliam na modelagem:

StarUML

Astah

ERwin

IDEs e SGBDs (Visual Studio, SQL Server Management Studio)

📌 Algumas geram automaticamente o SQL do banco.

Exemplo prático: Sistema de Biblioteca
Entidades identificadas

Usuário (forte)

Livro (forte)

Sessão (forte)

Empréstimo (fraca)

Livro_Empréstimo (associativa)

Relacionamentos

Usuário faz vários empréstimos

Empréstimo contém vários livros

Livro pertence a uma sessão

📌 O relacionamento N:N entre Livro e Empréstimo vira a entidade associativa Livro_Empréstimo.

Erros comuns na modelagem MER/DER

Confundir entidade com atributo (Endereço deveria ser entidade)

Não definir chave primária

Criar relacionamento N:N direto

Cardinalidade mal definida

Ignorar regras de negócio

Usar atributos multivalorados sem cuidado

Não normalizar ou normalizar demais

Boas práticas

Entender bem o domínio

Começar simples

Usar DER para visualizar

Definir PKs claras

Sempre usar entidade associativa em N:N

Documentar regras de negócio

Revisar com a equipe

Equilibrar normalização e desempenho

Usar ferramentas de modelagem

Planejar evolução futura

Uso de IA na modelagem MER/DER

A IA pode ajudar em:

Criar diagramas a partir de texto

Sugerir entidades, atributos e relacionamentos

Revisar e validar modelos

Converter MER em modelo relacional

Gerar documentação automática

📌 Exemplo: descrever o sistema em texto e receber um modelo inicial pronto.

Conclusão

MER ajuda a entender o negócio

DER ajuda a visualizar e comunicar

Uma boa modelagem:

Evita retrabalho

Reduz erros

Facilita manutenção e evolução

💡 Mensagem final:

“Modelar bem no início é economizar tempo e problemas no futuro.”