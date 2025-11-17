//Arrow Functions
//Arrow Functions são funções escritas de forma diferentes das funções tradicionais.
//Elas podem receber parâmentros ou não.

//Função Tradicional

function retorna_media(nota_1, nota_2){

    let media =(nota_1 + nota_2) / 2;
    return media;
}

//Arrow Function

const retorna_media = (nota_1, nota_2) => //Não temos a palavra-chave function.
//"const retorna_media" --> palavra-chave+nome da função
//"(nota_1, nota_2)"--> parâmetros
//"=>" --> flecha(arrow)

{

    let media = (nota_1 + nota_2) / 2;//Essa arrow function pode ser ainda mais reduzida.
    //Repare que tudo que ela faz é retornar um cálculo. Esse cálculo pode ser feito direto
    //no retorno da função.
    return media;
}
//As Arrow Functions funcionam de forma semelhante às funções tradicionais.

//O retorno de uma Arrow Function é usado da mesma forma como em uma função tradicional.
let media_aluno = retorna_media(9, 8);
console.log("A média do aluno é: " + media_aluno);
//______________________________________________________________________

const retorna_media =(nota_1, nota_2) =>{
    
    return (nota_1+nota_2) /2;//Quando temos uma arrow function que só possui uma linha de 
//código e que retorna este valor, podmos excrevê-la em uma única linha.
}
let media_aluno = retorna_media(9, 8);
console.log("A média do aluno é: " + media_aluno);
//______________________________________________________________________


//Arrow function foi reduzida a apenas uma linha

const retorna_media = (nota_1, nota_2) => (nota_1+nota_2)/2;

let media_aluno = retorna_media(9, 8);
console.log("A média do aluno é: " + media_aluno);


//Sinxtaxe de uma arrow function que retorna um valor utilizando apenas uma linha de código.

const retorna_media --> //palavra-chave + nome da função.
(nota_1, nota_2) --> //parâmetros.
=> -->//flecha(arrow).
(nota_1 + nota_2) / 2; -->//conteúdo da função inserido sem o uso das chaves e da palavra return.


//Obs.:O uso da Arrow Functions tem sido cada vez mais adotado no desenvolvimento,
//o que torna um bom motivo para usar essa nova forma de escrever funções.
//arrow-functions.js