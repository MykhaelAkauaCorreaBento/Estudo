// Estrutura de repetição for comandos continue

let alunos = [
    {id:1, nome:"Eliane",  media:8},
    {id:2, nome:"Ramon",   media:7},
    {id:3, nome:"Sérgio",  media:5},
    {id:4, nome:"Dandara", media:10},
    {id:5, nome:"Mykhael", media:4},
    ];

    for(let contador = 0; contador< alunos.length; contador++){
        
        let aluno = alunos[contador];
        
        if(aluno.media < 6){
            continue;
        }

        console.log("\nId: "+aluno.id);
        console.log("Nome: "+aluno.nome);
        console.log("Média: "+aluno.media);
        console.log("\n");
    }

    //estrutura-repeticao-for-usando-continue.js