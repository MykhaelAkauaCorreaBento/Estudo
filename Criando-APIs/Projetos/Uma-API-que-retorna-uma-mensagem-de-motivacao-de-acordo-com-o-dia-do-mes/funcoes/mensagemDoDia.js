let dados = require("../dados/dados.js");

function retornarMensagemDoDia(dia){
    return dados.frases[dia - 1];
}

exports.retornarMensagemDoDia = retornarMensagemDoDia;