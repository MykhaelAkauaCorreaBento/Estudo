//Função que atualiza a palavra oculta
function atualizarPalavraOculta(palavraOculta, letraDigitada, palavraEscolhida){
    let palavraOcultaArray = palavraOculta.split('')

    for(let i = 0; i < palavraEscolhida.length; i++){
        if(palavraEscolhida[i] === letraDigitada){
            palavraOcultaArray[i] = letraDigitada
        }
    }
    return palavraOcultaArray.join('')
}

//Função verifica se a letra digitada é um caractere único e alfabético

function validarLetraDigitada(letraDigitada){
    if(letraDigitada.length === 1 && letraDigitada.match(/[a-z]/)){
        return true
    }else{
        return false
    }
}

function verificarJogoGanho(palavraOculta, palavraEscolhida){
    if(palavraOculta === palavraEscolhida){
        return true
    }else{
        return false
    }
}

//Funçao verificar se a letra digitada encontra-se na palavra escolhida

function verificarLetraPresenteNaPalavra(palavraEscolhida, letraDigitada){
    if(palavraEscolhida.includes(letraDigitada)){
        return true
    }else{
        return false
    }
}

function jogadasRestantes(erros){
    return 4 - erros
}

//Função verifica se o status do jogo e imprimi uma mensagem informando se o jogo
//terminou em vitória ou derrota

function exibirMensagemFimDeJogo(statusJogo){
    if(statusJogo === 'venceu'){
        console.log("\n--------------VOCÊ VENCEU!!-------------");
    }else{
        console.log("\n--------------VOCÊ PERDEU!!-------------");
    }
}

export{
    validarLetraDigitada,
    verificarJogoGanho,
    verificarLetraPresenteNaPalavra,
    jogadasRestantes,
    atualizarPalavraOculta,
    exibirMensagemFimDeJogo
};