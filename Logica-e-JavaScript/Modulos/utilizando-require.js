//Utilizando require

//Uso de require, uma alternativa ao import/export;

//Há uma outra forma  ded exportar/importar funções e dados no JavaScript que é usando require.

//(---------Arquivo main.js---------)



//Recursos dos módulos importados.
const dados = require('./data/dados.js');
const funcao = require('./funcoes/funcoes.js');

let data_app = new Date();


//funcao.retorna_signo(dados.colecao_signos,--> consumo recursos dos módulos.
const nome_signo = funcao.retorna_signo(dados.colecao_signos, data_app);

console.log("O signo de hoje é: " + nome_signo);
//____________________________________________________________________________



//(---------Arquivo dados.js---------)

let colecao_signos = [
    {"Nome": "Aquário", "DataInicio": "01-20","DataFim":"02-18"},
    {"Nome": "Peixes", "DataInicio": "02-19","DataFim":"03-20"},
    {"Nome": "Áries", "DataInicio": "03-21","DataFim":"04-19"},
    {"Nome": "Touro", "DataInicio": "04-20","DataFim":"05-20"},
    {"Nome": "Gêmeos", "DataInicio": "05-21","DataFim":"06-21"},
    {"Nome": "Câncer", "DataInicio": "06-22","DataFim":"07-23"},
    {"Nome": "Leão", "DataInicio": "07-24","DataFim":"08-22"},
    {"Nome": "Virgem", "DataInicio": "08-23","DataFim":"09-22"},
    {"Nome": "Libra", "DataInicio": "09-23","DataFim":"10-22"},
    {"Nome": "Escorpião", "DataInicio": "10-23","DataFim":"11-21"},
    {"Nome": "Sagitário", "DataInicio": "11-22","DataFim":"12-21"},
    {"Nome": "Capricórnio", "DataInicio": "12-22","DataFim":"01-19"}
];


//Recurso de módulo exportado
module.exports ={
    colecao_signos
}
//_____________________________________________________________________________

//(---------Arquivo funcoes.js---------)

const verifica_data_range = (data, data_inicio, data_fim, tipo_comparacao) =>{
    if(tipo_comparacao == "and"){
        return (data >= data_inicio && data <= data_fim);
    }else if (tipo_comparacao == "or"){
        return (data >= data_inicio || data <= data_fim);
    }
}


const retorna_signo = (signos, data) =>{
    let ano = data.getFullYear();

    for(const signo of signos){
        let data_inicio_signo = new Date(ano + "-" + signo["DataInicio" + " 00:00:00"]);
        let data_fim_signo = new Date(ano + "-" + signo["DataFim"] + " 23:00:00");
        let tipo_comparacao = signo["DataInicio"] == "12:22" ? "or" : "and";

        if(verifica_data_range(data, data_inicio_signo, data_inicio_signo, tipo_comparacao)){
            return signo["Nome"];
        }
    }
}

//recurso do módulo exportado
module.exports{
    retorna_signo
}

//_____________________________________________________________________________


//Com a função require também podemos exportar um recurso do módulo e usá-lo
//em qualquer parte da aplicação.
//Basta importá-lo e depois usá-lo no local desejado.

//1º passo: exportar o recurso do módulo.
//2º passo: importar o recurso do módulo.
//3º passo: consumir o recurso do módulo.

//Obs.: quando se usa require, não há necessidade do arquivo package.json para configurar a aplicação.


//Por que usamos import neste exemplo?
//Import é a forma mais atual para se trabalhar com módulos no JavaScript.
//Contudo, é interessante conhecer a opção require,, pois você pode precisar trabalhar em um código legado que utiliza esse comando.

//_____________________________________________________________________________


//Quando trabalhamos com require, devemos exportar os recursos conforme o código abaixo:

module.exports = {
    colecao_signos
}



//E para importar esses recursos, fazemos como na código abaixo:

const dados = require('./data/dados.js');

//utilizando-require.js
