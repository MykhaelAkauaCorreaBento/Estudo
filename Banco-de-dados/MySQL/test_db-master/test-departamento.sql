SELECT f.nome funcionario, d.nome departamento
from funcionario f join departamento d on (f.idDepartamento = d.idDepartamento);