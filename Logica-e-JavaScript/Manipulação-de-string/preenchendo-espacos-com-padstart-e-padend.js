//Preenchendo strings

//Em alguns casos pode ser necessário fazer o preenchimento de uma string
//com um determinado caractere até que essa string atinja um certo tamanho.
//Isso pode ser feito com métodos nativos da linguagem JavaScript.

//Para preencher uma string com um determinado caractere basta usar os
//métodos padStart() e padEnd().

let lebel_aluno = "Aluno";
let valor_aluno = "Edmilson";

let lebel_grau = "grau de escolaridade";
let valor_grau = "Ensino Médio Completo";

console.log(lebel_aluno.padStart(20, " ") +": " + valor_aluno);
console.log(lebel_grau.padStart(20, " ") + ": " + valor_grau);

//O método 'padStart()' preencheu o ínicio das string com espaços em branco.
//As string originais foram mantidas e foram adicionados espaços até as string
//terem 20 caracteres.


let label="Email: ";
let email="contato@email.com";

console.log(label.padEnd(20, " ") + email);

//preenchendo-espacos-com-padstart-e-padend.js