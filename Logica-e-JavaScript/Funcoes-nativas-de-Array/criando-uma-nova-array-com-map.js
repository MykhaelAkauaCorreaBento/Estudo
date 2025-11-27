// .map( )

//A função nativa (método) map é muito utilizada quando queremos criar um array
//a partir de outro. Esse novo array possui a mesma quantidade de elementos,
//porém o valor do elemento será diferente do original.

//Exemplo:

const produtosCadastrados = [
    {id:1, nome:"Açucar", estoque:100, valor:2.00},
    {id:2, nome:"Álcool 70", estoque:50, valor:9.95},
    {id:3, nome:"Luvas descartáveis", estoque:1000, valor:2.50},
];

function retornaProduto(produto){//A função retornaProduto retorna um objeto com apenas o nome e valor produto.
    const produtoExibicao ={
        nome: produto.nome,
        valor: produto.valor
    }
    return produtoExibicao;
}

const produtoExibicao = produtosCadastrados.map(retornaProduto);//Executando a função retonaProduto
//para cada elemento do array produtoCadastrados.

//const produtoExibicao --> variável vai armazenar o novo array.
//produtosCadastrados --> array que será percorrido.
//.map --> Função nativa.
//(retornaProduto) --> Função que será executada.


console.log(produtoExibicao);

//Criamos um novo array porém que só possui o nome e o valor de cada produto.

//[
//  { nome: 'Açucar', valor: 2 },
//  { nome: 'Álcool 70', valor: 9.95 },
//  { nome: 'Luvas descartáveis', valor: 2.5 }
//]

//criando-uma-nova-array-com-map.js