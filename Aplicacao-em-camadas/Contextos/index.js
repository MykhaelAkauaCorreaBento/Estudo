import { converteParaReal, converteParaEuro } from './funcoes/converteMoedas.js';
import exibirMoeda from './funcoes/formataMoedasConvertidas.js';

let conversor = 'real';

let dolar = '5.00';
let valor_convertido;

if (conversor == 'real') {
  valor_convertido = converteParaReal(dolar);
  valor_convertido = exibirMoeda(conversor, valor_convertido);
} else if (conversor == 'euro') {
  valor_convertido = converteParaEuro(dolar);
  valor_convertido = exibirMoeda(conversor, valor_convertido);
}

console.log("Valor em Dólar: " + exibirMoeda('dolar', dolar));
console.log("Valor convertido: " + valor_convertido);

//index.js

//Obs.:A utilização de camadas é parte importante para o programador
//que deseja construir aplicações bem organizadas. Saber o momento certo
//de se criar uma camada pode ser a diferença entre uma aplicação de fácil
//manutenção e uma aplicação confusa e difícil de manter.