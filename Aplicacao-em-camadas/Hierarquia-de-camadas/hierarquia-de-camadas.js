//Hierarquia de camadas

//Neste caso, usaremos o exemplo da calculadora de IMC, onde vimos a
//camada de exibição consumindo funções da camada de serviço IMC.


//Camada de exibição (index.js) --- consume ---> Camada de serviços IMC(calculadoraIMC)

//Agora nós vamos conhecer as subcamadas.

//Podemos dizer que uma subcamada funciona como uma camada de apoi que auxilia direta
//ou indiretamente uma camada de hierarqui maior.

//Um sistema pode ter diversos níveis de subcamadas, ou camadas de apoio.


//O limite é a necessidade da aplicação.


//Exemplo de camada de apoio.

//Camada de exibição (index.js) --- consume ---> Camada de serviços IMC(calculadoraIMC) --- consume ---> Subcamada(formatarIMC)

//Para endender melhot essa ideia, considere o seguinte exemplo:

//Uma empresa quer fazer uma reforma no escritório e para isso ela contrata
//um arquiteto.
//A relação entre a camada empre e camada arquiteto é de grau 1 na hierarquia.
//Nesse CacheStorage, todas as camads pertencem a hierarquias maiores e estão no mesmo nível.
//O arquiteto será responsável pela obra, porém, não será ele que fará a obra.
//Outros profissionais serão responsável por tarefas como pintar as paredes
//ou colocar os pisos.


//Para isso, o arquiteto contrata um mestre de obras.

//              Empresa    --- contrata---> arquiteto         Hierarquia Grau 1
//                                             |
//                                             |
//                                          contrata
//                                             |
//                                             |
//                                        Mestre de obras     Hierarquia Grau 2
//                                             |
//                                             |
//                                          contrata
//                                             |
//                                             |
//                                   Equipe de operários      Hierarquia Grau 3

//O mestre de obras, por sua vez, contrata uma equipe de operários, que executam
//as tarefas e se reportam a ele.


//_____________________________________________________________________________

//O arquiteto, por ser uma camada de serviços, possui uma hierarquia maior e consome
//camadas de níveis menores para cumprir a sua função.

//arquiteto = Camada de serviço IMC
//O mestre de obras e os operários são as subcamadas que fornecem dados para o arquiteto direta e indiretamente.

//Mestre de obras = Subcamada
//Operários = Subcamada

//O arquiteto se informa do estado da obra com o mestre de obrasm que por sua vez,
//busca informações com os operários para levar ao arquiteto.

//A hierarquia deve ser respeitada na comunicação entre as camadas.

//Para isso usaremos o exemplo da aplicação calculadora de IMC.


//Arquivo index.js(camada de exibição)
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


//Arquivo pesoAlturaValidacao.js(camada de validação de peso e altura)
function validaPeso(peso) {
    let pesoValido = false;

    if(peso > 0) {
        pesoValido = true;
    }

    return pesoValido;
}

function validaAltura(altura) {
    let alturaValida = false;

    if(altura > 0) {
        alturaValida = true;
    }

    return alturaValida;
}

export { validaPeso , validaAltura }



//calculadora.js(camada de serviço)
function calculaIMC(peso, altura){

    let imc = peso / (altura * altura);
    return imc;
}

function retornaStatusIMC(imc){
    let status;

    if(imc < 18.5)    {
        status = 'abaixo do peso';
    } else if(imc > 18.5 && imc < 24.9) {
        status = 'peso normal';
    } else if(imc > 24.9 && imc < 30) {
        status = 'acima do peso';
    } else {
        status = 'obeso';
    }

    return status;
}

export { calculaIMC, retornaStatusIMC }


//A camada de serviço é responsavel por receber o peso e a altura e retornar o cálculo do IMC.
//No final do código do arquivo calculadoraIMC.js exportamos a função calculaIMC, para ela ser
//consumida por outra camada.
//Em seguida, passamos o peso e a altura para a função calculalMC e salvamos o
//retorno na variável resultado.
//O resultado do cálculo IMC será passado para a fun ão retornaStatuslMC.
//Por fim, utilizamos o console.log para imprimir o resultado do cálculo IMC na tela.

//A camada de exibição não se preocupa em como o resultado será obtido.
//Ela apenas cuida de exibir os dados e a camada de serviço fornece esses dados.

//A utilização correta de camadas e subcamadas torna o código da aplicação
//mais organizado, e por consequência, mais fácil de dar manutenção.
//Saber analisar um código e dividi-lo em camadas é parte importante do 
//desenvolvimento de uma aplicação.


//hierarquia-de-camadas.js