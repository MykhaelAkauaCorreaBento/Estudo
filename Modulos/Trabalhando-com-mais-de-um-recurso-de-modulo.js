//Trabalhando com mais de um recurso de módulo
//Importação/Exportação de recursos de módulos


//Antes

const somaNumeros= (num_1, num_2) => {
    return num_1 + num_2;
}

export default somaNumeros;



//Depois

const somaNumeros1 = (num_1, num_2) => {
    return num_1 + num_2;
}

const subtracaoNumeros = (num_1, num_2) => {
    return num_1 - num_2;
}

export {somaNumeros1, subtracaoNumeros}

//Para exportar mais de uma função, removemos a palavra-chave "default" porque
//não vamos ter nunhum recurso padrão no módulo e colocamos as funções para
//serem exportadas entres chaves.






//Agora, vamos ver como importar esses recursos do módulo.

//Antes

import somaNumeros1 from './funcoes.js';



//Depois

import {somaNumeros1, subtracaoNumeros} from './funcoes.js';

//Agora para importar os recursos dos módulos precisamos colocá-los dentro de chaves.



//Obs.: Ao exportar múltiplos recursos por módulo é necessário colocá-los
//dentro de chaves após o comando export: 

export { recurso_1, recurso_2 }


//Para importar múltiplos recursos por módulo é necessário colocá-los dentro
//de chaves após o comando import:

import { recurso_1, recurso_2 } from modulo
//Trabalhando-com-mais-de-um-recurso-de-modulo.js