
import entradaDados from 'readline-sync';

console.log("Escolha uma das alternativas: \n\n");
console.log("1 - Listar os salários minímos de 2010 à 2020.\n");
console.log("2 - Listar os índice IPCA de 2010 à 2020.\n");
console.log("3 - Comparação entre o percentual de aumento salarial e o IPCA.\n\n");
let escolha = entradaDados.question("Digite o número de sua escolha: ");


let salarioMinimo = [
    {ano:2010,salario:510.00},
    {ano:2011,salario:545.00},
    {ano:2012,salario:622.00},
    {ano:2013,salario:678.00},
    {ano:2014,salario:724.00},
    {ano:2015,salario:788.00},
    {ano:2016,salario:880.00},
    {ano:2017,salario:937.00},
    {ano:2018,salario:954.00},
    {ano:2019,salario:998.00},
    {ano:2020,salario:1045.00},
];

let inflacaoIPCA = [
    {ano:2010,ipca:5.91},
    {ano:2011,ipca:6.50},
    {ano:2012,ipca:5.84},
    {ano:2013,ipca:5.91},
    {ano:2014,ipca:6.41},
    {ano:2015,ipca:10.67},
    {ano:2016,ipca:6.29},
    {ano:2017,ipca:2.95},
    {ano:2018,ipca:3.75},
    {ano:2019,ipca:4.31},
    {ano:2020,ipca:4.52},
];
let i=0;
let ano = salarioMinimo[i].ano;
let salario = salarioMinimo[i].salario;

let total_formatado = salario.toFixed(2).replace(".",",");

//



let e = 0;
let ano_ipca = inflacaoIPCA[e].ano;
let ipca = inflacaoIPCA[e].ipca;

let ipca_formatado = ipca.toFixed(2).replace(".",",");


if (escolha == 1){

    for(let i = 0; i < salarioMinimo.length; i++){
        
    
        console.log("\nAno: ".padEnd(31, ".")+salarioMinimo[i].ano+"\n"+"Salário mínimo: ".padEnd(30, ".")+"R$ "+total_formatado);
    }
    
}
else if(escolha == 2){

    for(let e = 0; e < inflacaoIPCA.length; e++){

    console.log("\nAno: ".padEnd(31, ".") + inflacaoIPCA[e].ano +"\n"+ "Inflação IPCA: ".padEnd(30, ".") +ipca_formatado+"%\n");
    
    }
}
else if(escolha == 3){

    for(let i = 0; i < salarioMinimo.length; i++){
        
        let ano = salarioMinimo[i].ano;
        let salario = salarioMinimo[i].salario;

        let salario_anterior = i > 0 ? salarioMinimo[i - 1].salario: null;
        let crescimento_formatado;

        if(i > 0){
            let diferenca = salario - salario_anterior;
            let percentual = (diferenca / salario_anterior) * 100;
            crescimento_formatado = percentual.toFixed(2).replace(".",",") + "%";
        
        }else{
            crescimento_formatado = "-";
        }

        let ipca_inflacaoIPCA[i].ipca;
        let ipca_formatado = ipca.toFixed(2).replace(".",",");

        let salario_formatado = salario.toFixed(2).replace(".",",");

        
        console.log("\n");
        console.log("Ano: ".padEnd(31, ".")+ano);
        console.log("Salário: ".padEnd(31, ".")+"R$ "+ salario_formatado);
        console.log("Crescimento: ".padEnd(31, ".")+ crescimento_formatado);
        console.log("Inflação IPCA: ".padEnd(31, ".")+ ipca_formatado+"%")
    }


    
}
else{
    console.log("\nOpção inválida!");
}