//.forEach( )

//Uma forma fácil de percorrer um array é utilizando a função nativa forEach.
//Através dela conseguimos executar uma função para cada elemento do array.

//.forEach()

//A função forEach é usada para percorrer um array e executar uma função para
//cada elemento.

const produtos = [
    {id: 1, nome: 'Açucar', estoque: 100, valor: 2.00},
    {id: 2, nome: 'Álcool 70', estoque: 50, valor: 9.95},
    {id: 2, nome: 'Lucas descartáveis', estoque: 1000, valor: 2.50},
];

function imprimirProduto (produto){
console.log(produto.nome);
}

produtos.forEach(imprimirProduto);

//Executando a função'imprimirProduto' para cada elemento do array 'produtos'.



//produtos.forEach(imprimirProduto);
//A função nativa 'forEach' executando a função 'imprimirProduto'
//para cada elementro do array 'produtos'.

//imprimirProduto(produtos[0]);
//imprimirProduto(produtos[1]);
//imprimirProduto(produtos[2]);

//funcao-forEach.js
