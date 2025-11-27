//Módulos

//Entendendo o que são módulos.

//É o nome usado para JavaScrip para arquivos que contém funções ou dados
//exportados com o comando export.

//exemplo:

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

//Exportando o recurso do módulo

export default colecao_signos;

//Quando exportamos um recurso de módulo, podemos usá-lo em qualquer parte da aplicação. Basta importar esse recurso e depois usá-lo no local desejado.


//Exemplo.

//1º passo: exportar o recurso de módulo.

//arquivo dados.js
export default colecao_signos;


//2º passo: importar o recurso do módedlo.

//arquivo main.js
import colecao_signos from './funcoes/funcoes';

//3º passo: consumir o recurso do módelo.

const nome_signo = retorna_signo(colecao_signos, data_app);

//Obs.:

//Para usar um recurso de módulo siga os passos a seguir:
//exporte o recurso no arquivo onde foi criado.
//importe o recurso no arquivo onde será usado.
//após importar, basta usar o recurso através do seu nome.