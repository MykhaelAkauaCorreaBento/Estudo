SELECT count(emp_no), gender from employees.employees
group by gender;

select * from employees.employees where birth_date between '1960-01-01' and '1980-12-31';


select f.emp_no, f.first_name, f.last_name, f.hire_date, d.dept_name
from employees.employees f join dept_emp de on (f.emp_no = de.emp_no)
join departments d on (de.dept_no = d.dept_no)
where de.to_date = '9999-01-01';


-- Funcionarios sem departamentos

select * from employees where emp_no not in
	(select emp_no from dept_emp);
    
-- departamentos dept_manager

select * from departments where dept_no not in
	(select dept_no from dept_manager);
    

-- funcionarios que nunca foram gerentes

select * from employees where emp_no not in
(select emp_no from dept_manager);








