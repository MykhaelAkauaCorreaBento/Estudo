//Exemplo for..in

let carro = {nome:"Argo", marca:"Fiat", preco:70000, ano:2024};

let percentual_desconto = 5;

for(let propriedade in carro){
    if(propriedade == "preco"){


        //A condição que verifica se a propriedade do carro é igual a "preco".
        let preco = propriedade;


        //Se for igual,calcula e exibe o novo preço do carro.
        let desconto = (carro[preco] * percentual_desconto) / 100;

        let novo_preco = carro[preco]-desconto;

        console.log("novo preço: R$" + novo_preco+",00");
    }else{

        //Se não for igual, exibe a propriedade do carro.
        console.log(propriedade+": "+ carro[propriedade]);
    }
}
//exemplo-pratico-compra-do-carro-for-in.js
