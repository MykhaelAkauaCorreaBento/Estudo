import retornaProximosFeriados from "./servico/retornaFeriados.js";
import imprimeFeriados from "./exibicao/imprimeFeriados.js";

console.log("\nOs próximos feriados serão:\n")

let numeroFeriados = 3;

let proximosFeriados = retornaProximosFeriados(numeroFeriados);
imprimeFeriados(proximosFeriados);