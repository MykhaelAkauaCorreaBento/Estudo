// Exemplo prático
var aluno_academia = {
    id:10,
    nome:"Mykhael Bento",
    altura:1.70,
    peso:60
};


var nome_aluno = aluno_academia.nome;
var peso_aluno = aluno_academia.peso;
var altura_aluno = aluno_academia.altura;

var imc_aluno = (peso_aluno / (altura_aluno * altura_aluno)).toFixed(2);

console.log("O IMC do aluno é de "+ imc_aluno);

if(imc_aluno < 18.5){
    console.log("O aluno "+ nome_aluno + "está abaixo do peso");
}else if(imc_aluno >= 18.5 && imc_aluno <= 24.99){
    console.log("O aluno "+ nome_aluno+" está com o peso normal");
}else{
    console.log("O aluno "+nome_aluno+" está acima do peso");
}


// toFixed(2) limita a quantidade de casas decimais que um número tem. No caso usei 2, então ficou 20.76
















