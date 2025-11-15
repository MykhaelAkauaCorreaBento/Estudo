//(----Retornando um timestamp e o fuso horário----)

//Métodos para retornar a data em UTC

//(----Retorna o timestamp da data----)
const dataAtual = new Date();

console.log(dataAtual.getTime());//Vai imprimir 1763224260278.
//1763224260278 representa quantos milissegundos se passaram desde
//1970-01-0 00:00:00 até 2025-11-15 13:32:20.


//(----Retorna em minutos a diferença de fuso horário----)

console.log(dataAtual.getTimezoneOffset());//180
//Representa 180 minutos de diferença de fuso horário do 
//computador(Rio Grande do Sul) para UTC.
//Obs:Para saber a diferença de fuso horário do sistema para
//o UTC utilizamos o método .getTimezoneOffset()


//(----Retorna o valor primitivo do objeto.----)
console.log(dataAtual.valueOf());//1763224768031
//Retorna o valor primitivo do objeto Date é um timestamp.

//Obs.:Os métodos getters do objeto Date retornam uma parte específica da data

//getTime.js