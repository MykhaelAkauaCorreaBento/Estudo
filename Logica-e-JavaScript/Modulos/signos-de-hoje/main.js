import colecao_signos from './dados.js';
import  retorna_signos from './funcao/funcoes.js';

let data_app = new Date();

const nome_signo = retorna_signos(colecao_signos, data_app);

console.log("O signo de hoje é :" + nome_signo);