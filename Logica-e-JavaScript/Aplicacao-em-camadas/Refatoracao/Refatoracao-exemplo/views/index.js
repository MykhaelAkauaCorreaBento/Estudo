//index.js

import converteCelsiusParaFahrenheit from '../services/funcoes/convertetemperatura.js';
import retornaStatusTemperaturaFahrenheit from '../services/funcoes/statustemperatura.js';

let celsius = 25;

let resultado = converteCelsiusParaFahrenheit(celsius);
let statusResultado = retornaStatusTemperaturaFahrenheit(resultado);

console.log(resultado+'Fº');
console.log(statusResultado);