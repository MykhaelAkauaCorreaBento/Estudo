//Exercícios

// 1. Função que recebe nome e retorna mensagem
const saudacao = (nome) => `Olá, ${nome}! Bem-vindo ao JavaScript!`;
console.log(saudacao("Mykhael"));

// 2. Função que verifica se é maior de idade
const maiorDeIdade = (idade) => {
  return idade >= 18 ? "Maior de idade" : "Menor de idade";
};
console.log(maiorDeIdade(20));

// 3. Loop que imprime 1 a 10
for (let i = 1; i <= 10; i++) {
  console.log(i);
}