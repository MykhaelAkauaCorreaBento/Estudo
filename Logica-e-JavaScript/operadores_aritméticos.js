var quatidadeVagas = 2+ 5;

var contratados = 7 - 2;

var valorContribuição = 2500 * 0.10;

var primeiraParcela = 2500 / 2;

var resto1 = 15 % 4;

var resto2 = 3 % 1.2;

console.log(quatidadeVagas);

console.log(contratados);

console.log(valorContribuição);

console.log(primeiraParcela);

console.log(resto1);

console.log(resto2);



// Eles são adição (+), subtração (-), multiplicação (*), divisão (/) e módulo (%).

// Usar o operador módulo com números de ponto flutuante requer um pouco mais de atenção.

// Se você fizer a divisão, 3 / 1.2 dá 2.5, o que pode levar a acreditar que módulo deveria retornar 0.5.

// O resultado é 0.6 pois o operador módulo executa uma divisão com resto. Veja:

// 3 / 1.2 = 2, pois 1.2 'cabe' 2 vezes dentro do número 3. 2 x 1.2 = 2.4. Sendo assim, o resto da divisão será 0.6, pois 3 - 2.4 = 0.6.

// Por isso, 3 % 1.2 = 0.6.

//Este operador pode ser usado para verificar se um número é par. Para fazer isso, basta verificar se o número dividido por 2 gera um resultado inteiro e resto zero (0).


var verificarSeEPar = 20 % 2 == 0;

console.log(verificarSeEPar);

// Neste exemplo, 20 dividido por 2 dá resultado 10, que é inteiro, e resto 0. Por isso ele é um número par e a variável verificaSeEPar terá o valor true.



var num1 = 5;

var num2 = 6;

var resultado = num1 + num2;

console.log("Resultado: " +resultado);

// Além de ser usado para somar número, o operador de adição (+) também pode juntar strings.

//







