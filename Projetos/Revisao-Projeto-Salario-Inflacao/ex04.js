const salarioMinimo = [
    {Ano:2011, salario:545},
    {Ano:2012, salario:622},
    {Ano:2013, salario:678},
];

const inflacaoIPCA = [
    {Ano: 2011, salario: 545, IPCA: 6.50},
    {Ano: 2012, salario: 622, IPCA: 5.84},
    {Ano: 2013, salario: 678, IPCA: 5.91},
];

//função de calcular o percentual

function calcularPercentual(anterior, atual){

    const diferenca = atual - anterior;
    const percentual = (diferenca / anterior) * 100;
    return Number(percentual.toFixed(2));
}

//loop principal

for(let i = 0; i < salarioMinimo.length; i++){
    const Ano = salarioMinimo[i].Ano;
    const salario = salarioMinimo[i].salario;
    const IPCA = inflacaoIPCA[i].IPCA

    let aumento;
    let resultado;

    if(i === 0){
        //primeiro ano

        aumento = "-";
        resultado = "-";

    }else {
        const salarioAnterior = salarioMinimo[i - 1].salario;

        //cálculo de aumento percentual

        aumento = calcularPercentual(salarioAnterior, salario);

        // comparação

        if(aumento > IPCA){
            resultado = "Aumento mair que inflação";
        }else if(aumento < IPCA){
            resultado ="Inflação maior que aumento";
        }else{
            resultado = "Aumento igual à inflação";
        }
    }
    console.log(Ano);
    console.log(aumento);
    console.log(IPCA);
    console.log(resultado);

}