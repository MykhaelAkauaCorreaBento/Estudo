import { carregarDados} from "../database.js";

export function filtrarEntradas(){
console.log("\n=== Entradas ===\n");

const dados = carregarDados();

const entradas = dados.filter(item => item.tipo === "entrada");

if(entradas.length === 0){
    console.log("Nenhuma entrada registrada."); //
    

    return;
}

for (let item of entradas){
    console.log(
        `${item.data} | ` +
        `${item.tipo.padEnd(7)} | ` +
        `${item.descricao.padEnd(20, ".")} ` +    
        `R$ ${item.valor.toFixed(2)}`
        );
}
}

export function filtrarSaidas(){
    console.log("\n=== Saídas ===\n");

    const dados = carregarDados();

    const saidas = dados.filter(item => item.tipo === "saida");//


    if(saidas.length === 0){
        console.log("Nenhuma saída registrada");
        return;
    }

    for (let item of saidas){
        console.log(
            `${item.data} | ` +
            `${item.tipo.padEnd(7)} | ` +
            `${item.descricao.padEnd(20, ".")} ` +
            `R$ ${item.valor.toFixed(2)}`
        
        );
    }

}