// Arrays do projeto

const salarioMinimo= [
    { ano: 2010, salario: 510 },
    { ano: 2011, salario: 545 },
    { ano: 2012, salario: 622 },
];

const inflacaoIPCA = [

    { ano: 2010, IPCA: 5.91 },
    { ano: 2011, IPCA: 6.50 },
    { ano: 2012, IPCA: 5.84 },

];

// função

function calcularPercentual(anterior, atual){

    const diferenca = atual - anterior;
    const percentual = (diferenca / anterior) * 100;
    return Number(percentual.toFixed(2));

}

let maiorAumento = 0;
let anoMaiorAumento = null;

let maiorIPCA = 0;
let anoMaiorIPCA = null;

//Loop principal

for(let i = 0; i < salarioMinimo.length; i++){
    
    //IPCA: comparação 
    const ipcaAno = inflacaoIPCA[i].IPCA;


    if (ipcaAno > maiorIPCA){
        maiorIPCA = ipcaAno;
        anoMaiorIPCA = inflacaoIPCA[i].ano;
    }
    // aumento salaria
    if( i > 0){
        const salarioAtual = salarioMinimo[i].salario;
        const salarioAnterior = salarioMinimo[i - 1].salario;
        const aumento = calcularPercentual(salarioAnterior, salarioAtual);
        
        if(aumento > maiorAumento){
            maiorAumento = aumento;
            anoMaiorAumento = salarioMinimo[i].ano;
        }

    }
}

console.log(anoMaiorAumento);
console.log(anoMaiorIPCA);
