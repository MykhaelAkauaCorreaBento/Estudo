
//O operador de igualdade == compara dois valores e retorna true se eles forem iguais.


console.log(21 == 21); // vai imprimir true
console.log(120 == 100); // vai imprimir false


// Quando precisamos verificar se um valor é diferente do outro, utilizamos o operador de desigualdade !=.

console.log(11 != 21); // vai imprimir true
console.log(100 != 100); // vai imprimir false

//_______________________________________________________________________________________________________


// Esses operadores conseguem fazer a comparação, mesmo que os valores sejam de tipos diferentes

console.log("20" == 20); // true
console.log(true == 1); // true

// Nesse contexto do operador ==, a string "20" é igual ao number 20 e o booleano true é igual ao number 1.

//_______________________________________________________________________________________________________


// Operadores de igualdade e desigualdade estrita


// O operador de igualdade estrita (===) assim como o operador de igualdade (==),
// vai comparar se dois valores são iguais.
// A diferença entre os dois é que o operador === não faz conversão de tipo, ou seja,
// ele vai comparar se os dois valores são iguais tanto em valor quanto em tipo.

console.log("21" === 21); // o resultado será false
console.log(1 === true); // o resultado será false


// O mesmo vale para o operador de desigualdade estrita (!==).

console.log("21" !== 21); // o resultado será true
console.log(1 !== true); // o resultado será true


//_______________________________________________________________________________________________________


// null e undefined são iguais

console.log(null == undefined); // o resultado será true
console.log(null != undefined); // o resultado será false


//_______________________________________________________________________________________________________


//true é convertido para 1 e false para 0

true == 1 // o resultado será true
true != 1 // o resultado será false
false == 0 // o resultado será true
false != 0 // o resultado será false

// Mesmo que usar os operadores == e != pareça ser mais fácil, podemos ter alguns problemas em
// nossas validações, já que para eles não importa se os tipos são diferentes. O mesmo não vai
// ocorrer para os operadores === e !== já que com eles conseguimos ter precisão na nossa comparação.

//_______________________________________________________________________________________________________


//Conhecendo os operadores <, >, <=, >=

// menor que (<) verifica se um valor é menor que o outro.

24 < 99 // true
700 < 76 // false


// maior que (>) verifica se um valor é maior que o outro.

44 > 12 // true
898 > 3290 // false


// menor ou igual (<) verifica se um valor é menor ou igual ao outro.

24 <= 99 // true
24 <= 24 // true

40 <= 4 // false
40 <=40 // true


// maior ou igual (>) verifica se um valor é maior ou igual ao outro.

89 >= 89 // true
70>= 71 // false


// operadores =, == e === possuem significados diferentes que são:

//= significa que uma variável recebe ou é atribuída de um valor.

//== verifica se uma condição é igual a outra, fazendo conversão de tipo para isso.

// === verifica se uma condição é exatamente igual a outra tanto em tipo quanto em valor.

// ==, !=, <, >, <=, >=, ===, !== comparam dois dados e retorna um valor booleano true ou false.

