Resumo – SQL: DELETE

O comando DELETE é utilizado para excluir uma ou mais linhas de uma tabela do banco de dados. Assim como o UPDATE, ele normalmente é usado junto com a cláusula WHERE, que define quais registros serão removidos.

Conceito básico

Para excluir um registro específico, informamos:

A tabela

A condição que identifica o registro

Exemplo simples
DELETE FROM produtos
WHERE id = 3;


Explicação:

DELETE FROM produtos → define a tabela

WHERE id = 3 → remove apenas o produto com esse id

💡 Dica: o DELETE aceita operadores condicionais (=, OR, AND, IN), assim como o UPDATE.

Sintaxe geral
DELETE FROM tabela
WHERE condicao_de_busca;

Na prática
Exemplo 1 – Excluindo um único registro

Para remover um comentário específico pelo id:

DELETE FROM comentario
WHERE id = 8;


➡️ Apenas o comentário de id 8 será removido da tabela.

Exemplo 2 – Excluindo vários registros

Para remover todos os comentários de um projeto específico:

DELETE FROM comentario
WHERE id_projeto = 7;


➡️ Todos os comentários relacionados ao projeto de id 7 serão excluídos.

⚠️ Cuidado com o DELETE sem WHERE

A cláusula WHERE é opcional, mas extremamente importante.

Exemplo perigoso
DELETE FROM comentario;


❌ Esse comando apaga todos os registros da tabela, pois não há nenhuma condição de filtro.

Boas práticas

✔ Sempre use WHERE ao excluir registros específicos

✔ Execute um SELECT antes do DELETE para conferir os dados

✔ Use IN ou condições bem definidas ao excluir múltiplos registros

✔ Evite DELETE sem WHERE, a menos que queira limpar a tabela inteira

Seguindo esses cuidados, o uso do DELETE se torna seguro e eficiente.