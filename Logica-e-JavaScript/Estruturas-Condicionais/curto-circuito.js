
//Curto-circuito

// Exemplo
let nota = 9
let status = 'Reprovado';

nota > 7 && (status = 'aprovado');


console.log(status);


// nota 9 -> status recebe um novo valor ('Aprovado')
// nota 3 -> status continua com o mesmo valor ('Reprovado')


// Também é possível atingir o mesmo objetivo armazenado a condição em uma variável:

let nota1 = 8
let status1 = 'Reprovado';

status1 = nota1 > 7 && 'Aprovado';

console.log(status1);

// nota 9 -> status recebe um novo valor ('Aprovado')
// nota 3 -> status continua com o mesmo valor ('Reprovado')












