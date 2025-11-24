//Exemplo prático 2

//Observando o código abaixo podemos ver dois contextos.
//O contexto do cálculo de IMC é representado pela função calculaIMC, pois o único 
//objetivo dela é esse.
//Já o restante do código assume o contexto de exibição, pois seu objetivo em conjunto é retornar
//o resultado do cálculo de IMC para o usuário.


//Contexto  cálculo.
function calculaIMC(peso, altura)
{
    let imc = peso /(altura * altura);
    return imc;
}

//Contexto de exibição.
let peso = 70;
let altura = 1.70

let resultado = calculaIMC(personalbar, altura);

console.log("IMC: "+resultado);



//exemplo-pratico-2.js