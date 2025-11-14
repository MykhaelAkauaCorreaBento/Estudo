//Projeto:aplicação que faz a comparação entre salário e inflação.



import entradaDados from 'readline-sync';

console.log("Escolha uma das alternativas: \n");
console.log("1 - Listar os salários mínimos de 2010 à 2020.");
console.log("2 - Listar os índices IPCA de 2010 à 2020.");
console.log("3 - Comparação entre o percentual de aumento salarial e o IPCA.\n");

let escolha = entradaDados.question("Digite o número de sua escolha: ");



let salarioMinimo = [
    { ano: 2010, salario: 510.00 },
    { ano: 2011, salario: 545.00 },
    { ano: 2012, salario: 622.00 },
    { ano: 2013, salario: 678.00 },
    { ano: 2014, salario: 724.00 },
    { ano: 2015, salario: 788.00 },
    { ano: 2016, salario: 880.00 },
    { ano: 2017, salario: 937.00 },
    { ano: 2018, salario: 954.00 },
    { ano: 2019, salario: 998.00 },
    { ano: 2020, salario: 1045.00 },
];

let inflacaoIPCA = [
    { ano: 2010, ipca: 5.91 },
    { ano: 2011, ipca: 6.50 },
    { ano: 2012, ipca: 5.84 },
    { ano: 2013, ipca: 5.91 },
    { ano: 2014, ipca: 6.41 },
    { ano: 2015, ipca: 10.67 },
    { ano: 2016, ipca: 6.29 },
    { ano: 2017, ipca: 2.95 },
    { ano: 2018, ipca: 3.75 },
    { ano: 2019, ipca: 4.31 },
    { ano: 2020, ipca: 4.52 },
];



if (escolha == 1) {

    for (let i = 0; i < salarioMinimo.length; i++) {

        let salario_formatado = salarioMinimo[i].salario
            .toFixed(2)
            .replace(".", ",");

        console.log("\nAno: ".padEnd(32, ".") + salarioMinimo[i].ano);
        console.log("Salário mínimo: ".padEnd(30, ".") + "R$ " + salario_formatado);
    }
}



else if (escolha == 2) {

    for (let i = 0; i < inflacaoIPCA.length; i++) {

        let ipca_formatado = inflacaoIPCA[i].ipca.toFixed(2).replace(".", ",");

        console.log("\nAno: ".padEnd(32, ".") + inflacaoIPCA[i].ano);
        console.log("Inflação IPCA: ".padEnd(30, ".") + ipca_formatado + "%");
    }
}



else if (escolha == 3) {

    for (let i = 0; i < salarioMinimo.length; i++) {

        let ano = salarioMinimo[i].ano;
        let salario = salarioMinimo[i].salario;
        let salario_formatado = salario.toFixed(2).replace(".", ",");

        // Crescimento
        let crescimento_formatado;

        if (i > 0) {
            let anterior = salarioMinimo[i - 1].salario;
            let diferenca = salario - anterior;
            let percentual = (diferenca / anterior) * 100;
            crescimento_formatado = percentual.toFixed(2).replace(".", ",") + "%";
        } else {
            crescimento_formatado = "-";
        }

        // IPCA
        let ipca = inflacaoIPCA[i].ipca;
        let ipca_formatado = ipca.toFixed(2).replace(".", ",");

        console.log("\nAno: ".padEnd(32, ".") + ano);
        console.log("Salário: ".padEnd(31, ".") + "R$ " + salario_formatado);
        console.log("Crescimento: ".padEnd(31, ".") + crescimento_formatado);
        console.log("Inflação IPCA: ".padEnd(31, ".") + ipca_formatado + "%");
    }
}



else {
    console.log("\nOpção inválida!");
}









//aplicacao-que-faz-a-comparacao-entre-salario-e-inflacao.js