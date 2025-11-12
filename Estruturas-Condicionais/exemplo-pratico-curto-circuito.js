
// Exemplo prático curto-circuito

// Declaração da constante nome

const nome = 'Mykhael';

// Imprime a variável nome se ela tiver pelo menos 1 caractere.

nome.length > 0 && console.log(nome);

//____________________________________________________________________________

// Organizando o código colocando a expressão em uma variavel.

//Declaração da constante nome.

const nome1 = "Mykhael";

//Aqui é verificado se o nome possui ao menos 1 caractere.
//Retorna true se a variável nome tiver pelo menos 1 caractere.
//Retorna false se a variável nome for vazia.
const nomeValido = nome1.length > 0;

//Imprime a variável nome se ela river pelo menos 2 caractere.
//Se a variável nome for vazia o console.log não será executado.
nomeValido && console.log(nome1);
















