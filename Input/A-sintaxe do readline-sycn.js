import entradaDados from 'readline-sycn';

let variavel = entradaDados.question("Mensagem");

//Para implementar o input, precisamos acessar uma função chamada "question."
//Essa função faz parte do readline-sycn.

//Para acessar recursos do plugin utilizamos o apelido que demos no momento da importação.
// import "entradaDados" from 'readline-sycn'; (no caso entradaDados).

// Seguindo o apelido que definimos.
// let variavel ="entradaDados".question("Mensagem");
//Obs.: estou colocando "" entradaDados para eu saber o passo a passo., não precisa.
//Estou fazendo apenas anotaçoes para mim, acho seja necessário revisar.
// Basta olhar o código correto na linha 1,2 e 3.

//É necessáio declarar uma variável. pois é ela quem vai armazenar o valor digitado pelo usuário.

// "let variavel" = entradaDados.question("Mensagem");
// o código correto ficaria assim: let variavel = entradaDados.question("mensagem");

// Em seguida, utilizamos o apelido definido no import para chamar o plugin.
// no caso seria entradaDados.
//Através dele, chamamos a função "question". Ela faz parte do realine-sycn, é ela quem implementa o input.

// Ficaria assim: exemplo

import entradaDados from 'readline-sync';

let idade = entradaDados.question('Digite sua idade');
console.log("Você tem "+idade+" anos de idade");




