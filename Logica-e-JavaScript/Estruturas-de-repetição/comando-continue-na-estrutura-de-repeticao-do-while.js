//Exemplo de uso com o comando continue na estrutura de repetição do..while.

let alunos = [
    {id:1, nome:"Eliane", media:8},
    {id:2, nome:"Ramon", media:7},
    {id:3, nome:"Sério", media:5},
    {id:4, nome:"Dandara", media:10},
    {id:5, nome:"Mykhael", media:4},
];

let contador = 0;

do{
    let aluno = alunos[contador];
    contador++;

    if(aluno.media < 6){
        continue;
    }

    console.log("\nId: " + aluno.id);
    console.log("Nome: " + aluno.nome);
    console.log("Média: " + aluno.media);
    console.log("\n" );
}while (contador < alunos.length);


//comando-continue-na-estrutura-de-repeticao-do-while.js