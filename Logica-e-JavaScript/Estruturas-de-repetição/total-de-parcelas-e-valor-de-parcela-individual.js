//Total de parcelas e valor de parcela individual

//total-de-parcelas-e-valor-de-parcela-individual.js

let valor_produto = 500;

for(let contador = 1; contador <= 5; contador++)
{
    let valor_parcela = valor_produto / contador;
    console.log("Nº de parcelas: " + contador + " Valor da parcela: R$" + valor_parcela.toFixed(2));
}