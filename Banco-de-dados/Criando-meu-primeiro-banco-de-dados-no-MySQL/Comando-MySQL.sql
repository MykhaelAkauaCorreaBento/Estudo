✅ 1. COMANDOS ESSENCIAIS (Obrigatórios para qualquer dev)
📌 Criar banco de dados
CREATE DATABASE nome_do_banco;
USE nome_do_banco;

📌 Criar tabela
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT
);

📌 Inserir dados
INSERT INTO clientes (nome, idade)
VALUES ('João', 30);

📌 Selecionar dados
SELECT * FROM clientes;
SELECT nome, idade FROM clientes;

📌 Filtrar (WHERE)
SELECT * FROM clientes WHERE idade > 30;

📌 Atualizar
UPDATE clientes SET idade = 31 WHERE id = 1;

📌 Deletar
DELETE FROM clientes WHERE id = 1;

✅ 2. COMANDOS IMPORTANTES (para APIs e sistemas reais)
📌 Ordenar
SELECT * FROM clientes ORDER BY nome ASC;

📌 Limitar resultados
SELECT * FROM clientes LIMIT 10;

📌 Procurar (LIKE)
SELECT * FROM clientes WHERE nome LIKE '%a%';

📌 Funções básicas
SELECT COUNT(*) FROM clientes;
SELECT AVG(idade) FROM clientes;

✅ 3. RELACIONAMENTOS (Fundamental para projetos reais)
📌 Criar tabela com chave estrangeira
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    valor DECIMAL(10,2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

📌 JOIN (Extremamente importante!)
🔹 INNER JOIN — mais usado de todos
SELECT clientes.nome, pedidos.valor
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id;

🔹 LEFT JOIN
SELECT clientes.nome, pedidos.valor
FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id;

✅ 4. ESTRUTURA DO BANCO (Administrador básico)
📌 Ver tabelas
SHOW TABLES;

📌 Ver estrutura da tabela
DESCRIBE clientes;

📌 Apagar tabela (cuidado!)
DROP TABLE clientes;