//index.js

import entradaDados from "readline-sync";
import listaDeMonstros from "./dados/dados.js";
import{
    validarLetraDigitada,
    verificarJogoGanho,
    verificarLetraPresenteNaPalavra,
    jogadasRestantes,
    atualizarPalavraOculta,
    exibirMensagemFimDeJogo
} from "./funcoes/funcoes.js";

// Função principal do jogo.

function jogarForca(){

// Escolhe aleatoriamente uma palavra da lista
    const palavraEscolhida = listaDeMonstros[Math.floor(Math.random() * listaDeMonstros.length)];


// Oculta a palavra escolhida com 'underlines' deixando visivel somente a letra inicial

let primeiraLetra = palavraEscolhida[0]
let underline = "_".repeat(palavraEscolhida.length - 1)
let palavraOculta = primeiraLetra + underline

let erros = 0;
//Jogo inicia com o status 'andamento'.
let statusJogo = 'andamento'

console.log(`------------JOGO DA FORCA------------`);
console.log(`\nNome do Monstro com ${palavraEscolhida.length} letras:`);

// Loop continua enquanto o status do jogo estiver em 'andamento'
 while (statusJogo === 'andamento'){
    console.log(`\nMonstro: ${palavraOculta}`);

// Recebe a letra digitada pelo usuário aceitando tanto maiuscula quanto minuscula
    const letraDigitada = entradaDados.question("Digite uma letra: ").toLowerCase();

    if(validarLetraDigitada(letraDigitada)){
        if(verificarLetraPresenteNaPalavra(palavraEscolhida, letraDigitada)){
            palavraOculta = atualizarPalavraOculta(palavraOculta, letraDigitada, palavraEscolhida);
            if(verificarJogoGanho(palavraOculta, palavraEscolhida)){
                statusJogo = 'venceu'
            }
        
        }else{
            erros++
            const chances = jogadasRestantes(erros)

            if(chances > 0){
                console.log(`OPÇÃO ERRADA! Você ainda tem ${chances} chance(s)!`);
            }else{
                statusJogo = 'perdeu'
            }
        }
    }else{
        console.log("\nPor favor, digite uma letra válida.");
    }
 }
// Consumindo função que exibe uma mensagem de vitoria ou derrota
exibirMensagemFimDeJogo(statusJogo);

}

//Inicia o jogo
jogarForca();