//Exemplo prático padStart() e padEnd()

let label_nome = "Nome:";
let valor_nome = "Jorge Luiz";

let label_profissao = "Profissão";
let valor_profissao = "Professor";

let label_endereco ="Endereço:";
let valor_endereco ="Rua Cruzeiro do Sul";

console.log(label_nome.padEnd(25, ".") + valor_nome);
console.log(label_profissao.padEnd(25, ".") + valor_profissao);
console.log(label_endereco.padEnd(25, ".") + valor_endereco);

//Com os métodos padStart() e padEnd() é possível alinhar informações
// com a linguagem JavaScript de forma que a exibição dos
//dados não fique desordenada


//utilizando-alinhamento-padend.js
