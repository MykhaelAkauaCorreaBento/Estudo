//Exemplo prático: Tabela de classificação

//

let tabela = [
    {equipe: 'Time Azul', pontos: 25 },
    {equipe: 'Time Verde', pontos: 47 },
    {equipe: 'Time Amarelo', pontos: 39 },
    {equipe: 'Time Vermelho', pontos: 16 },
];

function ordenaMaisPontos(a, b){
    return b.pontos - a.pontos;
}

tabela.sort(ordenaMaisPontos);


for(let i=0; i < tabela.length; i++){
    let posicao = i+1;
    console.log(posicao+" | "+tabela[i].equipe+" - "+tabela[i].pontos+" pts");

}


//Obs.:O método sort vai comparar todos os itens do array aplicando a regra
//de ordenação definida.

//O sort é um recurso que nos permite organizar dados de um array de uma
//forma simples e rápida através de funções padrão que determinam as regras de ordenação do array.

//exemplo-pratico-sort.js