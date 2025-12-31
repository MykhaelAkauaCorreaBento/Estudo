O artigo apresenta os fundamentos de modelagem de banco de dados relacional aplicados a um sistema de e-commerce, indo do conceito teórico até a implementação prática no MySQL, utilizando SQL ANSI e o MySQL Workbench. O foco é criar um modelo escalável, normalizado e performático, semelhante ao usado por grandes plataformas de comércio eletrônico.

Modelagem de Dados
Tipos de Modelagem

Modelagem Conceitual

Visão abstrata do negócio.

Não considera detalhes técnicos.

Usa descrições textuais ou DER simplificado.

Exemplo:

Clientes (ID, Nome, CPF, Email, ...)


Modelagem Lógica

Define entidades, relacionamentos, chaves primárias e estrangeiras.

Representada graficamente (DER completo).

Modelagem Física

Implementação no SGBD.

Define tipos de dados, constraints, índices e engine.

Resultado final: tabelas reais no banco.

Modelo Entidade-Relacionamento (MER)

Entidades → tabelas

Relacionamentos → chaves estrangeiras

Atributos → campos

Graus de relacionamento

Unário (1): entidade se relaciona consigo mesma (ex.: categoria pai).

Binário (2): relacionamento entre duas entidades (mais comum).

Ternário (3): três entidades relacionadas (ex.: pedido envolvendo cliente, produto e pagamento).

Chaves
Chave Primária (PK)

Identificação única.

Preferencialmente numérica.

Nunca nula.

Boa prática: AUTO_INCREMENT.

Chave Estrangeira (FK)

Referencia a PK de outra tabela.

Mesmo tipo da PK referenciada.

Evitar VARCHAR como chave (impacta performance).

Dica importante:
Nunca usar CPF formatado como chave primária. Use um identificador numérico interno.

Cardinalidade

1:1 → um registro para um.

1:N → um registro relacionado a vários.

N:N → exige tabela associativa.

Exemplo:

Categoria → Produto = 1:N

Produto ↔ Categoria = N:N (com tabela intermediária)

Normalização (Formas Normais)
1ª Forma Normal (1FN)

Chave primária.

Campos atômicos (sem listas ou campos compostos).

2ª Forma Normal (2FN)

Atende à 1FN.

Remove dependências parciais.

Exemplo: separar Marca de Produto.

3ª Forma Normal (3FN)

Atende à 2FN.

Remove dependências transitivas.

Exemplo: não armazenar valor_total se ele é calculável.

Conversão MER → Modelo Relacional

Regras principais:

Cada entidade vira uma tabela.

Relacionamentos 1:N usam FK.

Relacionamentos N:N geram tabela intermediária.

Relacionamentos ternários geram novas tabelas.

Autorelacionamentos N:N também geram tabelas.

Especializações podem virar uma ou várias tabelas.

Estudo de Caso: E-commerce
Entidades principais

Cliente

Pedido

Pedido_Item

Entrega

Produto

SKU

Categoria

Tracking

Tipo_Pagto

Endereço

Telefone

Imagens

Atributos

Criação das Principais Tabelas (Exemplos)
Cliente
CREATE TABLE cliente (
 cod_cliente INT AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(50),
 cpf VARCHAR(14),
 rg VARCHAR(12),
 email VARCHAR(50),
 sexo ENUM('F','M'),
 login VARCHAR(20),
 senha VARCHAR(40),
 liberado BIT
) ENGINE=InnoDB;

Telefones (1:N)
CREATE TABLE cliente_telefone (
 cod_telefone INT AUTO_INCREMENT PRIMARY KEY,
 cod_cliente INT,
 ddd CHAR(2),
 numero VARCHAR(9)
) ENGINE=InnoDB;

Endereços (1:N)
CREATE TABLE cliente_endereco (
 cod_endereco INT AUTO_INCREMENT PRIMARY KEY,
 cod_cliente INT,
 tipo_endereco ENUM('CASA','ENTREGA','COBRANCA')
) ENGINE=InnoDB;

Pedidos e Itens
Pedido
CREATE TABLE pedido (
 cod_pedido INT AUTO_INCREMENT PRIMARY KEY,
 cod_cliente INT,
 cod_tipo_pagto INT,
 valor_total DOUBLE(9,2),
 cod_status INT
) ENGINE=InnoDB;

Pedido_Item (N produtos por pedido)
CREATE TABLE pedido_item (
 cod_pedido INT,
 cod_produto INT,
 quantidade TINYINT,
 PRIMARY KEY (cod_pedido, cod_produto)
) ENGINE=InnoDB;

Entregas e Tracking

Pedido pode ter uma ou várias entregas.

Tracking registra o histórico de status.

CREATE TABLE tracking (
 cod_tracking INT AUTO_INCREMENT PRIMARY KEY,
 cod_pedido INT,
 cod_status INT,
 data_status TIMESTAMP
);

Produtos, SKUs e Categorias
Conceito de SKU

SKU representa a variação do produto (cor, voltagem, tamanho).

Um produto → vários SKUs (1:N).

Produto
CREATE TABLE produto (
 cod_produto INT AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(150),
 cod_marca INT
);

SKU
CREATE TABLE sku (
 cod_sku INT AUTO_INCREMENT PRIMARY KEY,
 cod_produto INT,
 preco_venda DECIMAL(9,2)
);

Categoria com autorrelacionamento
CREATE TABLE categoria (
 cod_categoria INT AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(45),
 cod_categoria_pai INT
);

Imagens e Atributos

Imagens podem ser de Produto ou SKU.

Atributos técnicos ficam separados e ligados ao SKU.

CREATE TABLE sku_atributo (
 cod_sku INT,
 cod_atributo INT,
 valor VARCHAR(50),
 PRIMARY KEY (cod_sku, cod_atributo)
);

Chaves Estrangeiras

Após criar todas as tabelas, aplicam-se as FKs com ALTER TABLE, garantindo:

Integridade referencial

Segurança na engenharia reversa

Melhor entendimento do modelo

Modelo Final e Ferramenta

O MySQL Workbench permite:

Criar o modelo físico

Gerar o modelo lógico por engenharia reversa

Para isso, os relacionamentos precisam existir no banco.

Conclusão

O artigo apresenta um mini-modelo escalável de e-commerce, baseado em:

Boas práticas de modelagem

Normalização até a 3FN

Uso correto de PKs e FKs

Estrutura usada por grandes empresas

O modelo pode ser expandido conforme o negócio, mas já serve como base sólida para qualquer sistema de vendas online, independente do porte.