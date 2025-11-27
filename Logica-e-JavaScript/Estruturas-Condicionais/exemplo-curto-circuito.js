
//Refatorando um exemplo curto-circuito

//Exemplo de if convencional

let mensagem = '';
let itemEncontrado = true;

if (itemEncontrado){
    mensagem = 'item encontrado';
}
console.log(mensagem);



//Exemplo ret=fatorado com o curto-circuito

let mensagem1 = '';
let itemEncontrado1 = true; // true ou false

itemEncontrado1 && (mensagem1 = "Item encontrado");

console.log(mensagem1);

//Se a condição for true a mensagem exibida será 'Item encontrado'.
//Se a condição for false a mensagem exibida será uma string vazia.









