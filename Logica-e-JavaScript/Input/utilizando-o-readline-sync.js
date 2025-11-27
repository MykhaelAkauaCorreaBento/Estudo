// Utilizando o readline-sync

import entradaDados from 'readline-sync';

let nome = entradaDados.question('Digite seu nome: ')
console.log("Olá, "+nome);



//Há uma limitação no Windows, caracteres acentuados podem não ser exibidos corretamente
//no prompt de comando(cmd). Para resolvê-lo podemos usar o comando chcp 65001 no prompt de comando.