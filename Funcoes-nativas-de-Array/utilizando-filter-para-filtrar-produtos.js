//.filter()
//Existem casos em que selecionamos apenas alguns elementos de um array,
//e para isso utilizamos a função nativa filter.

//A função filter é utilizada para filtrar os elementos de um array e criar
//um novo array com apenas os elementos que atendem à condição. Por exemplo:

const produtos = [
    {id:1, nome:"Açucar", ativo:true, valor:2.00},
    {id:2, nome:"Álcool 70", ativo:false, valor:9.95},
    {id:3, nome:"Luvas descartáveis", ativo:false, valor:2.50},
    {id:3, nome:"papel toalha", ativo:true, valor:2.50},

];

function verificaProdutoativo (produto){//Caso o retorno seja true a função filter vai guardar o produto no novo array.
    return produto.ativo == true;
}

const produtosAtivos = produtos.filter(verificaProdutoativo);
console.log(produtosAtivos);

//Resultado

//[
//  { id: 1, nome: 'Açucar', ativo: true, valor: 2 },
//  { id: 3, nome: 'papel toalha', ativo: true, valor: 2.5 }
//]

//const produtosAtivos--> variável vai armazenar o novo array.
//produtos--> array que será percorrida.
//.filter--> função nativa.
//(verificaProdutoativo)--> Função que será executada.


//Executando a função verificaprodutoativo para cada elemento do array produtos.

//utilizando-filter-para-filtrar-produtos.js

