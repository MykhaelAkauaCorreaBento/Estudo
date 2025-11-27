

//Sem o método nativo.
//
let frase = "Estou aprendendo JavaScript na Devmidia";

let palavra ="";

let posicao_inicio = 16;
let posicao_fim = 27;

for(let i = 0; i <= frase.length; i++){
    if(i >= posicao_inicio && i<=posicao_fim){
        palavra += frase.charAt(i);
    }
    
}

console.log(palavra);
//




//Esse código extrai a palavra JavaScript de dentro do texto.
//Foram utilizadas estruturas para resolver esse problema.
//Mas escrever esse código todas as vezes pode gerar erros e além disso é muito trabalhoso.
//Por isso, hpa um método pronto que resolve esse problema.

//substring : método nativo que estrai uma subtring de dentro de uma string.



//Com o método nativo.
let frase1="Estou aprendendo JavaScript na DevMidia";

let posicao_inicio1 = 16;
let posicao_fim1 = 27;

let palavra1 = frase1.substring(posicao_inicio1, posicao_fim1);

console.log(palavra1);
//


//Toda string possui métodos e propriedades nativas
//As vantagens do uso desses recursos nativos são:

//Redução de código repetitivo.
//Economia de tempo.
//Aceleramento no processo de desenvolvimento.

//manipulando-strings.js