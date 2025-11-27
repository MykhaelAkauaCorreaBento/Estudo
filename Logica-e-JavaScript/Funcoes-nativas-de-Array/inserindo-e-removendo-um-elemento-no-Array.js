//Inserindo e removendo um elemento no array

//.push função nativa

const diasDaSemana = [
    "domingo",
    "segunda-feira",
    "terça-feira",
    "quarta-feira",
    "quinta-feira",
    "sexta-feira",
];

diasDaSemana.push("sábado");
//push inserindo elemento no array.

console.log(diasDaSemana.length);



//Após inserido um elemento pode ser removido utilizando a função nativa splice. 

//.splice função nativa

//A função splice remove um ou mais elementos de uma array.

diasDaSemana.splice(2,3);

console.log(diasDaSemana.length);

//A função splice recebe dois parâmetro
//A posição inicial(onde está o 2) e quantos elementos serão removidos(onde está o 3).

//inserindo-e-removendo-um-elemento-no-Array.js