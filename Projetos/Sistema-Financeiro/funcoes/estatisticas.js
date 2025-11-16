import { carregarDados} from "../database.js";

export function mostrarEstatisticas(){
    console.log("\n=== Estatísticas ===\n");

        const dados = carregarDados();
        
        if(dados.length === 0){
            console.log("nenhuma transação registrada.");
            return;
        }

        const entradas = dados.filter(t => t.tipo === "entrada");
        const saidas = dados.filter(t => t.tipo === "saida");
        

        const totalEntradas = entradas.reduce((acc, t) => acc + t.valor, 0);
        const totalSaidas = saidas.reduce((acc, t) => acc + t.valor, 0);

        const maiorEntrada = entradas.length > 0 ? Math.max(...entradas.map(t => t.valor)) : 0;
     
        const maiorSaida = saidas.length > 0 ? Math.max(...saidas.map(t => t.valor)) : 0;
        

        const mediaEntradas = entradas.length > 0 ? totalEntradas / entradas.length : 0;
        const mediaSaidas = saidas.length > 0 ? totalSaidas / saidas.length : 0;

        const saldo = totalEntradas - totalSaidas;

        console.log(`Total de transações: ${dados.length}`);
        console.log(`Total de entradas:   R$ ${totalEntradas.toFixed(2)}`);
        console.log(`Total de saídas:     R$ ${totalSaidas.toFixed(2)}`);
        console.log(`Saldo geral:         R$ ${saldo.toFixed(2)}`);
        console.log("----------------------------");
        console.log(`Maior entrada:       R$ ${maiorEntrada.toFixed(2)}`);
        console.log(`Maior saída:       R$ ${maiorSaida.toFixed(2)}`);
        console.log(`Média das entradas:       R$ ${mediaEntradas.toFixed(2)}`);
        console.log(`Média das saídas:       R$ ${mediaSaidas.toFixed(2)}`);
    
}