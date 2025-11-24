//Exemplo prático 4
//Modificando a calculadora IMC - Tratamento de erros



//Contexto validação peso e altura.



function validaPeso(peso)
{
    let pesoValido = false;
   
    if(pesoValido > 0){
        pesoValido = true;
    }
    return pesoValido;
}

function validaAltura(altura)
{
    let alturaValida = false;

    if( altura > 0){
        alturaValida = true;
    }
    return alturaValida;
}



//Contexto cálculo.

function calculaIMC(peso, altura)
{
    let imc = peso / (altura * altura);
    return imc;
}

function retornaStatusIMC(imc)
{
    let status;
    if( imc < 18.5)
    {
        status = 'abaixo do peso';
    }
    else if( imc > 18.5 && imc < 24.9)
    {
        status = 'peso normal';
    }
    else
    {
        status = 'obeso';
    }
    return status;
}




//Contexto exibição.


let peso = 60;
let altura = 1.70;

let verificaPesoValido = validaPeso(peso);
let verificaAlturaValida = validaAltura(altura);

if( verificaPesoValido && verificaAlturaValida)
{
    let resultado = calculaIMC(peso, altura);
    let statusIMC = retornaStatusIMC(resultado);

    console.log("Seu IMC é: "+resultado+" e você está "+statusIMC);
}
else
{
   console.log("Pesso e altura devem ser maiores que zero.");
}


//Isso ocorre, pois essas funções não tem como objetivo principal  participar
//do cálculo ou exibir dados, mas validar informações.
//Por esse motivo, validaPeso e validaAltura terão seu próprio contexto: contento de validação de peso e altura.



//Obs.:Dessa vez, a nossa alteração de código acabou criando um novo contexto 
//para a aplicação. POr isso é importante reavaliar o código a cada alteração feita.
//O conteúdo dessa aula é de extrema importância para o restante do curso,
//pois toda a base das camandas de apliacação está nos contextos.

//Em resumo, para dividir uma aplicação em camadas, basta você separar os
//blocos de código de acordo com seus contextos.


//Obs.:Conseguir entender e executar a divisão de contextos é essencial
//para quem vai trabalhar com aplicações em camadas, pois todo conceito
//de camadas se baseia nos conceitos aprendidos aqui


//exemplo-pratico-4.js