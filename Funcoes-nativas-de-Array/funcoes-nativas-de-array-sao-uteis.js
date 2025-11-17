//Funções nativas de array são úteis?

//Existem alguns códigos que utilizamos diversas vezes. Por exemplo:
const diasDaSemana =["domingo", "segunda-feira", "terça-feira", "quarta-feira", "quinta-feira", "sexta-feira", "sábado"];

for(let index = 0; index < diasDaSemana.length; index++){
    const dia = diasDaSemana[index];
    console.log(dia);
}

//Aqui utilizamos o 'for'. Criamos um index, inserimos a condição para o loop
//percorrer e incrementamos o index.

//Obs.:Escrever esse código todas as vezes é muito trabalhoso e mais
//suscetível a erros. Por isso existe uma função nativa pronta.

const diasDaSemana = ["domingo", "segunda-feira", "terça-feira", "quarta-feira", "quinta-feira", "sexta-feira", "sábado"];

diasDaSemana.map((dia)=> console.log(dia));

//.map--> Função nativa para percorrer uma array.
//______________________________________________________________________________

//Veja outro exemplo:

//Dessa vez vamos adicionar um novo elementro no array.

//Sem função nativa

const diasDaSemana = ["domingo", "segunda-feira", "terça-feira", "quarta-feira", "quinta-feira", "sexta-feira"];
const total = diasDaSemana.length;
diasDaSemana[total] = "sábado";

//Com uma função nativa (push)

const diasDaSemana = ["domingo", "segunda-feira", "terça-feira", "quarta-feira", "quinta-feira", "sexta-feira"];
diasDaSemana.push("sábado");


//Utilizar as funções nativas reduz códigos repetitivos e agilizaa o processo
//de desenvolvimento.

//Obs.:Todo array possui funções nativas. Essas funções são chamadas de
//métodos de array.

//As vantagens do uso das funções nativas (métodos de array) são:

//Redução do código repetitivo.
//Economia de tempo.
//Aceleração no processo de desenvolvimento.


//funcoes-nativas-de-array-sao-uteis.js