const salarioMinimo = [

    {Ano:2011, salario:545},
    {Ano:2012, salario:622},
    {Ano:2013, salario:678},
];

function calcularPercentual(anterior, atual){

    const diferenca = atual - anterior;

    const percentual = (diferenca / anterior) * 100;

    return Number(percentual.toFixed(2));

}

for(let i = 0; i < salarioMinimo.length; i++){

    const Ano = salarioMinimo[i].Ano;
    const salario = salarioMinimo[i].salario;

    let crescimento;

    if( i > 0){
        const salarioAnterior = salarioMinimo [i -1].salario;
        crescimento = calcularPercentual(salarioAnterior, salario) + "%";
    }else{
        crescimento ="-";
    }
    console.log(crescimento);
}



