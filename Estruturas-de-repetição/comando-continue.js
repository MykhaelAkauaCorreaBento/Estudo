//Comando continue
//

let alunos = [
    {id:1, nome:"Eliane", media:8},
    {id:2, nome:"Ramon", media:7},
    {id:3, nome:"Sérgio", media:5},
    {id:4, nome:"Dandara", media:4},
    {id:5, nome:"Mykhael", media:10}
];

let contador = 0;

while(contador < alunos.length){
    let aluno = alunos[contador];

    contador++;

    if (aluno.media < 6){
        continue;

//Se a média do aluno for menor que 6, a iteração atual será interrompida, e o 
// próximo aluno será percorrido no loop.
//Nesse caso o próximo aluno terá sua média verificada.

    }

    console.log("Id: " + aluno.id);
    console.log("Nome: " + aluno.nome);
    console.log("Média: " + aluno.media);
    console.log("\n");
}


//Caso seja necessário iterar todos os elementos da coleção,
//  use o comando continue. Agora se o objetivo for encontrar 
// apenas um único elemento que atenda a uma determinada condição,
//  o comando break é a melhor opção.

//comando-continue.js





