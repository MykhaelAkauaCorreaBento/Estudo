//.reduce()

//A função reduce reduz um array a um único valor. Por exemplo:

const jogos = [
    {id:1, nome:"Galaxian", anoLancamento:1979},
    {id:2, nome:"Donkey Kong", anoLancamento:1981},
    {id:3, nome:"Ms. Pac-Man", anoLancamento:1981},
    {id:4, nome:"Asteroids", anoLancamento:1979},
];

function retornaNomesJogos(nomes, jogo){//A redução do array a um único valor é feita através de uma função. No nosso caso retornaNomesJogos.
    return nomes + jogo.nome + ", ";
}

const nomesJogos = jogos.reduce(retornaNomesJogos, "");


console.log(nomesJogos.slice(0, -2));

//Utilizamos a função reduce para concatenar os nomes dos jogos do array jogos.

//const nomesJogos --> Uma única string com os nomes dos jogos.

//jogos--> array que será percorrida.

//reduce--> função.

//retornaNomesJogos,--> função que será executada.

//""--> valor inicial que será somado.
//-------------------------------------------------


//a função nativa reduce executa uma função para cada elemento do array.

function retornaNomesJogos(nomes, jogo){
return nomes + jogo.nome + ", ";
}

//nomes--> valor que está sendo concatenado.

//jogos--> elemento do array que está sendo iterado.

//return nomes + jogo.nome + ", ";--> repaque que a função retorna o novo valor que será concatenado na proxima vez que a função for chamada.

//exemplo.reduce.js