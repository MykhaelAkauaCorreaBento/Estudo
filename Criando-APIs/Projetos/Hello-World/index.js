//(---Nossa aplicação é dividida em 3 seções.---)


//1ª)A primeira seção é responsável por preparar
//o express - o tornar utilizável dentro da
//nossa aplicação.


const express = require("express");
const app = express();

//(---------------------------------------------------)

//2ª)Na segunda seção utilizamos a função get 
//contida na variável app, que
//pertence ao express.

//A função get recebe uma requisição do front-end
//e devolve uma resposta para o mesmo.
//O back-end se conecta com o front-end através
//do método get.

app.get("/", (req, res) =>{
    res.send("Hello, Wolrd! Mykhael está aprendendo programação back-end.");
});
//(---------------------------------------------------)


//3ª) Na última seção utilizamos a função listen do express, através da variável
//app.
//A função listen faz a nossa aplicação monitorar as requisições através de
//uma porta HTTP.
//Em nosso exemplo, optamos pela porta 8080 por ser muito utilizada em 
//ambientes de teste.
//A função listen recebe dois parâmetros
//O primeiro é a porta que o servidor ficará monitorando requisições.
//app.listen(8080,
//O segundo é uma função que será executada quando iniciarmos a aplicação.

app.listen(8080, () =>{
    let data = new Date();
    console.log("Servidor node iniciado em: " + data);
});

//http://localhost:8080/