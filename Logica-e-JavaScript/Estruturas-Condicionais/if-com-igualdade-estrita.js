//If com igualdade(===) estrita

var x ="";

var y =0;

if(x === y){                         // Verifica se x e y são iguais e do mesmo tipo
    console.log("X e Y são iguais");
}
else{
    console.log("X e Y são diferentes");
}

//______________________________________________________________________________

//If com igualdade(==)

var x = "";
var y = 0;

if(x == y){ // aqui vai gerar uma anomalia pois a string ""é convertida
//  para false, o valor 0 é convertido para false, a condição retorna true,
//  pois false é igual a false.
    console.log("X e Y são iguais");
}
else{
    console.log("X e Y são diferentes");
}

//______________________________________________________________________________









