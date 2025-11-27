//exemplo prático 2

let base = 16;
let altura = 8;

let area = (base * altura) / 2;

console.log("A área do triângulo é:" +area);

//O primeiro passo aqui é observar o código e identificar os contextos
//existentes nele com base nas semelhanças entre seus objetivos.

//Aqui é possível encontrar dois contextos:


//Contexto do cálculo da área
//Se observamos com atenção, é possível perceber que as variáveis base e altura
//são declaradas com o objetivo de serem usadas no cálculo da área do triângulo.
//E temos o cálculo, que é associado a variável area.
//Essas três linhas representam o contexto do cálculo da área pois todas elas são
//utilizadas no cálculo da área do triângulo.
let base = 16;

let altura = 8;

let area = (base * altura) / 2;


//Contexto de exibição
//A última linha do código. Foi colocada em outro contexto pois seu objetivo
//é diferente das outras.
//O único objetivo dessa linha de código é exibir o resultado final,
//por isso ela fica no contexto de exibição.

console.log("A área do triângulo é:"+area);


//Quando observamos o código com atenção é possível encontrar diferentes
//contextos mesmo em situações simples como essa.

//exemplo-pratico-1.js