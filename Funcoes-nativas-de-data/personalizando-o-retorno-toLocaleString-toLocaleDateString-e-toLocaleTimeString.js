//(----Personalizando o retorno toLocaleString, toLocaleDateString e toLocaleTimeString)

const dataAtual = new Date();

const options = {
    weekday:'long',
    year:'numeric',
    month:'long',
    day:'numeric',
};

const option ={
    hour:'2-digit',
    minute:'2-digit',
    second:'2-digit',
};

const opcao ={
    hour:"2-digit",
    minute:'2-digit',
    second:'2-digit',
    weekday:'long',
    month:'numeric',
    year:'numeric',
    day:'numeric',
}

console.log(dataAtual.toLocaleDateString('en-US', options));

console.log("\n"+dataAtual.toLocaleTimeString('en-US', option));

console.log("\n"+dataAtual.toLocaleString('pt-BR', opcao));
//personalizando-o-retorno-toLocaleString-toLocaleDateString-e-toLocaleTimeString.js