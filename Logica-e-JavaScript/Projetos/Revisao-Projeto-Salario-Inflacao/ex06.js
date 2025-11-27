// function
function compararIPCA(crescimento, ipca){
    if(crescimento > ipca){
        return "ganhou da inflação";
    }else if(crescimento < ipca){
        return "perdeu para a inflação";
    }else{
        return "empatou com a inflação";
    }
}
//array

const salarioMinimo = [

    { ano: 2010, salario: 510 },
    { ano: 2011, salario: 545 },
    { ano: 2012, salario: 622 },
];

const inflacaoIPCA = [

    { ano: 2010, IPCA: 5.91 },
    { ano: 2011, IPCA: 6.50 },
    { ano: 2012, IPCA: 5.84 },
];

// Função

function calcularPercentual(anterior, atual){
    const diferenca = atual - anterior;
    const percentual = (diferenca / anterior) * 100;
    return Number(percentual.toFixed(2));
}

//loop

for( let i = 1; i < salarioMinimo.length; i++){
    const ano = salarioMinimo[i].ano;
    const crescimento = calcularPercentual(salarioMinimo[i - 1].salario, salarioMinimo[i].salario);
    const ipca = inflacaoIPCA[i].IPCA;

    const resultado = compararIPCA(crescimento, ipca);

    console.log(ano);
    console.log(resultado);
}