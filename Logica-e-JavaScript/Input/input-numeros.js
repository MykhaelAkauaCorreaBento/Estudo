import entradaDados from 'readline-sync';

console.log("Calculadora de sima entre x e y \n")
;
let x = entradaDados.question("informe o valor de x: ");
let y = entradaDados.question("Informe o valor de y: ");

let soma = Number(x) + Number(y);

console.log(x+" + "+y+" = "+soma);


// preciso colocar Number(), pois ele tranforma em números, aco o contrário , ele vai somar string.
// exemplo: x = 10 e y =5, no resultado da soma ficará 105 e não 15.



//input-numeros.js