import {inverteMesAno, retornaHemisferio, retornaIntensidade} from "./funcoesLogicas.js";


//Imprime uma tabela com a lista de chuvas

const imprimeListaDeChuvas = (lista) => {
    console.log("\nNome da Chuva       - Intensidade - Hemisfério - Período");


    lista.forEach( imprimeChuva);

}


//Imprime uma linha de tabela de lista de chuvas


const imprimeChuva = (chuva) =>{
    const nome = chuva.nome.padEnd(27, ' ');

    let intensidade = retornaIntensidade(chuva.intensidade);
    let hemisferio = retornaHemisferio(chuva.declinacao);

    intensidade = intensidade.padEnd(11, ' ');
    hemisferio = hemisferio.padEnd(10, ' ');

    const dataInicio = inverteMesAno(chuva.inicio);
    const dataFim = inverteMesAno(chuva.fim);

    console.log(`${nome} - ${intensidade} - ${hemisferio} - ${dataInicio} à ${dataFim} `);
}


export default imprimeListaDeChuvas;