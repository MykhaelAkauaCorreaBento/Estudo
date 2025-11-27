import entradaDados from 'readline-sync';

console.log("Conversor de Celsius para Kelvin \n")

let celsius = entradaDados.question("Informe o valor de Celsius: ");

let K = Number(celsius) + Number(273.15);

console.log(celsius+"ºC é equivalente a "+K+" K");
























//conversor-de-temperatura.js