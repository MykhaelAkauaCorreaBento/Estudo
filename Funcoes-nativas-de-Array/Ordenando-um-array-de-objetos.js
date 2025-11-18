//Ordenando um array de objetos
//.sort() ordenando um array de objetos

//A ordenação de um array de objetos segue as mesmas regras da ordenação de arrays numéricos.
//A única diferença é que precisamos especificar o nome do campo que sera checado na função.


let alunos = [
    {nome:"Mykhael", matricula:34},
    {nome:"Ramon", matricula:235},
    {nome:"Sérgio", matricula:4564},
    {nome:"Eliane", matricula:75},
    {nome:"Dandara", matricula:2},
];

function ordenaMatricula(a, b){
    return a.matricula -b.matricula;
}

console.log("\nArray antes da ordenação:\n");
console.info(alunos);

alunos.sort(ordenaMatricula);

console.log("\nArray depois da ordenação:\n");
console.info(alunos);
console.log("\n");


//Veja que a regra para ordenação crescente é a mesma, a diferença é que 
//precisamos específicar o campo que será ordenado

//Ordenando-um-array-de-objetos.js