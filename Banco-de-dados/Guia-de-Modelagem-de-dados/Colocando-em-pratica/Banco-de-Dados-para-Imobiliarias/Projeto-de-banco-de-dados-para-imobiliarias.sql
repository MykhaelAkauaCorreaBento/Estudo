O artigo apresenta a modelagem de um banco de dados para um sistema de controle administrativo de uma imobiliária, focado principalmente em locação de imóveis.
O modelo é genérico e adaptável, podendo ser usado em outros sistemas que envolvam imóveis, serviços, clientes e contratos.

📌 Importante:
O foco não é contábil, jurídico ou fiscal, mas sim administrativo e operacional.

Quando esse modelo é útil

Sistemas de imobiliárias;

Controle de locação de imóveis;

Gestão de clientes (proprietários e inquilinos);

Controle de contratos, aluguéis e serviços;

Base para integração com ERP ou CRM.

Entendimento do Cenário

A imobiliária:

Gerencia imóveis (casas, apartamentos, terrenos, galpões, etc.);

Intermedia a relação entre proprietários e inquilinos;

Controla contratos, aluguéis, pagamentos e multas;

Oferece serviços adicionais (manutenção, advocacia, reformas);

Mantém histórico do estado do imóvel antes e depois da locação.

📌 Dica de modelagem:
Nem toda informação usada em uma conversa com o cliente deve ser armazenada no banco.
Somente dados administrativos e persistentes devem entrar no modelo.

Levantamento Inicial das Entidades (Diagrama Conceitual)

📊 Figura 2 – Entidades iniciais

CLIENTES

IMOVEIS

LOCACAO

ALUGUEIS

PROFISSIONAIS

SERVICOS_IMOVEL

Essas entidades passam por refinamento, podendo ser:

Ajustadas;

Mescladas;

Eliminadas.

📌 Dica importante:
Modelagem é iterativa, não definitiva no primeiro desenho.

Entidade CLIENTES

Armazena tanto proprietários quanto inquilinos.

📊 Figura 3 – CLIENTES

Principais atributos:

ID_CLIENTE (PK);

Nome, CPF/CNPJ;

Endereço e contatos;

Observações gerais.

📌 Boa prática:
Não separar “proprietário” e “inquilino” em tabelas diferentes.
A função do cliente é definida pelos relacionamentos.

Entidade IMOVEIS (Entidade Central)

📊 Figura 4 – CLIENTES, IMOVEIS e TIPO_IMOVEL

A entidade IMOVEIS é o núcleo do sistema.

Principais atributos:

ID_IMOVEL (PK);

ID_PROPRIETARIO (FK → CLIENTES);

ID_TIPO_IMOVEL (FK → TIPO_IMOVEL);

Nome curto e chamativo do imóvel;

Endereço detalhado;

CEP, bairro, metragem;

Dormitórios, banheiros, vagas;

Valor sugerido de aluguel;

IPTU;

Caminho de fotos e vídeos;

Memorial descritivo;

Requisitos do inquilino;

Observações gerais.

📌 Dica:
Fotos, vídeos e documentos não devem ser armazenados diretamente no banco, mas sim o caminho para os arquivos.

Entidade TIPO_IMOVEL

Define o tipo do imóvel:

Casa

Apartamento

Galpão

Terreno

Loja etc.

Atributos:

ID_TIPO_IMOVEL (PK);

Descrição;

Flag indicando se gera aluguel.

📌 Facilita filtros e relatórios.

Entidade LOCACAO (Contrato)

📊 Figura 5 – LOCACAO e PROFISSIONAIS

Responsável por ligar:

Imóvel;

Inquilino;

Profissional jurídico (advogado).

Principais atributos:

ID_LOCACAO (PK);

ID_IMOVEL (FK);

ID_INQUILINO (FK);

ID_ADVOGADO (FK);

Valor do aluguel;

Periodicidade;

Percentual de multa;

Dia de vencimento;

Datas de início e fim;

Flag ativo;

Contrato (binário);

Modelo de recibo;

Caminho para fotos do estado do imóvel;

Observações.

📌 Boa prática:
Mesmo após o fim do contrato, o registro permanece para histórico.

Entidade PROFISSIONAIS

Cadastro de prestadores de serviço:

Advogado;

Eletricista;

Encanador;

Pintor;

Decorador etc.

Atributos:

ID_PROFISSIONAL (PK);

Nome;

Profissão;

Telefones;

Valor por hora;

Observações.

📌 Profissões poderiam ser outra tabela, mas não é necessário em pequenos sistemas.

Histórico do Cliente (Decisão Importante)

A entidade HISTORICO_CLIENTE foi descartada.

📌 Motivo:
O histórico pode ser obtido com consultas envolvendo:

CLIENTES

IMOVEIS

LOCACAO

👉 Evita redundância.

Entidade ALUGUEIS (Pagamentos)

📊 Pagamento do aluguel

Chave primária composta:

ID_LOCACAO

DATA_VENCIMENTO

Atributos:

Valor pago;

Data de pagamento;

Observações (atrasos, multas, reclamações).

📌 Boa prática:
Separar contrato de pagamentos.

Entidade SERVICOS_IMOVEL

📊 Figura 6 – Modelo final

Registra serviços feitos no imóvel:

Manutenção;

Reforma;

Instalações;

Limpeza.

Atributos:

ID_TRABALHO (PK);

ID_IMOVEL (FK);

ID_PROFISSIONAL (FK);

Data do serviço;

Valor total;

Nota fiscal (binário);

Observações.

📌 Serviço pode ocorrer mesmo sem locação ativa.

Modelo Final (Diagrama Geral)

📊 Figura 6 – Entidades finais

CLIENTES

TIPO_IMOVEL

IMOVEIS

LOCACAO

ALUGUEIS

PROFISSIONAIS

SERVICOS_IMOVEL

Esse diagrama representa todo o fluxo administrativo da imobiliária.

Exemplos de Código SQL (Ilustrativos)
Criação da tabela CLIENTES
CREATE TABLE clientes (
  id_cliente INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100),
  cpf VARCHAR(14),
  telefone VARCHAR(20),
  email VARCHAR(100),
  observacoes TEXT
);

Criação da tabela IMOVEIS
CREATE TABLE imoveis (
  id_imovel INT PRIMARY KEY AUTO_INCREMENT,
  id_proprietario INT,
  id_tipo_imovel INT,
  nome_imovel VARCHAR(150),
  endereco TEXT,
  metragem DECIMAL(10,2),
  valor_aluguel_sugerido DECIMAL(10,2),
  memorial_descritivo TEXT,
  FOREIGN KEY (id_proprietario) REFERENCES clientes(id_cliente),
  FOREIGN KEY (id_tipo_imovel) REFERENCES tipo_imovel(id_tipo_imovel)
);

Criação da tabela LOCACAO
CREATE TABLE locacao (
  id_locacao INT PRIMARY KEY AUTO_INCREMENT,
  id_imovel INT,
  id_inquilino INT,
  valor_aluguel DECIMAL(10,2),
  data_inicio DATE,
  data_fim DATE,
  ativo BOOLEAN,
  FOREIGN KEY (id_imovel) REFERENCES imoveis(id_imovel),
  FOREIGN KEY (id_inquilino) REFERENCES clientes(id_cliente)
);

Conclusão

O artigo demonstra:

Como identificar entidades relevantes;

Como refinar o modelo;

Como evitar redundância;

Como estruturar um banco coerente com o negócio.

📌 Lição principal:
Um bom projeto de banco de dados nasce do entendimento do negócio, não da ferramenta.