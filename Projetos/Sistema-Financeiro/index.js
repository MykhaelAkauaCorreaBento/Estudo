import entradaDados from "readline-sync";
import{ carregarDados, salvarDados} from "./database.js";
import{ adicionarTransacao} from "./funcoes/adicionar.js";
import { listarTransacoes } from "./funcoes/listar.js";
import {filtrarEntradas, filtrarSaidas} from "./funcoes/filtrar.js";
import {mostrarSaldo} from "./funcoes/saldo.js";
import {buscarTransacoes} from "./funcoes/buscar.js";
import {mostrarEstatisticas} from "./funcoes/estatisticas.js";

function exibirMenu(){
    console.log("\n===== Sistema Financeiro =====");
    console.log("1 - Adicionar transação");
    console.log("2 - Listar todas as transações");
    console.log("3 - Filtrar entradas");
    console.log("4 - Filtrar saídas");
    console.log("5 - Mostrar saldo geral");
    console.log("6 - Buscar transações");
    console.log("7 - Estatísticas");
    console.log("0 - sair");
    console.log("=================================");
}

let executando = true;

while (executando){

    exibirMenu();

    let opcao = entradaDados.question("\nEscolha uma opção: ");

    switch(opcao){

        case "1":
            adicionarTransacao();
            break;

        case "2":
            listarTransacoes();
            break;

        case "3":
            filtrarEntradas();
            break;

        case "4":
            filtrarSaidas();
            break;

        case "5":
            mostrarSaldo();
            break;

        case "6":
            buscarTransacoes();
            break;

        case "7":
            mostrarEstatisticas();
            break;

        case "0":
            console.log("[Saindo do sistema...]");
            executando = false
            break;

        default:
            console.log("\nOpção inválida");
        
    }
}