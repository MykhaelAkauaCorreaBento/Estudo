//Código das funções que seram utilizadas no exemplo

const verifica_dada_range =(data, data_inicio, data_fim, tipo_comparacao) =>{
    if(tipo_comparacao == "and"){
        return (data >= data_inicio && data <= data_fim);
    }else if( tipo_comparacao == "or"){
        return(data >= data_inicio || data <= data_fim);
    }
}

const retorna_signo = (signo, data) =>{
    let ano = data.getFullyear();

    for(signo of signo){
        let data_inicio_signo = new Date(ano+ "-" + signo["DataInicio"] + "00:00:00");
        let data_fim_signo = new Date(ano + "-" + signo["DataFim"] + "23:59:59");
        let tipo_comparacao = signo["DataInicio"] == "12-12" ? "or" : "and";
        
        if(verifica_dada_range(data, data_inicio_signo, data_fim_signo, tipo_comparacao)){
            return signo["Nome"];
        }
    }
}

//Utilizar funções ajudam na produtividade na hora de programar

//introducao-das-funcoes.js