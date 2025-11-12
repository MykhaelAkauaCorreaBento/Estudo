//Exemplo pratico com igualdade estrita(===)

let resposta_usuario ="";

if(resposta_usuario == 0){
    console.log("Resposta correta");
}
else{
    console,log("Resposta incorreta");
}


//Mesmo respondendo errado, a resposta do usuário foi considerada correta.
//Agora vou criar o mesmo código usando ====


let resposta_usuario1 ="";

if(resposta_usuario1 === 0){
    console.log("Resposta correta");
}
else{
    console.log("Resposta incorreta");
}

//Agora vai informar que a resposta está incorreta, pois além de considerar 
// o valor, também será considerado o tipo.

//Obs.: resposta_usuario1 é o mesmo código do resposta_usuario, mas tive que 
// colocar um 1 no resposta_usuario, pois let não deixar ter valores repitidos.










