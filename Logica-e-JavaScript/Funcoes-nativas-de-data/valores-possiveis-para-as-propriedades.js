//Valores possíveis para as propriedades

const dataAtual = new Date();

const personalizandoData ={

    weekday:"long",
    weekday:"short",
    weekday:"narrow",    
    
    month:"numeric",
    month:"2-digit",
    month:"long",
    month:"short",
    month:"narrow",

    year:"numeric",
    year:"2-digit",

    day:"numeric",
    day:"2-digit",

};

console.log(dataAtual.toLocaleDateString("pt-BR", personalizandoData));

const personalizandoTempo = {

    hour:"numeric",
    hour:"2-digit",

    minute:"numeric",
    minute:"2-digit",

    second:"numeric",
    second:"2-digit",

};

console.log(dataAtual.toLocaleTimeString("pt-BR", personalizandoTempo));

const personalizandoDataTempo = {

    dateStyle:"full",
    dateStyle:"long",
    dateStyle:"medium",
    dateStyle:"short",

    timeStyle:"full",
    timeStyle:"long",
    timeStyle:"medium",
    timeStyle:"short",
};

console.log(dataAtual.toLocaleString("pt-BR", personalizandoDataTempo));


//valores-possiveis-para-as-propriedades.js