import entradaDados from "readline-sync";

import {carregarDados, salvarDados} from "../database.js";

export  function adicionarTransacao(){
    const descricao = entradaDados.question("Descrição: ");

    ///
    let valor = entradaDados.question("Valor (use ponto, ex: 49.90): ");

    while(valor.trim() === "" || isNaN(valor)){
        console.log("Valor inválido! Digite um número válido.");
        valor = entradaDados.question("Valor (use ponto, ex: 49.90): ");
    }

    valor = Number(valor);
    ///






let tipo = entradaDados.question("Tipo (entrada/saida): ").toLowerCase();

//Garante que tipo seja válido

while(tipo !== "entrada" && tipo !== "saida"){
    console.log("Tipo inválido");
    tipo = entradaDados.question("Digite novamente (entrada/saida): ").toLowerCase();

}

//Data: se o usuário não informar, usar a atual

let dataInformada = entradaDados.question("Data (AAAA-MM-DD) ou Entre para usar hoje:  ");

let data;
if(dataInformada.trim()===""){
data = new Date().toISOString().slice(0, 10); // pega só YYYY-MM-DD
}else{
    data = dataInformada;
}

//criar objeto transação

const novaTransacao ={
    descricao,
    valor,
    tipo,
    data
};


// Carregar dado já existentes

let dados = carregarDados();

//Adicionar nova

dados.push(novaTransacao);

salvarDados(dados);

console.log("\nTransação adicionada com sucesso!");
}