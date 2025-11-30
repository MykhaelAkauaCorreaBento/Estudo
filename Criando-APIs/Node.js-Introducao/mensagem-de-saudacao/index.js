
//Instaciamos o objeto Date
let data = new Date();


//Utilizamos a instância para recuperar a hora e minutos.
let hora = data.getHours();

let min = data.getMinutes();


//Definimos a mensagem de saudação de acordo com a hora do dia.
let saudacao;

if(hora <= 11){
    saudacao = "Bom dia";
}else if(hora <= 17){
    saudacao = "Boa tarde";
}else{
    saudacao = "Boa noite";
}

//Exibimos a mensagem no console.

console.log("Ola: "+ saudacao);
console.log("Agora são " + hora + " horas e " + min + " minutos.");