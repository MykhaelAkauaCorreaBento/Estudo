//(Setters)

//Método do objeto Date

const dataAtual = new Date();

console.log(dataAtual.setFullYear(1998));
console.log(dataAtual.setMonth(10));
console.log(dataAtual.setDate(11));
console.log(dataAtual.setHours(9));
console.log(dataAtual.setMinutes(30));
console.log(dataAtual.setSeconds(59));
console.log(dataAtual.setMilliseconds(11));


//Os métodos setters são usados para alterar uma informação do objeto.
//Ela pode ser referente a data ou a hora.
//Além da data (ano, mês e dia) também podemos alterar as informações
//sobre a hora.

//____________________________________________________________________________

//Assim como os getters, para cada método setter acima existe um similar
//para setar o valor UTC.

console.log(dataAtual.setUTCFullYear(1998));
console.log(dataAtual.setUTCMonth(10));
console.log(dataAtual.setUTCDate(11));
console.log(dataAtual.setUTCHours(9));
console.log(dataAtual.setUTCMinutes(30));
console.log(dataAtual.setUTCSeconds(59));
console.log(dataAtual.setUTCMilliseconds(11));

//____________________________________________________________________________

//Outro método que pode ser utilizado para alterar uma data é o setTime()
//(----Altera o timestamp da data----)

const dataAtual1 = new Date("2025-11-11 01:05:09");
console.log(dataAtual.toDateString());

console.log(dataAtual.setTime(911154684491));
console.log(dataAtual.toDateString());

//Obs.: O método .setTime() altera uma data através de um timestamp
//Os métodos setters do objeto Date alteram uma parte específica da data

//setters.js