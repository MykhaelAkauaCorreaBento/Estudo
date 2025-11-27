//Exemplo prático

let produtos = [
    {id:1, nome:"Pizza", preco:50},
    {id:2, nome:"Macarronada", preco:25},
    {id:3, nome:"Lasanha", preco:45},
    {id:4, nome:"Nhoque", preco:30},
];

let desconto = 5;

for(let contador = 0; contador< produtos.length; contador++){//estrutura for

    let produto = produtos[contador];

    for(let propriedade in produto){ //estrutura fo..in
        if (propriedade == "preco"){
            let preco = propriedade;

            let novo_preco = produto[preco] - desconto;

            console.log("Preço atualizado R$"+ novo_preco+",00");
        }else{
            console.log(propriedade +": "+ produto[propriedade])
        }
    }
    console.log("\n");
}

//interando-uma-colecao-de-objeto-usando-for-in.js