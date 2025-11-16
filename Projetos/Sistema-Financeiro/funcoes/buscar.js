import entradaDados from "readline-sync";
import { carregarDados } from "../database.js";

export function buscarTransacoes() {
    console.log("\n=== Buscar Transações ===\n");

    const dados = carregarDados();

    if (dados.length === 0) {
        console.log("\nNenhuma transação registrada.");
        return;
    }

    const termo = entradaDados
        .question("Digite um termo da descrição: ")
        .toLowerCase();

    const resultados = dados.filter(item =>
        item.descricao.toLowerCase().includes(termo)
    );

    if (resultados.length === 0) {
        console.log("\nNenhuma transação encontrada.");
        return;
    }

    console.log(`\n🔎 Encontradas ${resultados.length} transações:\n`);

    for (let item of resultados) {

        
        if (item.valor === null || isNaN(item.valor)) {
            console.log(`⚠ Transação ignorada (valor inválido): ${item.descricao}`);
            continue;
        }

        console.log(
            `${item.data} | ` +
            `${item.tipo.padEnd(7)} | ` +
            `${item.descricao.padEnd(20, ".")} ` +
            `R$ ${item.valor.toFixed(2)}`
        );
    }
}