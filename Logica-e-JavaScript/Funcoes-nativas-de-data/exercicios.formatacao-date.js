//Uso real dos parâmetros

const dataAtual = new Date();

const personalizandoData = {

    weekday:'long',
    month:"2-digit",
    year:'2-digit',
    day:'2-digit',
};

console.log(dataAtual.toLocaleDateString('pt-BR', personalizandoData));

const personalizandoTempo = {

    hour:'numeric',
    minute:'numeric',
    second:'numeric',
};

console.log(dataAtual.toLocaleTimeString('pt-BR', personalizandoTempo));

 const personalizandoDataTempo = {

  dateStyle:"medium",
  timeStyle:"short",
};

console.log(dataAtual.toLocaleString('pt-BR', personalizandoDataTempo));

const MesAno ={

   month:"numeric",
   year: 'numeric',
};

console.log(dataAtual.toLocaleString('pt-BR', MesAno));

const SemanaHora = {

    weekdar:"long",
    hour:'numeric',
    minute:'numeric',
};

console.log(dataAtual.toLocaleString('pt-BR', SemanaHora));

//Através dos getters de conversão conseguimos retornar uma
//string com a data personalizada

//exercicios.formatacao-date.js