//Funções com parâmetros.


//Funções com parâmetros recebem valores para serem usados em seus blocos de códigos.


//Exemplo de função com parâmetro

function retorna_status_aluno(nota_1, nota_2)//Note que entre os parênteses, temos dois valores
//sendo passados, o que significa dizer que se trata de uma função com parâmetro.

{

    let media = (nota_1 + nota_2) / 2;//OS dois parâmetrtos são usadps ára o cálculo
    //da média.Esse cálculo é atribuído à variável media.

    let status;// Variável que vai guardar o status do aluno.


    //Aqui temos uma condição que verifica se a média do aluno é maior ou igual
    // a 6.Caso a condição seja verdadeira, o aluno está aprovado, caso contrário, ele está reprovado.

    if(media >= 6){
        status ="Aprovado";
    }else{
        status="Reprovado";
    }
    //


    return status;// A função retorna o status do aluno.
}

//Sempre que for necessário retornar o status de um aluno, basta criar variável
//a atribuit o retorno da função a ela.

let status_aluno_1 = retorna_status_aluno(7, 8);
console.log("Aluno 1: " + status_aluno_1);

let status_aluno_2 = retorna_status_aluno(4, 7);
console.log("Aluno 2: " + status_aluno_2);



//O uso de funções com parâmetros nos ajuda a reaproveitar um bloco de código
//que recebe valores para usá-los em suas tarefas.



//Quando precisamos de uma função que precisa receber valores para usá-los no seu
//código, usamos funções com parâmetro.


//funcoes-com-parametros.js