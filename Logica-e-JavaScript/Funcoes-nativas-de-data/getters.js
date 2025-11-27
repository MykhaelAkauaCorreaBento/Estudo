//(----Getters----)

//Por se tratar de um objeto, uma data possui métodos que retornam um
//valor específico da data.

//Gettes métodos do objeto Date

//O objeto do tipo Date passui funções nativas que são utilizads para retornar um valor referente a data.
//Essas funções são chamadas de métodos.

//Alguns dos métodos gettes usados para retornar um valor do objeto Date:

//(----Data atual----)
const dataAtual = new Date();//Data atual 2025-11-15T15:42:36.396Z
console.log(dataAtual);

//(----Retorna o ano----)
console.log(dataAtual.getFullYear());//2025 Ano

//(----Retorna o mês(0 à 11)----)
console.log(dataAtual.getMonth());// 10 representa o mês de novembro.

//(----Retorna o dia da semana(0 à 6)----)
console.log(dataAtual.getDay());//6 representa sábado.

//(----Retorna o dia do mês----)
console.log(dataAtual.getDate());//15 dia

//(----Retorna a hora(0 à 23)----)
console.log(dataAtual.getHours());//12 hora

//(----Retorna os minutos(0 à 59)----)
console.log(dataAtual.getMinutes());//51 minutos

//(----Retorna os segundos(0 à 59)----)
console.log(dataAtual.getSeconds());//54 segundos

//(----Retorna os milissegundos(0 à 999----)
console.log(dataAtual.getMilliseconds());//184 milissegundos

//getters.js