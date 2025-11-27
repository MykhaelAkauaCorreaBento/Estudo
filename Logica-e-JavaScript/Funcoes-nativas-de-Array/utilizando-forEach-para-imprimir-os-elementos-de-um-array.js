//Utilizando forEach para imprimir os elementos de um array

const carrinho = [

    {nome: 'Monster Hunter Wilds', qnt: 1, valor: 250},
    {nome: 'Pokémon Emerald', qnt: 1, valor: 300},
    {nome: 'Need for Speed Monst Wanted', qnt: 1, valor: 250},

];

function imprimirItem(produto, index){
    let texto = index + '-';
    texto += produto.qnt + ' UN ';
    texto += produto.nome + ' - ';
    texto += 'R$ '+ produto.valor + ' - ';
    texto += 'R$ ' + produto.qnt * produto.valor;

    console.log(texto);
}

carrinho.forEach(imprimirItem);

//Obs.:Utilize a função nativa forEach para executar uma função em cada elemento do array.


//utilizando-forEach-para-imprimir-os-elementos-de-um-array.js