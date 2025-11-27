import { carregarDados} from "../database.js";

export function mostrarSaldo(){
    console.log("\n=== Saldo Geral ===\n");

    const dados = carregarDados();

    if (dados.length === 0){
        console.log("Nenhuma transaçao registrada.");
        return;
    }

    let totalEntradas = 0;
    let totalSaidas = 0;

    for (let item of dados){
        if(item.tipo === "entrada"){
            totalEntradas += item.valor;
        }else if (item.tipo === "saida"){
            totalSaidas += item.valor;
        }
    }

    const saldo = totalEntradas - totalSaidas;

    console.log(`Entradas: R$ ${totalEntradas.toFixed(2)}`);
    console.log(`Saídas:   R$ ${totalSaidas.toFixed(2)}`);
    console.log("---------------------------");
    console.log(`Saldo:    R$ ${saldo.toFixed(2)}`);
}