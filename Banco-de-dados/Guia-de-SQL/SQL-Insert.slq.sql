Resumo – SQL: INSERT

O comando INSERT é usado para inserir uma ou mais linhas em uma tabela. Ele permite informar as colunas em qualquer ordem (desde que os valores correspondam aos tipos corretos) e também inserir vários registros em um único comando.

Conceito básico

A tabela produtos possui as colunas: id, descricao, preco, categoria.
Para inserir novos registros, usamos INSERT INTO.

Exemplo – Inserindo múltiplas linhas
INSERT INTO produtos
  (id, descricao, categoria, preco)
VALUES
  (4, 'Resma Ofício c/500 folhas', 2, 17.50),
  (5, 'Resma Ofício c/1000 folhas', 2, 23.00);


Dicas importantes:

Informe as colunas na ordem desejada.

Os valores devem respeitar os tipos de dados (int, varchar, decimal etc.).

É possível inserir vários registros separando-os por vírgula.

Sintaxe geral
INSERT INTO nome_tabela
  (coluna1, coluna2, ...)
VALUES
  (valor1, valor2, ...);

Na prática
Exemplo 1 – INSERT com SELECT

É possível inserir dados usando o resultado de um SELECT, muito útil para copiar ou migrar dados.

INSERT INTO produtos
 (id, descricao, preco, categoria)
SELECT id, descricao, preco, categoria
FROM produtos
WHERE id = 1;


Atenção:

Os tipos de dados devem ser compatíveis.

Evite duplicar valores em colunas com restrição UNIQUE ou chave primária.

Nesse caso, não se usa a palavra VALUES.

Exemplo 2 – INSERT sem informar colunas

Quando não informamos as colunas, devemos seguir exatamente a ordem em que elas foram criadas na tabela.

INSERT INTO produtos
VALUES
 (4, 'Resma Ofício c/500 folhas', 17.50, 2);


Dica: esse formato é mais arriscado se a estrutura da tabela mudar.

Exemplo 3 – Sintaxe completa (mais recomendada)
INSERT INTO produtos (id, descricao, preco, categoria)
VALUES
 (4, 'Resma Ofício c/500 folhas', 17.50, 2);


Boa prática: sempre informar as colunas para evitar erros e facilitar a manutenção do código.
