const express = require("express");

const app = express();

const conversorTemperatura = require("./funcoes/conversorTemperatura.js");


app.get('/', (req, res) => {
    let temperatura = req.query.temperatura;
    let conversor = req.query.conversor;

    let temperaturaGraus = conversorTemperatura.converteTemperatura(temperatura, conversor);

    let json = {temperatura: temperaturaGraus};

    res.json(json);
});

app.listen(8080 , () => {
    let data = new Date();
    console.log('Servidor node iniciado em: ' + data);
});


//Obs.: Aplicações que precisam de comunicação entre o front-end e a API são
//as mais comuns no mercado da programação, por isso, é importante saber 
//utilizar esses recursos. Ao construir esse conversor de temperatura você
//deu mais um passo na sua carreira como programador.