//valores que podemos passar para os métodos toLocaleString,
// toLocaleDateString e toLocaleTimeString para personalizar o retorno.

 //(----Valores dos parâmetros options----)


//(-----toLocaleString e toLocaleDateString-----)

const options1 ={

//weekday
weekday:'long',//"segunda-feira"
weekday:'short',//"seg."
weekday:'narrow',//"S"

};

const options2 ={

//day
day:'numeric',// 1
day:'2-digit',// 01

};

const options3 ={

//month
month:"numeric", //2
month:"2-digit",//02
month:"long",//Março
month:"short",//Mar
month:"narrow",//M

};

const options4 ={

//year
    year:'numeric',//2020
    year:'2-digit',//20

};

//______________________________________________________________________________
//(-----toLocaleString e toLocaleDateString-----)



const options5 ={

//dateStyle    
dateStyle:"full",//segunda-feira, 9 de novembro de 2020
dateStyle:"long",//9 de novembro de 2020
dateStyle:"medium",//9 de nov. de 2020
dateStyle:"short",//09/11/2020
};

//______________________________________________________________________________

//(-----toLocaleString e toLocaleTimeString-----)

const options6 ={

//hour
hour:'numeric', //1
hour:'2-digit'//01

};


const options7 ={

//second
second:'numeric', //1
second:'2-digit',//01

};



const options8 ={

//minute
minute:'numeric', //1
minute:'2-digit',//01

};
//______________________________________________________________________________

//(-----toLocaleString e toLocaleTimeString-----)


const options9 ={

//timeStyle
timeStyle:"full",//01:05:09 Horário Padrão de Brasília
timeStyle:"long",//01:05:09 BRT
timeStyle:"medium",//01:05:09
timeStyle:"short",//01:05
};

//______________________________________________________________________________


//Exemplo

const dataAtual = new Date();

const MesAno = {
    month:"numeric",
    year:"numeric",
};

console.log(dataAtual.toLocaleString("en-US", MesAno));
//Vai imprimir 11/2025

const SemanaHora = {
    weekday:"long",
    hour:"numeric",
    minute:"numeric",

}

console.log(dataAtual.toLocaleString("en-US", SemanaHora));
//Vai imprimir Saturday 3:15 PM



//Obs.:A ordem impressa pelo método .toLocaleString() será baseada
//no idioma indicado.

//Padrão brasileiro
//"11 de novembro de 2020 15:23:58 BRT"

//Padrão americano
//"November 11, 2020 at 3:23:58 PM GMT-3"


 //valores-dos-parametros-options.js

