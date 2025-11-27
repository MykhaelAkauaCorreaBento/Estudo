//Praticando

const dataUltimoAcesso= new Date('2025/11/11 17:00:00');
const dataAtual = new Date();


const hora = dataAtual.getHours();

const timeUltimoAcesso = dataUltimoAcesso.getTime();
const timeAtual = dataAtual.getTime();

const diferencaTime = timeAtual - timeUltimoAcesso;

const milissegundosHoras = 1000 * 60 * 60;

const milissegundosDias = milissegundosHoras * 24;

let mensagem = "";


if(hora < 6 || hora >= 18){
    mensagem = 'Boa noite\n';
}else if(hora >= 6 && hora < 12){
    mensagem = 'Bom dia\n';
}else{
    mensagem ='Boa tarde\n';
}

if(diferencaTime > milissegundosDias){
    mensagem += "Você está ausente há dias!!!";
}else if(diferencaTime > milissegundosHoras){
    mensagem += "Você está ausente há horas!!!";
}else{
    mensagem += "Que bom que ainda está aqui!";
}

console.log(mensagem);

 //Exemplo-criar-para-manipular-o-objeto-date.js