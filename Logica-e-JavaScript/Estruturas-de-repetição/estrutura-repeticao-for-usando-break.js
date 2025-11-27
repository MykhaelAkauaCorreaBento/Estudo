// Estrutura de repetição for comandos break

let funcionarios = [
    {id:1, nome:"Eliane", habilitado:false},
    {id:2, nome:"Ramon", habilitado:true},
    {id:3, nome:"Sérgio", habilitado:false},
    {id:4, nome:"Dandara", habilitado:false},
    {id:5, nome:"Mykhael", habilitado:false},
];

let encontrouHabilitado = false;

for(let contador = 0; contador < funcionarios.length; contador++){

    let funcionario = funcionarios[contador];
    if(funcionario.habilitado == true){
        console.log("Funcionario habilitado encontrado: "+ funcionario.nome);
        encontrouHabilitado = true;
        break;
    }
}
if(!encontrouHabilitado){
    console.log("Nunhum funcionário habilidado encontrado");
}

//estrutura-repeticao-for-usando-break.js