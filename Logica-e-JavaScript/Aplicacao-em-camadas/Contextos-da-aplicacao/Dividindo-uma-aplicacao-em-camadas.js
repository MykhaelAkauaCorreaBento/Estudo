//Dividindo uma aplicação em camadas


//Agora que você já sabe o que são grupos de contextos e como identificá-los,
//chegou a hora de entender como utilizamos esse conhecimento para adicionar
//camadas a nossa aplicação. Para isso, utilizaremos a calculadora de IMC que
//vimos na aula anterior.


//Anteriormente vimos a nossa aplicação calculadora de IMC sendo dividida
//em três contextos.

//Contexto de validação de peso e altura;
//Contexto do cálculo do IMC;
//Contexto de exibição;


//agora veremos como dividis o código da nossa aplicação em camadas
//através do processo de refatoração do código.

//Quando falamso de camadas no JavaScript estamos essencialmente falando de arquivos,
//ou seja,, a camada é a representação física do contexto.


//Contexto validação peso e altura.


//Arquivo pesoAlturaValidacao.js
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


//Arquivo calculadora.js
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

//Arquivo index.js
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


//Agora precisamos criar arquivos para esses contextos.
//O código de cada contexto deve ser colocado em um arquivo diferente.


//perceba que utilizamos nomes intuitivos, que fazem referência ao objetivo 
//do código.

//A exceção é o contexto de exibição, que ficou em um arquivo com o nome index.

//Obs.: No JavaScript, o primeiro arquivo a ser executado se chama index.js
//Neste caso, o contexto de exibição é o primeiro a ser executado,
//por isso ele tem esse nome.


//Desse ponto em diante chamaremos a camada do cálculo IMC de camada de serviço,
//pois seu objetivo é servir o resultado do cálculo.


//Além disso, é comum chamar a camada que executa a lógica central da aplicação,
//de camada de serviço.

//Se tentarmos executar a aplicação nesse momento nada irá acontecer.

//O motivo é que as camadas ainda não se comunicam.

//Vamos corrigir isso através dos módulos import e do export, que vão permitir
//a comunicação entre as camandas, ou seja, o consumo de dados entre elas.

//Para isso, primeiro exportamos as funções calculaIMC e retonarStatusIMC para 
//elas serem consumudas pela camada de exibição.

//É necessário fazer o mesmo com as funções da ca,ad de validação, pois elas
//também serão consumidas pela camada de exibição.


//Agora, tudo que resta fazer e importar as funções na camada de exibição.
//Fazendo isso teremos uma aplicação separada em camandas, onde as partes
//se comunicam para apresentarem o devido resultado.


//A divisão em camadas é o processo de separação de uma aplicação em arquivos
//com base em seu contexto. Esse processo é importante, pois permite criar
//aplicações mais organizadas e de fácil manutenção.


//Dividindo-uma-aplicacao-em-camadas.js 