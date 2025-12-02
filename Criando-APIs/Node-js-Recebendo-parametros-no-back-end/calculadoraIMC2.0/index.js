const express = require('express');
const app = express();

const calculadoraIMC = require('./funcoes/calculadoraIMC.js');

app.get('/', (req, res) => {
    let peso = req.query.peso;
    let altura = req.query.altura;

    if(calculadoraIMC.validaParametro(req.query.peso) && calculadoraIMC.validaParametro(req.query.altura))
    {
        let imc = calculadoraIMC.efetuarCalculoIMC(peso, altura);
        let status = calculadoraIMC.retornaStatusIMC(imc);

        let json = {imc: imc, status: status};

        res.json(json);
    }
    else
    {
        res.status(400).json({'Erro':'Peso ou altura inválidos.'});
    }
});

app.listen(8080 , () => {
    let data = new Date();
    console.log('Servidor node iniciado em: ' + data);
});

//Obs.: Saber como tratar corretamente os parâmetros é essencial para construção
//de aplicações que requerem interação entre o front-end e a API back-end.
//Também é importante estar sempre de olho em como o código pode ser
//melhorado, e sendo necessário, efetuar uma refatoração:
//
//app.get('/', (req, res) => {
//let peso = req.query.peso;
//let altura = req.query.altura;

//let imc = calculadoraIMC.efetuarCalculoIMC(peso, altura);

//res.json({imc: imc});
//});