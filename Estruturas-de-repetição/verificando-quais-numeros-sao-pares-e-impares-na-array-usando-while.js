//Estrutura com while para verificar quais números de um array são pares ou ímpares


let numeros = [10, 5, 7, 8, 9, 6, 12, 4, 98, 675, 234, 13, 51, 122, 34, 64, 67, 11,88, 967, 1235, 7545, 2343562, 6436 ,346346, 3463 ,346 ,7, 868, 9797,1, 2, 3, 4456, 764, 4332];

let total_impares = 0;
let total_pares = 0;

let contador = 0;

while(contador < numeros.length){
    if(numeros[contador] % 2 ==0){
        total_pares++;
    }else{
        total_impares++;
    }
    contador++;
}

console.log("O total de números ímpares é: " + total_impares);
console.log("O total de números pares é: " + total_pares);


//verificando-quais-numeros-sao-pares-e-impares-na-array-usando-while.js























