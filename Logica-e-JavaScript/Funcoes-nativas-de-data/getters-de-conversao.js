//(----Getters de conversão----)

const dataAtual = new Date();

//(----Retorna uma string que representa o bjeto----)
console.log(dataAtual.toString()); 
//vai imprimir Sat Nov 15 2025 13:58:13 GMT-0300 (Horário Padrão de Brasília)



//(----Retorna uma string com a data----)
console.log(dataAtual.toDateString());
//Vai imprimir Sat Nov 15 2025

//(----Retornar uma string com o tempo----)
console.log(dataAtual.toTimeString());
//Vai imprimir 14:02:20 GMT-0300 (Horário Padrão de Brasília)

//(----Retorna uma string com um formato universal(ISO 8601----)
console.log(dataAtual.toISOString());
//Vai imprimir 2025-11-15T17:03:51.606Z
//Obs.: O toISOString sempre vai retornar com o fuso horário 0.
//Exemplo: agora são 14:06 ele retornará 17:06.

//(----Retorna uma string com apenas a data e o tempo----)
console.log(dataAtual.toLocaleString());
//Vai imprimir 15/11/2025, 14:10:31


//(----Retorna uma string com a data apenas----)
console.log(dataAtual.toLocaleDateString());
//vai imprimir 15/11/2025


//(----Retorna uma string com o tempo apenas----)
console.log(dataAtual.toLocaleTimeString());
//Vai imprimir 14:13:11


//Obs.:Os métodos toLocaleString, toLocaleDateString e toLocaleTimeString
//permitem retornar uma string personalizada




//getters-de-conversao.js