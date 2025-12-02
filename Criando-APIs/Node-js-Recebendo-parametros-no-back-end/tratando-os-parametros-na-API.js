//Tratando os parâmetros na API


//Ao final da aula anterior vimos que a API já estava
//recebendo corretamente o JSON como os  parâmetros enviados pelo front-end

//Agora veremos como tratar esses parâmetos para construir a aplicação

//Assim é como o código vai ficar na API depois das alterações. Vamos entendê-lo
//parte a parte


app.get("/", (req, res)=>{
     let peso = req.query.peso;
     let altura = req.query.altura;

     let imc = peso /(altura * altura);
     res.json({imc: imc});
});

//Aqui declaramos duas variáveis, peso e altura. Veja que utilizamos req.query
//mas a chave para acessar o valor do parâmetro

//     let peso = req.query.peso;
//     let altura = req.query.altura;

//peso é definido em kg
//altura é definido em metros

//A chave deve ser a mesma enviada pelo front-end

//Com esses valores definidos podemos usar os parâmetros para
//desenvoler a aplicação

//app.get("/", (req, res)=>{
//     let peso = req.query.peso;
//     let altura = req.query.altura;
//
//     let imc = peso /(altura * altura);
//     res.json({imc: imc});
//});


//Esse é o código principal da aplicação, é onde o IMC é calculado IMC = peso / altura2

//E aqui é onde enviamos a resposta de volta para o front-end com o imc calculado

//res.json({imc: imc});

//Dessa forma conseguimos utilizar parâmetros enviados pelo front-end na nossa API

