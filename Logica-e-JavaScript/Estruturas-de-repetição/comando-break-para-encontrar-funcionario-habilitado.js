//Comando break com funcionário habilitado encontrado

let funcionarios = [
    {id:1, nome:"Eliane", habilitado:false},
    {id:2, nome:"Ramon", habilitado:true},
    {id:3, nome:"Sérgio", habilitado:false},
    {id:4, nome:"Dandara", habilitado:false},
    {id:5, nome:"Mykhael", habilitado:true}
];

let contador = 0;
let encontrouHabilitado = false;  //variável booleana para indicar se um
//funcionário habilitado foi encontrado. 


while(contador < funcionarios.length){
    let funcionario = funcionarios[contador];

    if( funcionario.habilitado == true){
        console.log("Funcionário habilitado encontrado: " + funcionario.nome);
        encontrouHabilitado = true;
        break;


        //Se um funcionário tiver a propriedade habilidado com o valor true, o 
        // loop será interrompido pelo comando break. Saindo do bloco while
        //Nesse caso não tera mais nenhuma verificação de média.

    }
    contador++;
}

if(!encontrouHabilitado){
    console.log("Nenhum funcionário habilitado encontrado");
//caso o valor da variável seja falso, a mensagem vai informar
//que nenhum usuário foi encontrado.

}

//Caso seja necessário iterar todos os elementos da coleção,
//  use o comando continue. Agora se o objetivo for encontrar 
// apenas um único elemento que atenda a uma determinada condição,
//  o comando break é a melhor opção.



//comando-break-para-encontrar-funcionario-habilitado.js

