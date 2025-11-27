//Exemplo prático

const produto = {
    nome: " Monster Hunter Wilds", qnt: 1, valor: 270
};

const carrinho =[
    {nome: "Yu-Gi-OH Duelist of The Roses", qnt: 1, valor: 250},
    {nome: "Pokémon Legends Z-A", qnt: 1, valor: 300},
];

//Inserir o produto no carrinho
carrinho.push(produto);

//Remove o item "Pokémon Legends Z-A"
carrinho.splice(1,1);

//Revome todos os elementos do carrinho

const totalElementos = carrinho.length;

carrinho.splice(0,totalElementos);

console.log(carrinho.length);

//As funções nativas usadas para inserir ou remover um elemento são
//comumente usadas na manipulação de um array.


//exemplo-pratico-de-funcoes-array.js