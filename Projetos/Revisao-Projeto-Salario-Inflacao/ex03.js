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

for( let i = 0; i < salarioMinimo.length; i++){
    const Ano = salarioMinimo[i].Ano;
    const salario = salarioMinimo[i].salario;

     const  IPCA = inflacaoIPCA[i].IPCA;

console.log(Ano);
console.log(salario);
console.log(IPCA);

}

