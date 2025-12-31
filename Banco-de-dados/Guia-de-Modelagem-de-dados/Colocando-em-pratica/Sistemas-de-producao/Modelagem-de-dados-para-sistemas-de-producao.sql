O artigo apresenta uma modelagem de dados genérica para sistemas de produção, vendas e controle de estoque, destacando a importância do uso de transações SQL para garantir atomicidade, consistência e integridade dos dados.

Objetivo do Artigo

Demonstrar:

Como modelar um banco de dados para produção, vendas e estoque;

Como garantir que operações dependentes (ex.: vender e baixar estoque) sejam executadas corretamente;

Como usar transações SQL para evitar inconsistências.

Necessidades Atendidas pelo Modelo

O modelo atende quatro necessidades principais:

Controle de estoque de matéria-prima;

Controle de estoque de produtos fabricados;

Controle de compras de matéria-prima;

Controle de vendas.

📌 Funcionalidades mais complexas (nota fiscal, tributos, comissão, número de série, validade) não são tratadas, pois o foco é um modelo genérico.

Princípios Importantes

Toda entrada ou saída de estoque gera um evento registrado;

Não pode existir venda sem baixa no estoque;

Produção gera:

Saída de matéria-prima;

Entrada de produto fabricado;

Perdas (avaria, roubo, vencimento) são tratadas como saídas.

Padronização da Modelagem

Boas práticas adotadas:

Tabelas no singular, sem acento e sem espaços;

Todas possuem chave primária;

Relacionamentos feitos por chaves estrangeiras;

Padrão de nomenclatura:
idNomeTabelaFK.

📌 Dica: padronização facilita manutenção e leitura do banco.

Controle de Estoque de Matéria-Prima

Cada matéria-prima deve ser cadastrada previamente;

O estoque é controlado por uma tabela de saldo:

Quantidade comprada → todas as entradas;

Quantidade utilizada → todas as saídas.

📌 Entradas (compra, doação, bonificação) somam no mesmo contador.
📌 Saídas (produção, avaria, roubo) também.

Entradas e Saídas de Matéria-Prima

Entradas são registradas por tabelas de entrada e itens de entrada;

Existe uma tabela tipoEntrada para classificar o evento;

Saídas ocorrem principalmente durante a produção, mas também podem ocorrer por outros motivos.

Produção e Fórmula

Cada produto possui uma fórmula (receita);

Uma fórmula utiliza uma ou mais matérias-primas;

Produzir um produto:

Debita matéria-prima;

Credita produto fabricado.

Controle de Produtos Fabricados

Quantidade fabricada → entradas;

Quantidade vendida → saídas.

📌 A quantidade vendida também inclui avarias, roubos e perdas.

O relacionamento com a fórmula é essencial para calcular corretamente o consumo de matéria-prima.

Preço Médio – Exemplo Importante

O artigo alerta para o erro comum de usar média simples.

✔ Média ponderada correta:

Exemplo:

10 unidades a R$ 1,00

50 unidades a R$ 1,10

(10 × 1,00 + 50 × 1,10) / 60 = R$ 1,08


📌 Dica de prova: preço médio em estoque = média ponderada.

Controle de Vendas

Uma venda possui vários itens;

Cada item vendido gera baixa no estoque;

Existem outros tipos de saída além da venda (vencimento, avaria etc.).

Uso de Transações SQL

O artigo enfatiza que operações dependentes devem usar transações:

Se uma etapa falhar → rollback;

Só confirma a operação se tudo der certo → commit.

📌 Regra fundamental:
Nunca registrar uma venda se o estoque não for atualizado corretamente.

Código – Exemplo de Venda com Transação (Java + SQL)

O código abaixo exemplifica uma venda realizada dentro de uma transação, garantindo atomicidade:

c.setAutoCommit(false); // inicia controle manual da transação

// inicia transação
stmt.executeQuery("START TRANSACTION;");

// insere a venda
pstmt = c.prepareStatement(
  "INSERT INTO venda (idClienteFK, numeroParcelas, subTotal, totalVenda, " +
  "idUsuarioFK, dataCadastro, ativo, versao) VALUES (?,?,?,?,?,?,?,?)"
);
pstmt.execute();

// recupera o ID da venda
ResultSet rs = stmt.executeQuery("SELECT MAX(idVenda) as id FROM venda");

if(rs.next()){
  int idVenda = rs.getInt("id");

  // para cada item vendido
  for(Item item : itens){
    // insere item da venda
    stmt.executeUpdate(
      "INSERT INTO produtoVenda VALUES (" +
      idVenda + "," + item.getId() + "," +
      item.getQuantidade() + "," + item.getPreco() + ")"
    );

    // atualiza estoque
    stmt.executeUpdate(
      "UPDATE saldoProduto SET quantidadeVendida = quantidadeVendida + " +
      item.getQuantidade() +
      " WHERE idProduto = " + item.getId()
    );
  }
}

// confirma a transação
c.commit();

Explicação do Código

setAutoCommit(false) → impede execução automática;

START TRANSACTION → inicia a transação;

Insere a venda;

Recupera o ID da venda;

Insere os itens da venda;

Atualiza o estoque;

commit() → confirma tudo;

Se ocorrer erro → rollback() desfaz tudo.

📌 Dica importante:
Esse padrão evita vendas sem baixa de estoque, mesmo em falhas de energia, rede ou hardware.

Conclusão

O artigo mostra que:

Uma boa modelagem é essencial para sistemas de produção;

Transações são fundamentais em operações críticas;

O modelo é genérico, mas facilmente adaptável;

Controle de estoque exige consistência absoluta.

📌 Lição final:
Sempre use transações em sistemas que envolvem estoque, produção, vendas ou valores financeiros.