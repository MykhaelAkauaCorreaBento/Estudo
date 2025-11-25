import retornaSerieDia from './funcoes/retornoSerie.js';

let data = new Date();
let diaSemana = data.getDay();

let serieDoDia = retornaSerieDia(diaSemana);

console.log("Serie do dia: "+serieDoDia);

//O exemplo que vimos nessa aula é a forma mais simples que uma aplicação
//em camadas pode ter. E veja que mesmo em aplicações pequenas e simples
//a separação em camadas consegue deixar o código mais organizado, 
//facilitando ainda mais a sua manutenção.