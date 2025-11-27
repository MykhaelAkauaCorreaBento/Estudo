//(----Ordenando um array numérico----)

//A ordenação de um array numérico através do sort nem sempre sai conforme o esperado


const numeros = [10,1,2];

console.log("\nArray antes da ordenação:\n");
console.info(numeros);

numeros.sort();

console.log("\nArray depois da ordenação:\n");
console.info(numeros);
console.log("\n");

//Se executarmos esse código, o resultado obtido será este:

//Array antes da ordenação:

//[ 10, 1, 2 ]

//Array depois da ordenação:

//[ 1, 10, 2 ]

//Isso acontece pois, por padão, o .sort() ordena um array numérico com as mesmas regras da ordenação alfabética
//Para resolver esse problema precisamos customizar a ordenação de sort.
//Essa função existe em duas forma padão na ordenação de arrays numéricos:


//Ordem crescente
function ordenaNumeros(a, b){
    return a- b;
}

//ondem decrescente
function ordenaNumeros(a, b){
    return b - a;
}

//return b - a;--> Conteúdo da função(regra padão de ordenação em ordem crescente).
//ordenaNumeros--> Nome da função(Escolhido pelo desenvolvedor).
//(a, b)--> Parâmetros da função(valores padão, sempre 2, O nome pode ser escolhido pelo desenvolvedor).



const numeros1 = [10,1,2];

console.log("\nArray antes da ordenação:\n");
console.info(numeros1);

function ordenaNumeros(a, b){
    return a- b;
}

numeros1.sort(ordenaNumeros);

console.log("\nArray depois da ordenação:\n");
console.info(numeros1);
console.log("\n");

//Ordenando-um-array-numérico.js