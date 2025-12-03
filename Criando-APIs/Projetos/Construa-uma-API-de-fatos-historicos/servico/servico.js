import fatosHistoricos from "../dados/fatos.js";

function servicoBuscarFatoPorAno(ano) {
    return fatosHistoricos.find(item => item.Ano === ano) ||
           { Fato: "Nenhum fato encontrado para este ano" };
}

export default servicoBuscarFatoPorAno;