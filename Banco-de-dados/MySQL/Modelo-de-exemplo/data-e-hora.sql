SELECT * FROM employees.dept_manager;

select date_format(from_date, '%d/%m/%y'), from_date FROM employees.dept_manager;


-- 1 Formato dia/mês/ano curto
-- Dia/mês/ano com 2 dígitos para ano

SELECT DATE_FORMAT(from_date, '%d/%m/%y') AS formatted_date,
       from_date
FROM employees.dept_manager;


-- Explicação:

-- %d → dia com 2 dígitos

-- %m → mês com 2 dígitos

-- %y → ano com 2 dígitos

-- Exemplo: 15/06/22

-- 2 Formato dia/mês/ano completo
-- Dia/mês/ano com mês por extenso e ano com 4 dígitos
SELECT DATE_FORMAT(from_date, '%d/%M/%Y') AS formatted_date,
       from_date
FROM employees.dept_manager;

-- Explicação:

--%M → mês por extenso (Janeiro, Fevereiro…)

--%Y → ano com 4 dígitos
-- Exemplo: 15/June/2022

-- 3 Formato dia/mês abreviado
-- Dia/mês abreviado (3 letras)
SELECT DATE_FORMAT(from_date, '%d/%b/%Y') AS formatted_date,
       from_date
FROM employees.dept_manager;

 -- Explicação:

-- %b → mês abreviado (Jan, Feb, Mar…)

-- %Y → ano com 4 dígitos
-- Exemplo: 15/Jun/2022


-- 4 Formato com dia ordinal e mês por extenso
-- Dia ordinal / mês por extenso / ano completo
SELECT DATE_FORMAT(from_date, '%D/%M/%Y') AS formatted_date,
       from_date
FROM employees.dept_manager;

-- Explicação:

-- %D → dia com sufixo ordinal (1st, 2nd, 3rd, …)

-- %M → mês por extenso

-- %Y → ano com 4 dígitos
-- Exemplo: 15th/June/2022


-- 5 Formato abreviado do dia da semana / mês por extenso / ano completo
SELECT DATE_FORMAT(from_date, '%a/%M/%Y') AS formatted_date, 
       from_date
FROM employees.dept_manager;


-- %a → nome do dia da semana abreviado (Mon, Tue…)

-- %M → mês por extenso (January, February…)

-- %Y → ano com 4 dígitos

-- Exemplo de saída:
-- Mon/June/2023

-- 6 Formato dia da semana completo / mês por extenso / ano completo
SELECT DATE_FORMAT(from_date, '%W/%M/%Y') AS formatted_date, 
       from_date
FROM employees.dept_manager;


-- %W → nome completo do dia da semana (Monday, Tuesday…)

-- %M → mês por extenso

-- %Y → ano com 4 dígitos

-- Exemplo de saída:
-- Monday/June/2023

-- 7 Formato numérico do dia da semana / mês por extenso / ano completo
SELECT DATE_FORMAT(from_date, '%w/%M/%Y') AS formatted_date, 
       from_date
FROM employees.dept_manager;


-- %w → número do dia da semana (0 = Sunday, 1 = Monday … 6 = Saturday)

-- %M → mês por extenso

-- %Y → ano com 4 dígitos

-- Exemplo de saída:
-- 1/June/2023 (segunda-feira = 1)


_________________________________________________________________________________________________________
| Código      | O que retorna                                       | Exemplo (para 2023-06-12, Monday) |
| ----------- | --------------------------------------------------- | --------------------------------- |
| `%a`        | Nome do dia da semana **abreviado**                 | Mon                               |
| `%W`        | Nome do dia da semana **completo**                  | Monday                            |
| `%w`        | Número do dia da semana (0=Sunday, 6=Saturday)      | 1                                 |
| `%d`        | Dia do mês com 2 dígitos                            | 12                                |
| `%D`        | Dia do mês com sufixo ordinal                       | 12th                              |
| `%m`        | Mês com 2 dígitos                                   | 06                                |
| `%b`        | Mês abreviado                                       | Jun                               |
| `%M`        | Mês por extenso                                     | June                              |
| `%y`        | Ano com 2 dígitos                                   | 23                                |
| `%Y`        | Ano com 4 dígitos                                   | 2023                              |
| `%j`        | Dia do ano (001-366)                                | 163                               |
| `%U`        | Semana do ano, domingo como primeiro dia            | 23                                |
| `%u`        | Semana do ano, segunda-feira como primeiro dia      | 23                                |
| `%V`        | Semana do ano (ISO 8601, segunda-feira como início) | 24                                |
| `%v`        | Semana do ano (ISO 8601, domingo como início)       | 24                                |
| `%x`        | Ano para semana ISO 8601                            | 2023                              |
| `%X`        | Ano para semana ISO 8601 (domingo início)           | 2023                              |
| `%H`        | Hora (00-23)                                        | 14                                |
| `%h` / `%I` | Hora (01-12)                                        | 02                                |
| `%i`        | Minutos (00-59)                                     | 05                                |
| `%s` / `%S` | Segundos (00-59)                                    | 30                                |
| `%p`        | AM ou PM                                            | PM                                |
_________________________________________________________________________________________________________



-- Adiciona 30 dias à data '2025-11-11'

select adddate('2025-11-11', interval 30 day)


-- Explicação:

-- ADDDATE(data, INTERVAL x unidade) adiciona um intervalo de tempo à data.

-- Nesse exemplo:

-- Data inicial: '2025-11-11'

-- Intervalo: 30 DAY → 30 dias

Resultado: '2025-12-11'

-- Observação:

-- Também existe a função DATE_ADD(data, INTERVAL x unidade), que funciona da mesma forma:

SELECT DATE_ADD('2025-11-11', INTERVAL 30 DAY) AS new_date;



-- Adiciona 30 anos à data '2025-11-11'
-- 2055-11-11

select adddate('2025-11-11', interval 30 year)




-- Adiciona 1 anos à data '2025-11-11'
-- 2026-11-11



-- Observações importantes sobre ADDDATE e DATE_ADD:

ADDDATE(data, INTERVAL x unidade) funciona para DAY, MONTH, YEAR, HOUR, MINUTE, SECOND, etc.

-- Equivalente a DATE_ADD(data, INTERVAL x unidade); só muda o nome.


_____________________________________________________________________________________________________

ADDTIME()

-- Função usada para somar um intervalo de tempo a um valor de hora ou datetime.

-- Sintaxe:

ADDTIME(data_ou_hora, tempo)


-- data_ou_hora → valor do tipo TIME ou DATETIME

-- tempo → valor do tipo TIME (horas:minutos:segundos)

-- Exemplos práticos

-- Somando horas a um TIME:

SELECT ADDTIME('12:30:00', '02:15:30') AS new_time;


-- Resultado: '14:45:30'

-- Somando tempo a um DATETIME:

SELECT ADDTIME('2025-11-11 08:30:00', '05:45:00') AS new_datetime;


-- Resultado: '2025-11-11 14:15:00'



-- -- Função para extrair o nome do dia da semana a partir de uma data

select dayname('2060-11-11')


-- Função para extrair o dia do mês de uma data

select dayofmonth('2060-11-11')


-- Função para obter a data atual do sistema (somente a data, sem hora)

select current_date()


-- Função para obter a hora atual do sistema (somente hora, minutos e segundos)

select current_time()


-- Função para obter a data e hora atual do sistema

select current_timestamp()
