Resumo – SQL: UPDATE

O comando UPDATE é usado para alterar um ou mais dados já existentes em uma tabela. Normalmente ele é combinado com a cláusula WHERE, que define quais registros serão modificados.

Conceito básico

Para corrigir ou atualizar informações em uma tabela, informamos:

A tabela que será alterada

As colunas e novos valores

A condição que identifica os registros

Exemplo simples
UPDATE produtos
SET descricao = 'Lápis preto (unid)'
WHERE id = 2;


O que acontece aqui:

UPDATE produtos → define a tabela

SET → indica o campo que será alterado

WHERE id = 2 → garante que apenas o produto correto seja modificado

Sintaxe geral
UPDATE tabela
SET
  coluna1 = novo_valor1,
  coluna2 = novo_valor2
WHERE
  condicao;


💡 Dica importante:
Evite executar UPDATE sem WHERE, pois isso altera todos os registros da tabela.

Na prática
Exemplo 1 – Uso do WHERE com operadores lógicos

O WHERE pode usar operadores como OR, AND e NOT, tornando a busca mais flexível.

UPDATE produtos
SET
  descricao = 'Resma de ofício com 500 folhas',
  preco = 18.50
WHERE
  id = 1 OR preco = 17.50;


➡️ Nesse caso, o banco atualiza:

o produto com id = 1, ou

qualquer produto com preco = 17.50

Exemplo 2 – Atualizando múltiplos registros com IN

É possível atualizar vários registros ao mesmo tempo usando IN.

UPDATE funcionario
SET departamento = 'Supervisão Comercial'
WHERE id IN (3, 6);


Resultado:

Os funcionários de id 3 e id 6 mudam do setor Comercial para Supervisão Comercial

Os demais registros permanecem inalterados

Boas práticas

✔ Sempre use WHERE para evitar alterações indevidas

✔ Confira os valores antes de executar o comando

✔ Use IN quando precisar atualizar vários registros específicos

✔ Teste com SELECT antes do UPDATE para validar o filtro

Esse cuidado garante segurança e precisão nas atualizações do banco de dados.