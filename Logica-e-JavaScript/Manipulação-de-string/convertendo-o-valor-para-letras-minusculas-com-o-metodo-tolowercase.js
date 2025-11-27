//Exemplo prático

let email_acesso="mykhael@gmail.com";
let email_cadastro="Mykhael@gamil.com";


//As duas variáveis tiveram seus caracteres convertidos para minúsculos.

if(email_acesso.toLowerCase() == email_cadastro.toLowerCase()){
//    
    
    console.log("Foi enviado um link de ativação para o seu email");
}else{
    console.log("Esse email não existe em nossa base de dados");
}

//convertendo-o-valor-para-letras-minusculas-com-o-metodo-tolowercase.js