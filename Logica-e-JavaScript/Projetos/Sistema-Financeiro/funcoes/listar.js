import { carregarDados} from "../database.js";

export function listarTransacoes(){
    console.log("\n=== Lista de Transações ===\n");

    const dados = carregarDados();

    if(dados.length === 0){
        console.log("nenhuma transação registrada.")
        return;
    }
    for(let item of dados){
        console.log(`${item.data} | ` +
            `${item.tipo.padEnd(7)} | ` +
            `${item.descricao.padEnd(20, ".")} ` +
            `R$ ${item.valor.toFixed(2)}`);
    }
}