//Exemplo de uso com o comando break na estrutura de repetição do..while.


//Comando break, dentro da estrutura condicional. Caso seja executado, 
//interrompe todo o laço de repetição.

let funcionarios = [
{id:1, nome:"Eliane", habilitado:false},
{id:2, nome:"Ramon", habilitado:true},
{id:3, nome:"Sérgio", habilitado:false},
{id:4, nome:"Dandara", habilitado:false},
{id:5, nome:"Mykhael", habilitado:false}
];

let contador = 0;
let encontrouHabilitado = false;

do{
    let funcionario = funcionarios[contador];
    if(funcionario.habilitado == true){
        console.log("Funcionario habilitado cncontrado: " + funcionario.nome);
        encontrouHabilitado = true;
        break;
    }
    contador++;
}while(contador < funcionarios.length);



if(!encontrouHabilitado){
    console.log("nenhum funcionário habilidado encontrado");
}

//comando-break-na-estrutura-de-repeticao-do-while.js

