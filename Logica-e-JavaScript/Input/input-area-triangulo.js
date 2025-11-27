import entradaDados from 'readline-sync';

console.log("Área do triângulo \n");

let B = entradaDados.question("Informe a base: ");
let A = entradaDados.question("Informe a altura: ")

let area = (Number(B) * Number(A)) / 2;

console.log("\n\nVocê digitou a base: "+B);
console.log("Você digitou a altura: "+A);

console.log("\n\nA área do triângulo é: "+area+".\n\n");