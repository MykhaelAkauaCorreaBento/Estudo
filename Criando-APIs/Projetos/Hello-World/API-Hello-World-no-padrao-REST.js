//API Hello World! no padrão REST

//Este é o código da nossa aplicação antes da alteração

const express = require("express");
const app = express();

app.get("/", (req, res) =>{
    res.json({mensagem: "Olá, mundo"});
});



app.listen(8080, () =>{
    let data = new Date();
    console.log("Servidor node iniciado em: " + data);
});

//http://localhost:8080/


//Resultado da aplicação no Postman

//{
//    "mensagem": "Olá, mundo"
//}


//Substituímos em nossa aplicação o método send() pelo método json(),
//para que ela retorne ao front-end dados no formato JSON. Com isso,
//nossa aplicação passa a estar totalmente no padrão REST.

//API-Hello-World-no-padrao-REST.js