-- Maiúsculo

select ucase(first_name),upper(last_name), gender from employees;

-- Minúsculo

select lcase(first_name), lower(last_name), gender from employees;

-- Quantidade de letras(com espaço)

select length(first_name), last_name, gender from employees;


-- Quantidade de letras(sem espaço) ltrim(tira espaços a esquerda) rtrim(tira espaços a direita)

select length(trim(first_name)), last_name, gender from employees;


-- Selecionar a posição de  uma palavra para  extrair

select substr(first_name, 1, 6), last_name, gender from employees where emp_no = 10001;


-- Selecionar a posição de  uma palavra para extrair usando o position


select substr(first_name,1, position( ' ' in first_name )) from employees where emp_no = 10001;
