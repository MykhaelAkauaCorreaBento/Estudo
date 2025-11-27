//Contexto exibição.

import {validaPeso, validaAltura} from '../services/funcoes/pesoAlturaValidacao.js';
import {calculaIMC, retornaStatusIMC} from '../services/funcoes/calculadora.js';

//Arquivo index.js
let peso = 60;
let altura = 1.70;

let verificaPesoValido = validaPeso(peso);
let verificaAlturaValida = validaAltura(altura);

if(verificaPesoValido && verificaAlturaValida) {
    let resultado = calculaIMC(peso, altura);
    let statusIMC = retornaStatusIMC(resultado);

    console.log("Seu IMC é "+resultado+" e você está "+statusIMC);
} else {
    console.log("Peso e altura devem ser maiores que zero");
}
