//Exemplo prático  estrutura for .. of para percorrer uma coleção de notas.

//Array com as notas trimestrais
let notas_trimenstrais = [9, 7, 6, 7];
//
let total_notas = notas_trimenstrais.length;
let soma_notas = 0;


//Percorrendo o array de notas
for(let nota of notas_trimenstrais){
    soma_notas = soma_notas + nota;
}
//


let media = soma_notas / total_notas;
console.log("Média: "+ media);


//O status será impresso de acordo com a média
if(media >= 7){

    console.log("Aprovado");

}else if(media >= 6 && media <7){

    console.log("Recuperação");

}else{

    console.log("Reprovado");
}
//



//Obs.:A estrutura de repetição for .. of é uma ótima solução 
//para percorrer valores de uma coleção de dados.

//percorrendo-array-de-notas-com-for-of.js