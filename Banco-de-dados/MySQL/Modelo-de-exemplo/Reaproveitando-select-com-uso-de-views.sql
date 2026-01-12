SELECT e.emp_no, concat(e.first_name, ' ',e.last_name) nome,
case when gender = 'M' then 'Masculino' else 'Feminino' end sexo, 
date_format(e.birth_date, '%d/%m/%Y') Nasc,
date_format(e.hire_date, '%d/%m/%Y') Contratacao,
d.dept_name departamento
from employees e inner join dept_emp de on (de.emp_no = e.emp_no)
inner join departments d on (de.dept_no = d.dept_no)
where de.to_date = '9999-01-01'
order by emp_no;