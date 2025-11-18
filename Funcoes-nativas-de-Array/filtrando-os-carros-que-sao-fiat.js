//Exemplo


const carros = [
    {marca: "Fiat", modelo:"Uno",    anoFabricacao:2015},
    {marca: "GM",   modelo:"Onix",   anoFabricacao:2018},
    {marca: "Ford", modelo:"KA+",    anoFabricacao:2018},
    {marca: "Fiat", modelo:"Cronos", anoFabricacao:2020},
   
];

function retornaCarroFiat(carro){
    return (carro.marca == "Fiat");
};

const carrosFiat = carros.filter(retornaCarroFiat);
console.log(carrosFiat);


//Obs.:A função filter permite filtrar um array utilizando uma função para isso.

//filtrando-os-carros-que-sao-fiat.js