CREATE TABLE TBL_REL_FUNCIONARIOS AS SELECT * FROM REL_FUNCIONARIOS;


CALL SP_GERA_DADOS_FUNC();


SELECT * FROM TBL_REL_FUNCIONARIOS;


-- Stored Procedure (Procedure) é uma rotina (conjunto de comandos SQL) que fica armazenada no banco de dados e pode ser executada (chamada) sempre que necessário,
-- sem precisar reescrever o código.