//Array com os meses abreviados

const meses = [
    "Janeiro", "Fevereiro", "Março", "Abril",
    "Maio", "Junho", "Julho", "Agosto",
    "Setembro", "Outubro","Novembro", "Dezembro",
];

function abreviar(mes){
    return mes.substr(0,3)
}

const mesesAbreviados = meses.map(abreviar);

console.log(mesesAbreviados);

//map é usado para criar um array a partir de outro contendo a mesma
//quantidade de elementos, porém com o valor alterado.

//Resultado

//[
//  'Jan', 'Fev', 'Mar',
//  'Abr', 'Mai', 'Jun',
//  'Jul', 'Ago', 'Set',
//  'Out', 'Nov', 'Dez'
//]

//array-com-os-meses-abreviados.js