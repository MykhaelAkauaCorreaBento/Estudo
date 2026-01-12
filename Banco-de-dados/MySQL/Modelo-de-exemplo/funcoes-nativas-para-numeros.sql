-- abs retorna o valor absoluto

select abs(30);
select abs(-30);

-- abs ignora o valor do sinal, e retorna o valor absoluto

-- funções trigonométricas de um determinado número

select asin(1), acos(1), atan(1);

-- função de arredondamento 

select round(1.784);

-- Função de arredondamento com casas decimais
-- Vai retornar 1.5, pois foi definido o arredondamento para 1 casa decimal
select round(1.49, 1);

-- Função de arredondamento com casas decimais
-- Vai retornar 2, pois foi definido o arredondamento para 2 casas decimais
select round(1.49, 2);

-- Função de arredondamento com casas decimais
-- Vai retornar 1.50, pois foi definido o arredondamento para 2 casas decimais
select round(1.495, 2);


-- Observação importante:
-- O ROUND(valor, casas_decimais) não arredonda para o número de casas indicado, e sim mantém essa quantidade de casas decimais, apenas ajustando o valor se necessário.





-- CEIL (ou CEILING) retorna o menor número inteiro maior ou igual ao valor informado.

-- Para CEIL(1.495), o resultado é 2.

-- Arredonda para cima
-- Retorna o menor valor inteiro maior ou igual ao número informado

select ceil(1.495);

-- TRUNCATE
-- Trunca um número para um número específico de casas decimais
-- Não arredonda, apenas corta o valor após a casa decimal desejada
select truncate(1.495,1);




-- A função CONV converte um número de uma base para outra.
-- Exemplo: converte o número 45 da base decimal (10) para a base binária (2)

select conv(45,10,2);


-- Converte o número '6E' da base hexadecimal (16) para decimal (10)

select conv('6E', 10,10);




-- Operador de exponenciação POW / POWER
-- Calcula a potência de um número: base ^ expoente
-- Exemplo: 10^2 = 100


select pow(10,2);



-- Retorna o valor de PI (π) 
-- Aproximadamente 3.141592653589793

select PI();


-- -- Retorna um número aleatório entre 0 (inclusive) e 1 (exclusive)
select rand();


-- função para descobrir o sinal do número se é negativo ou positivo

-- Função para descobrir o sinal de um número: retorna 
--  1 se positivo, 
--  0 se zero, 
-- -1 se negativo

-- Explicação:

-- sign(x) retorna:

-- 1 se x > 0

-- 0 se x = 0

-- -1 se x < 0


select sign(10), sign(-10), sign(0);

