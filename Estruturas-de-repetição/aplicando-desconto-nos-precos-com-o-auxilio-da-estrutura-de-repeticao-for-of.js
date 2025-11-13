//exemplo onde aplicamos o desconto nos preços dos produtos com o auxílio
//da estrutura de repetição for .. of.


//Array de produtos
let produtos_array =[
    {id:1, nome:"mouse",      preco:  50},
    {id:2, nome:"teclado",    preco:  90},
    {id:3, nome:"monitor",    preco: 350},
    {id:4, nome:"computador", preco:2500},
    {id:5, nome:"nobreak",    preco: 600},
];
//


let percentual_desconto = 10;


//Percorrendo o array para impreimir o novo  preço dos produtos.
for(let produto of produtos_array){
    
    
    //Guardando o nome e o preço do produto nas variáveis 'nome' e 'preco'.
    let nome = produto.nome;
    let preco = produto.preco;
    //

    //Calculando o valor do desconto e o novo preço do produto.
    let valor_desconto = (preco * percentual_desconto / 100)
    let novo_preco = preco - valor_desconto;
    //
    console.log("Novo valor do produto "+ nome+": R$"+novo_preco+",00");
}
//


//aplicando-desconto-nos-precos-com-o-auxilio-da-estrutura-de-repeticao-for-of.js