//Exemplo prático
//estrutura de repetição do .. while para calcular o valor da mensalidade
//de acordo com o total de dias de atraso. os valores da multa são 
//exibidos de acordo com os dias de atraso.

let valor_mensalidade = 100;
let taxa_multa = 0.02; //2%
let total_dias = 10;
let contador = 1;

do{

    let dias_atraso = contador;

    let valor_multa =valor_mensalidade * taxa_multa * dias_atraso;

    let novo_valor_mensalidade = valor_mensalidade + valor_multa;

    console.log("Dia(s) de atraso: " + dias_atraso + " mensalidade atualizada: R$" + novo_valor_mensalidade + ",00");

    contador++;
}while(contador < total_dias);

//exemplo-pratico-do-while-para-calcular-mensalidade-de-acordo-com-o-total-de-dias-de-atraso.js


