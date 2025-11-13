//Problema na estrutura de repetição

//Ao utilizar estruturas de repetição devemos ter cuidado com um 
// problema chamado loop infinito, onde um laço de repetição nunca é 
// finalizado.


let numero = 3
let contador = 0

console.log("tabuada de multiplicação - Nº "+ numero);

while( contador <=10){
    let resultado = numero * contador;

    console.log(numero + " x " + contador + " = "+resultado)
    contador++ // Se o incremento do contador for removido, teremos o loop infinito.



}

// Tabuada de multiplicação - Nº 3
// 3 x 0 = 0
// 3 x 1 = 3
// 3 x 2 = 6
// 3 x 3 = 9
// 3 x 4 = 12
// 3 x 5 = 15
// 3 x 6 = 18
// 3 x 7 = 21
// 3 x 8 = 24
// 3 x 9 = 27
// 3 x 10 = 30


//Para resolver o problema do loop infinito basta não esquecer de utiizar um contador.


//Mais um exemplo:temos a estrutura do..while


let contador1 = 0;

let meses =["\nJan","Fev","Mar","Abr","Mai","Jun","Jul","Ago","Set","Out","Nov","Dez\n"];

do{
    console.log(meses[contador1]);

    //Sem o incremento do 'contador1', o mês de 'Jan' seria impreso sem parar.
    contador1++
    //

}while(contador1 < meses.length);

//A estrutura for possui o incremento de contador na sua sintaxe. Por isso, 
//não necessidade de incrementar o contador dentro do bloco.

let num = 8;
let contad =0

console.log("Tabuada da multriplicação - Nº "+ num);

//incremento de "contad"
//Na estrutura 'for' já temos o incremento do contador, no caso"contad".
//Na estrutura 'for' não temos o loop infinito, pois o contador,no caso"contad",
//sempre será incrementado.

for(let contad = 0; contad <= 10; contad++){
   
    

//Como o incremento do contador "contad" é feito acima não precisamos incrementar 
//dentro do bloco.
    let result =  num * contad;

    console.log(num + " x "+ contad + " = " + result);

//
}

//Obs.: A estrutura de repetição for tem um contador presente em sua sintaxe,
//não sendo necessário implementá-lo. Já nas estruturas while e do .. while
//existe a necessidade incrementar o contador dentro do bloco.





// problema-na-estrutura-de-repeticao-e-como-resolver.js