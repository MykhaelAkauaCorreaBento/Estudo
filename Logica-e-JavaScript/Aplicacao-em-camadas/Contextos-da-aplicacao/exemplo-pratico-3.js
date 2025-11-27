//Exemplo prático 3
//Como vimos anteriormente, os contextos são definidos pelo objetivo dos
//códigos que fazem parte dele.


//No exemplo, podemos notar que continuamos com os mesmo dois contextos do
//exemplo exemplo-pratico-2.js.

//A função retornaStatusIMC é utilizada para retornar o status do usuário 
//com base no calculo do IMC e por esse motivo ela está no contexto do
//cálculo IMC.




//Contexto  cálculo.
function calculaIMC(peso, altura)
{
    let imc = peso / (altura * altura)
    return imc;
}


function retornaStatusIMC(imc)
{
    let status;

    if(imc < 18.5)
    {
        status = 'abaixo do peso';
    }
    else if(imc > 18.5 && imc < 24.9)
    {
        status = 'peso normal';
    }
    else
    {
        status = 'obeso';
    }
    return status;
}




//Já aqui o retorno da função retonaStatusIMC está associado a variável
//statusIMC que tem comom único objetivo exibir a informação.
//Por esse motivo a chamada dessa função se encaixa no contexto de exibição.

//Contexto de exibição.
let peso = 60;
let altura = 1.70;

let resultado = calculaIMC(peso, altura);
let statusIMC = retornaStatusIMC(resultado);

console.log("Seu IMC é "+resultado+" e você está "+statusIMC);



//Veja que no nosso código a estrutura não foi alterada, mantendo os mesmos dois
//contextos, porém, sempre que alteramos um código é ppreciso reavaliá-lo.

//exemplo-pratico-3.js